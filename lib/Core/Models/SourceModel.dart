import 'package:json_annotation/json_annotation.dart';

part 'SourceModel.g.dart';

@JsonSerializable()
class SourceModel{
  String? id;
  String? name;


  SourceModel({
    required this.id,
    required this.name,
  });

  factory SourceModel.fromJson(Map<String,dynamic> map) => _$SourceModelFromJson(map);
  Map<String,dynamic> toJson() => _$SourceModelToJson(this);
}