part of 'reddit_bloc.dart';

enum RedditStatus { initial, success, failure }

class RedditState extends Equatable {
  const RedditState({
    this.status = RedditStatus.initial,
    this.reddits = const <KindRedditData>[],
    this.hasReachedMax = false,
  });

  final RedditStatus status;
  final List<KindRedditData> reddits;
  final bool hasReachedMax;

  RedditState copyWith({
    RedditStatus? status,
    List<KindRedditData>? reddits,
    bool? hasReachedMax,
  }) {
    return RedditState(
      status: status ?? this.status,
      reddits: reddits ?? this.reddits,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, reddits, hasReachedMax];
}
