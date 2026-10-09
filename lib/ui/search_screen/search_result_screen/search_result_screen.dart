import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/app_color/app_color.dart';
import '../../../core/widgets/news_item.dart';
import '../../home_screen/home_cubit.dart';
import '../../home_screen/home_details_screen/home_details_screen.dart';
import '../../home_screen/home_state.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key,required this.query});

    final String query;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getSearchData(query: query),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          centerTitle: true,
          leading: BackButton(color: AppColor.primary_navy),
          title: Text(
            'Search Results',
            style: TextStyle(
              color: AppColor.primary_navy,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeFailure) {
              return Center(child: Text(state.message));
            }

            if (state is HomeSuccess) {
              if (state.data.isEmpty) {
                return const Center(child: Text('No results found'));
              }
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
                      child: NewsItem(article: state.data[index]));
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.data.length,
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
