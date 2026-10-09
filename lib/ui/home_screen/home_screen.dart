import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_2/core/app_color/app_color.dart';
import 'package:news_app_2/core/widgets/circle_icon.dart';
import 'package:news_app_2/core/widgets/news_item.dart';
import 'home_cubit.dart';
import 'home_details_screen/home_details_screen.dart';
import 'home_state.dart';

/////////////// apidata ////////////////////////////////////////////////
////////////// model data //////////////////////////////////////////////
///////////// package => flutter_bloc / dio ////////////////////////////
//////////// cubit - state /////////////////////////////////////////////
//////////// cubit => initial -> loading -> success -> failure /////////
//////////// BlocProvider => BlocBuilder - BlocConsumer - BlocListner //

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<String> categories = [
    'All',
    'Politics',
    'Sports',
    'Education',
    'Health',
    'Science',
    'Technology',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(query: null),

      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          actions: [
            CircleIcon(icon: Icons.notifications),
            SizedBox(width: 8),
          ],
        ),
        drawer: Drawer(backgroundColor: AppColor.primary_navy),
        body: Column(
          children: [
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
                    return Column(
                      children: [
                        SizedBox(
                          height: 40,
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentIndex = index;
                                  });

                                  if (categories[index] == 'All') {
                                    BlocProvider.of<HomeCubit>(context,).getHomeData(query: null);
                                  } else {
                                    BlocProvider.of<HomeCubit>(context,).getHomeData(query: categories[index]);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: currentIndex == index
                                        ? const Color(0xFFFFA500)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: currentIndex == index
                                          ? Colors.transparent
                                          : AppColor.primary_navy,
                                    ),
                                  ),
                                  child: Center(child: Text(categories[index])),
                                ),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(width: 12);
                            },
                            itemCount: categories.length,
                          ),
                        ),

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
                          child: ListView.separated(
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
                          ),
                        ),
                      ],
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
