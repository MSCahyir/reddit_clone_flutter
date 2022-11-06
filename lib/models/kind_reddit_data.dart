// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:RedditApp/models/reddit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kind_reddit_data.g.dart';

@JsonSerializable()
class KindRedditData {
  final String? kind;
  final Reddit? data;

  KindRedditData({
    this.kind,
    this.data,
  });

  factory KindRedditData.fromJson(Map<String, dynamic> json) =>
      _$KindRedditDataFromJson(json);

  Map<String, dynamic> toJson() => _$KindRedditDataToJson(this);
}
