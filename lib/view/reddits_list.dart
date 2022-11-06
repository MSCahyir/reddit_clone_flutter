import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:RedditApp/bloc/reddit_bloc.dart';
import 'package:RedditApp/service/reddit_service.dart';
import 'package:RedditApp/widgets/bottom_loader.dart';
import 'package:RedditApp/widgets/reddit_list_item.dart';
import 'package:http/http.dart' as http;

class RedditsList extends StatefulWidget {
  const RedditsList({super.key});

  @override
  State<RedditsList> createState() => _RedditsListState();
}

class _RedditsListState extends State<RedditsList> {
  RedditService redditService = RedditService();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RedditBloc, RedditState>(
      builder: (context, state) {
        switch (state.status) {
          case RedditStatus.failure:
            return const Center(child: Text('failed to fetch reddits'));
          case RedditStatus.success:
            return CustomScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              slivers: <Widget>[
                SliverAppBar(
                  title: Text(
                    "Reddit",
                    style: TextStyle(color: Colors.black),
                  ),
                  elevation: 3,
                  forceElevated: true,
                ),
                CupertinoSliverRefreshControl(
                  onRefresh: () async {
                    await refreshPage(redditService);
                    await Future.delayed(Duration(seconds: 1));
                  },
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.hasReachedMax
                        ? state.reddits.length
                        : state.reddits.length + 1,
                    (BuildContext context, int index) {
                      return index >= state.reddits.length
                          ? BottomLoader(
                              redditService: redditService,
                            )
                          : RedditListItem(reddit: state.reddits[index].data!);
                    },
                  ),
                )
              ],
            );
          case RedditStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

Future<bool> refreshPage(redditService) async {
  RedditBloc(httpClient: http.Client(), redditService: redditService)
    ..add(RedditFetched());
  return true;
}
