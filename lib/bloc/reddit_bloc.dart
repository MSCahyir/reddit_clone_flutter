import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:RedditApp/models/kind_reddit_data.dart';
import 'package:RedditApp/service/reddit_service.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

part 'reddit_event.dart';
part 'reddit_state.dart';

const _redditLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class RedditBloc extends Bloc<RedditEvent, RedditState> {
  RedditBloc({required this.httpClient, required this.redditService})
      : super(const RedditState()) {
    on<RedditFetched>(
      _onRedditFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final http.Client httpClient;
  final RedditService redditService;

  Future<void> _onRedditFetched(
    RedditFetched event,
    Emitter<RedditState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == RedditStatus.initial) {
        final reddits = await getReddits(10);
        return emit(
          state.copyWith(
            status: RedditStatus.success,
            reddits: reddits,
            hasReachedMax: false,
          ),
        );
      }
      final reddits = await getReddits(state.reddits.length);
      reddits.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: RedditStatus.success,
                reddits: List.of(state.reddits)..addAll(reddits),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: RedditStatus.failure));
    }
  }

  Future<List<KindRedditData>> getReddits(int count) async {
    var response = await redditService.getRedditData(count);
    print(response);
    return response;
  }
}
