import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../tab_item.dart';
import '../count_style.dart';

class BuildIcon extends StatelessWidget {
  final TabItem item;
  final double iconSize;
  final Color iconColor;
  final CountStyle? countStyle;

  const BuildIcon({
    Key? key,
    required this.item,
    required this.iconColor,
    this.iconSize = 22,
    this.countStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget icon = (item.icon is String) ?SvgViewer(svgPath: item.icon,
      color: iconColor,
      height: iconSize ?? 30,
      width: iconSize ?? 30,
    ) : Icon(
      item.icon,
      size: iconSize,
      color: iconColor,
    );
    if (item.count is Widget) {
      double sizeBadge = countStyle?.size ?? 18;

      return Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(
            item.icon,
            size: iconSize,
            color: iconColor,
          ),
          PositionedDirectional(
            start: iconSize - sizeBadge / 2,
            top: -sizeBadge / 2,
            child: item.count!,
          ),
        ],
      );
    }
    return icon;
  }
}

class SvgViewer extends StatelessWidget {
  final String svgPath;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit fit;

  const SvgViewer(
      {
        required this.svgPath,
        this.height,
        this.width,
        this.color,
        this.fit = BoxFit.contain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      key: key,
      color: color,
      height: height ?? 30,
      width: width ?? 30,
      fit: fit,
    );
  }
}

