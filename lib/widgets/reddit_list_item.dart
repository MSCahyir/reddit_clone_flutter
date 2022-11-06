import 'package:RedditApp/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:RedditApp/models/reddit.dart';
import 'package:RedditApp/utils/Colors.dart';
import 'package:RedditApp/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';

class RedditListItem extends StatelessWidget {
  const RedditListItem({super.key, required this.reddit});

  final Reddit reddit;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(radiusCircular(defaultRadius)),
          color: BodyDark),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 54,
                  ),
                  12.width,
                  Text(reddit.id!, style: boldTextStyle()),
                  4.width,
                  Text("5 min ago",
                      style: secondaryTextStyle(color: BodyWhite, size: 12)),
                ],
              ).paddingSymmetric(horizontal: 16),
            ],
          ),
          16.height,
          reddit.title.validate().isNotEmpty
              ? robotoText(
                      text: reddit.title.validate(), textAlign: TextAlign.start)
                  .paddingSymmetric(horizontal: 16)
              : Offstage(),
          reddit.title.validate().isNotEmpty ? 16.height : Offstage(),
          reddit.thumbnail != "self"
              ? Image.network(
                  reddit.thumbnail.validate(),
                  height: 300,
                  width: context.width() - 32,
                  fit: BoxFit.cover,
                ).cornerRadiusWithClipRRect(AppCommonRadius).center()
              : Offstage(),
          Divider(indent: 16, endIndent: 16, height: 20),
        ],
      ),
    );
  }
}
