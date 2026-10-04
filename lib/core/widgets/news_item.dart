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
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                article.image ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBfA2wCTbjT-HA4iF3nNo-FsbgvjC0Gx_2SZuYC0y9nQ&s=10',
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.author ?? 'Nada Mohamed',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                Text(
                  article.description ?? 'Description',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: Text(
                    article.date ?? 'date',
                    textAlign: TextAlign.end,
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
