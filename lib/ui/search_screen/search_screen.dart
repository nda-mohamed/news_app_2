import 'package:flutter/material.dart';
import 'package:news_app_2/ui/search_screen/search_result_screen/search_result_screen.dart';
import '../../core/app_color/app_color.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: searchController,
                onFieldSubmitted: (value) {
                  if (value.trim().isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchResultScreen(query: value),
                      ),
                    );
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF999999),
                  ),
                  prefixIcon: const Icon(
                    Icons.search_sharp,
                    color: Color(0xFF999999),
                  ),
                  filled: true,
                  fillColor: AppColor.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFE6E6E6)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFE6E6E6)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                searchController.clear();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primary_navy,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
