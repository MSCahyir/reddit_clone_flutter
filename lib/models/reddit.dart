// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'reddit.g.dart';

@JsonSerializable()
class Reddit {
  String? id;
  String? title;
  String? thumbnail;
  String? description;

  Reddit({
    this.id,
    this.title,
    this.thumbnail,
    this.description,
  });

  factory Reddit.fromJson(Map<String, dynamic> json) => _$RedditFromJson(json);

  Map<String, dynamic> toJson() => _$RedditToJson(this);
}
