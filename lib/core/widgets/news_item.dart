import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, this.article});

  final dynamic article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        spacing: 12,
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                article.image ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBfA2wCTbjT-HA4iF3nNo-FsbgvjC0Gx_2SZuYC0y9nQ&s=10',
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.author ?? 'Nada Mohamed',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),

                Text(
                  article.description ?? 'Description',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),

                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: Text(
                    article.date ?? 'date',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFD2B0B0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
