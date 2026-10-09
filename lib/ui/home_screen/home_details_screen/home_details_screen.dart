import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_2/core/app_color/app_color.dart';
import 'package:news_app_2/core/widgets/circle_icon.dart';
import '../../../models/article_model.dart';
import '../home_cubit.dart';
import '../home_state.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key, required this.model});

  final ArticleModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,

      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        leading: BackButton(color: AppColor.primary_navy,),
        centerTitle: true,
        title: Text(
          'News Details',
          style: TextStyle(
            color: AppColor.primary_navy,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              bool isSaved = context.read<HomeCubit>().isArticleSaved(model);
              return CircleIcon(
                icon: isSaved ? Icons.bookmark : Icons.bookmark_border_rounded,
                onPressed: () {
                  context.read<HomeCubit>().toggleSaveArticle(model);
                },
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(model.image ?? '',
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error, color: Colors.red);
                },
              ),
            ),

            Text(
              model.author ?? 'Nada Mohamed',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            Text(
              model.date ?? 'date',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),

            Text(
              model.description ?? 'description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 8),

            Text(
              model.content ?? 'content',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
