import 'dart:collection';

import 'package:RedditApp/models/kind_reddit_data.dart';
import 'package:RedditApp/service/base_service.dart';

class RedditService extends BaseService {
  Future<List<KindRedditData>> getRedditData(int count) async {
    var url = '/top.json?count={count}';
    url = url.replaceFirst('{count}', count.toString());
    final resp = await createDio().get(url);
    print(resp);
    final data = resp.data["data"]["children"];
    print(data);
    List newData = data;
    return (data as List)
        .map((reddit) => KindRedditData.fromJson(reddit))
        .toList();
  }
}
