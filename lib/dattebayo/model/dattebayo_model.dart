import 'package:json_annotation/json_annotation.dart';

part 'dattebayo_model.g.dart';

@JsonSerializable()
class DattebayoModel {
  final String name;
  final String image;

  DattebayoModel(this.name, this.image);

  factory DattebayoModel.fromJson(Map<String, dynamic> json) =>
      _$DattebayoModelFromJson(json);
}
