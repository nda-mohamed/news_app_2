import '../../models/article_model.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<ArticleModel> data;
  HomeSuccess(this.data);
}

final class HomeFailure extends HomeState {
  final String message;
  HomeFailure(this.message);
}