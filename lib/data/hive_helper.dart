import 'package:hive/hive.dart';
import '../harry/model/harry_model.dart';

class HiveHelper {
  static const _boxName = 'harry_box';
  static const _key = 'characters';

  List<HarryModel> getList() {
    final box = Hive.box<List>(_boxName);
    return box.get(_key)?.cast<HarryModel>() ?? [];
  }

  Future<void> saveList(List<HarryModel> list) async {
    final box = Hive.box<List>(_boxName);
    await box.put(_key, list);
  }
}
