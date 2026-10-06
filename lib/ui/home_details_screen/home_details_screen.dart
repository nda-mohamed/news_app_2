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

      appBar: AppBar(
        backgroundColor: AppColor.white,

        leading: BackButton(
          color: AppColor.primary_navy,
        ),

        centerTitle: true,
        title: Text(
          model.author ?? 'News Detail',
          style: TextStyle(
            color: AppColor.primary_navy,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        actions: [
          CircleAvatar(
            backgroundColor: AppColor.primary_navy,
            radius: 18,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.bookmark_border_rounded, color: AppColor.white),
              iconSize: 20,
            ),
          ),

          SizedBox(width: 8),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(model.image ?? ''),
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
