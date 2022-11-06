// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reddit _$RedditFromJson(Map<String, dynamic> json) => Reddit(
      id: json['id'] as String?,
      title: json['title'] as String?,
      thumbnail: json['thumbnail'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$RedditToJson(Reddit instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'description': instance.description,
    };
