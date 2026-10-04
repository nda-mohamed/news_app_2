import 'package:flutter/material.dart';
import 'package:news_app_2/core/app_color/app_color.dart';
import '../../models/article_model.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key, required this.model});

  final ArticleModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,

      appBar: AppBar(backgroundColor: AppColor.white, leading: BackButton()),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(model.image ?? ''),
            ),

            Text(model.author ?? 'Nada Mohamed'),

            Text(model.date ?? 'date'),

            Text(model.description ?? 'description'),

            Text(model.content ?? 'content'),
          ],
        ),
      ),
    );
  }
}
