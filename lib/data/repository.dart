import 'package:dio/dio.dart';

import '../harry/model/harry_model.dart';

class Repository {
  final dio = Dio();

  Future<List<HarryModel>> getCharacter() async {
    final response = await dio.get(
      'https://potterapi-fedeperin.vercel.app/en/characters',
    );
    final data = response.data;
    final List<HarryModel> list = (data as List)
        .map((item) => HarryModel.fromJson(item as Map<String, dynamic>))
        .toList();
    return list;
  }
}
