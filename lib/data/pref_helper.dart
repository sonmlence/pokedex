import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/harry/model/harry_model.dart';
class PrefHelper {
  Future<void> saveList(List<HarryModel> list) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded =
    list.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList('persons', encoded);
  }

  Future<List<HarryModel>> getList() async {
    final prefs = await SharedPreferences.getInstance();
    final persons = prefs.getStringList('persons');

    if (persons == null) return [];

    return persons
        .map((e) => HarryModel.fromJson(jsonDecode(e)))
        .toList();
  }
}
