import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_2/ui/home_screen/home_state.dart';
import '../../models/article_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final dio = Dio();

  Future<void> getHomeData() async {
    try {
      emit(HomeLoading());

      final Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {
          'apiKey': '6a2bfa8471a048ddab606150547fe945',
          'country': 'us',
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
}
