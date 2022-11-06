// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kind_reddit_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KindRedditData _$KindRedditDataFromJson(Map<String, dynamic> json) =>
    KindRedditData(
      kind: json['kind'] as String?,
      data: json['data'] == null
          ? null
          : Reddit.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KindRedditDataToJson(KindRedditData instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'data': instance.data,
    };
