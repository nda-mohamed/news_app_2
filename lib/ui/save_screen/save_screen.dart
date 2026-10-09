import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_2/core/app_color/app_color.dart';
import 'package:news_app_2/core/widgets/news_item.dart';
import 'package:news_app_2/ui/home_screen/home_cubit.dart';
import 'package:news_app_2/ui/home_screen/home_state.dart';
import '../home_screen/home_details_screen/home_details_screen.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        centerTitle: true,
        title: Text(
          'Saved Articles',
          style: TextStyle(
            color: AppColor.primary_navy,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          List savedList = [];
          if (state is HomeSuccess) {
            savedList = state.savedArticles;
          }

          if (savedList.isEmpty) {
            return const Center(
              child: Text(
                'No saved articles yet!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetails(model: savedList[index]),
                    ),
                  );
                },
                child: NewsItem(article: savedList[index]),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: savedList.length,
          );
        },
      ),
    );
  }
}