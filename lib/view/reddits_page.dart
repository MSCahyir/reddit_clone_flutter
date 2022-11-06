import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:RedditApp/bloc/reddit_bloc.dart';
import 'package:RedditApp/service/reddit_service.dart';
import 'package:RedditApp/view/reddits_list.dart';
import 'package:http/http.dart' as http;

class RedditsPage extends StatefulWidget {
  const RedditsPage({super.key});

  @override
  State<RedditsPage> createState() => _RedditsPageState();
}

class _RedditsPageState extends State<RedditsPage> {
  RedditService redditService = RedditService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) =>
            RedditBloc(httpClient: http.Client(), redditService: redditService)
              ..add(RedditFetched()),
        child: const RedditsList(),
      ),
    );
  }
}
