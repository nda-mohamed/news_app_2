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
        appBar: AppBar(backgroundColor: AppColor.white),

        body: BlocBuilder<HomeCubit, HomeState>(
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
                        MaterialPageRoute(builder: (context) => HomeDetails(model: state.data[index]),),
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
    );
  }
}
