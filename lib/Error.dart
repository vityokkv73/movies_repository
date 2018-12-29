import 'package:json_annotation/json_annotation.dart';

part 'Error.g.dart';

@JsonSerializable(includeIfNull: false)
class Error {
  @JsonKey(name: "status_message")
  String statusMessage;
  @JsonKey(name: "status_code")
  int statusCode;

  Error(this.statusMessage, this.statusCode);

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
}