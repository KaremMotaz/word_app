part of 'read_data_cubit.dart';

@immutable
sealed class ReadDataState {}

final class ReadDataInitialState extends ReadDataState {}

final class ReadDataLoadingState extends ReadDataState {}

final class ReadDataSuccessState extends ReadDataState {
  final List<WordModel> words;

  ReadDataSuccessState({required this.words});
}

final class ReadDataFailureState extends ReadDataState {
  final String message;

  ReadDataFailureState({required this.message});
}
