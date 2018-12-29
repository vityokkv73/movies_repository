// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Error _$ErrorFromJson(Map<String, dynamic> json) {
  return Error(json['status_message'] as String, json['status_code'] as int);
}

Map<String, dynamic> _$ErrorToJson(Error instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status_message', instance.statusMessage);
  writeNotNull('status_code', instance.statusCode);
  return val;
}
