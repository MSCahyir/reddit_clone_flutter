import 'package:RedditApp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

Widget robotoText(
    {required String text,
    Color? color,
    FontStyle? fontStyle,
    Function? onTap,
    TextAlign? textAlign}) {
  return Text(
    text,
    style: secondaryTextStyle(
      color: color ?? BodyWhite,
      fontStyle: fontStyle ?? FontStyle.normal,
    ),
    textAlign: textAlign ?? TextAlign.center,
  ).onTap(onTap,
      splashColor: Colors.transparent, highlightColor: Colors.transparent);
}
