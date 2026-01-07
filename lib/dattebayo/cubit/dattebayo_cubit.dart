import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/dattebayo_repository.dart';
import '../model/dattebayo_model.dart';

part 'dattebayo_state.dart';

class DattebayoCubit extends Cubit<DattebayoState> {
  DattebayoCubit() : super(DattebayoInitial());

  void getCharacters() {
    emit(DattebayoLoading(isLoading: true));
    final repository = DattebayoRepository();

    repository
        .getCharacter()
        .then((characters) {
      emit(DattebayoSuccess(characters));
    })
        .catchError((error) {
      emit(DattebayoError(error.toString()));
    });
  }

  void setLoading() {
    emit(DattebayoLoading(isLoading: true));
  }
}
