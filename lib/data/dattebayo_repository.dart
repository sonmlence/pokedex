import 'package:dio/dio.dart';

import '../dattebayo/model/dattebayo_model.dart';

class DattebayoRepository {
  final dio = Dio();

  Future<List<DattebayoModel>> getCharacter() async {
    final response = await dio.get(
      'https://api-dattebayo.vercel.app/characters',
    );

    final data = response.data;
    final List<DattebayoModel> list = (data as List)
        .map((item) => DattebayoModel.fromJson(item as Map<String, dynamic>))
        .toList();

    return list;
  }
}
