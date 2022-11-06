part of 'reddit_bloc.dart';

abstract class RedditEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RedditFetched extends RedditEvent {}
