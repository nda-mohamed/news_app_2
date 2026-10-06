import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_2/core/app_color/app_color.dart';
import 'package:news_app_2/core/widgets/news_item.dart';
import '../home_details_screen/home_details_screen.dart';
import 'home_cubit.dart';
import 'home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  /////////////// apidata ////////////////////////////////////////////////
  ////////////// model data //////////////////////////////////////////////
  ///////////// package => flutter_bloc / dio ////////////////////////////
  //////////// cubit - state /////////////////////////////////////////////
  //////////// cubit => initial -> loading -> success -> failure /////////
  //////////// BlocProvider => BlocBuilder - BlocConsumer - BlocListner //

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),

      child: Scaffold(
        backgroundColor: AppColor.white,

        appBar: AppBar(
          backgroundColor: AppColor.white,
          actions: [
            CircleAvatar(
              backgroundColor: AppColor.primary_navy,
              radius: 18,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: AppColor.white),
                iconSize: 20,
              ),
            ),

            SizedBox(width: 8),

            CircleAvatar(
              backgroundColor: AppColor.primary_navy,
              radius: 18,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications, color: AppColor.white),
                iconSize: 20,
              ),
            ),

            SizedBox(width: 8),
          ],
        ),

        drawer: Drawer(backgroundColor: AppColor.primary_navy),

        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'News For You',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primary_navy,
                    ),
                  ),

                  Text(
                    'Show More',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C57F0),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (state is HomeFailure) {
                    return Center(child: Text(state.message));
                  }

                  if (state is HomeSuccess) {
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomeDetails(model: state.data[index]),
                              ),
                            );
                          },
                          child: NewsItem(article: state.data[index]),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: state.data.length,
                    );
                  }

                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
