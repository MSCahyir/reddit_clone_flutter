import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:RedditApp/bloc/reddit_bloc.dart';
import 'package:RedditApp/service/reddit_service.dart';

class BottomLoader extends StatefulWidget {
  RedditService redditService;
  BottomLoader({super.key, required this.redditService});

  @override
  State<BottomLoader> createState() => _BottomLoaderState();
}

class _BottomLoaderState extends State<BottomLoader> {
  @override
  void initState() {
    context.read<RedditBloc>().add(RedditFetched());
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}
