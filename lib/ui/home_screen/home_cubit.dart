import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_2/ui/home_screen/home_state.dart';
import '../../models/article_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final dio = Dio();

  ///////////////////////////////Home//////////////////////////////

  Future<void> getHomeData({required query}) async {
    try {
      emit(HomeLoading());

      // final Response response = await dio.get(
      //   'https://newsapi.org/v2/top-headlines',
      //   queryParameters: {
      //     'apiKey': '6a2bfa8471a048ddab606150547fe945',
      //     'country': 'us',
      //   },
      // );
      //////////////////////////////////////////////////////////////////////////
      // لو الـ query بـ null أو 'All'، بنجيب الـ top headlines العامة أو من غير category محدد
      // ولو فيه كاتيجوري (زي sports)، بنبعته للـ API في الـ category parameter
      Map<String, dynamic> queryParameters = {
        'apiKey': '6a2bfa8471a048ddab606150547fe945',
        'country': 'us',
      };

      if (query != null && query != 'All') {
        // NewsAPI بياخد الكاتيجوري حروف صغيرة (lowercase) زي 'sports', 'technology'
        queryParameters['category'] = query.toLowerCase();
      }

      final Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: queryParameters,
      );
      //////////////////////////////////////////////////////////////////////////

      final article = response.data['articles'] as List;
      final data = article.map((e) => ArticleModel.fromjson(e)).toList();

      emit(HomeSuccess(data));

    } on DioException catch (e) {
      emit(HomeFailure(e.message ?? 'Something went wrong'));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  ///////////////////////////////Search//////////////////////////////

  Future<void> getSearchData({String? query}) async {
    try {
      emit(HomeLoading());

      final Response response = await dio.get(
        'https://newsapi.org/v2/everything',
        queryParameters: {
          'apiKey': '6a2bfa8471a048ddab606150547fe945',
          'q': query,
        },
      );

      final article = response.data['articles'] as List;
      final data = article.map((e) => ArticleModel.fromjson(e)).toList();

      emit(HomeSuccess(data));

    } on DioException catch (e) {
      emit(HomeFailure(e.message ?? 'Something went wrong'));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  ///////////////////////////////Saved Articles//////////////////////////////

  final List<ArticleModel> savedArticles = [];

  void toggleSaveArticle(ArticleModel article) {
    if (savedArticles.contains(article)) {
      savedArticles.remove(article);
    } else {
      savedArticles.add(article);
    }

    if (state is HomeSuccess) {
      final currentState = state as HomeSuccess;
      emit(HomeSuccess(currentState.data, savedArticles: List.from(savedArticles)));
    } else {
      emit(HomeSuccess([], savedArticles: List.from(savedArticles)));
    }
  }

  bool isArticleSaved(ArticleModel article) {
    return savedArticles.contains(article);
  }

}
