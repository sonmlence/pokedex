import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/hive_helper.dart';
import '../../data/repository.dart';
import '../model/harry_model.dart';

part 'harry_state.dart';

class HarryCubit extends Cubit<HarryState> {
  HarryCubit() : super(HarryInitial());

  final Repository repository = Repository();
  final HiveHelper hive = HiveHelper();

  Future<void> getCharacters() async {
    emit(Loading());

    final cached = hive.getList();
    if (cached.isNotEmpty) {
      emit(Success(cached));
      return;
    }

    try {
      final list = await repository.getCharacter();
      await hive.saveList(list);
      emit(Success(list));
    } catch (e) {
      emit(Error('Нет интернета и нет кэша'));
    }
  }
}
