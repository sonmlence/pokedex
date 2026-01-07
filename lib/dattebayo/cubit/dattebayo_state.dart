part of 'dattebayo_cubit.dart';

@immutable
sealed class DattebayoState {}

final class DattebayoInitial extends DattebayoState {}

final class DattebayoLoading extends DattebayoState {
  final bool isLoading;

  DattebayoLoading({this.isLoading = false});
}

final class DattebayoSuccess extends DattebayoState {
  final List<DattebayoModel> listModels;

  DattebayoSuccess(this.listModels);
}

final class DattebayoError extends DattebayoState {
  final String message;

  DattebayoError(this.message);
}
