import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'constant.dart';

class AppTextStyle extends StatelessWidget {
  const AppTextStyle(
      {Key? key,
      required this.text,
      this.fontSize,
      this.maxLines,
      this.color,
      this.fontWeight,
      this.alignment,
      this.bold = false,
      this.label = false,
      this.fontfamily})
      : super(key: key);
  final String text;
  final bool? bold;
  final double? fontSize;
  final int? maxLines;
  final bool? label;
  final Color? color;
  final FontWeight? fontWeight;
  final AlignmentGeometry? alignment;
  final String? fontfamily;
  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      style: TextStyle(
          fontFamily: (fontfamily == null) ? 'SFPRODISPLAY' : fontfamily,
          fontSize: (label == true)
              ? Constant.big
              : (fontSize == null)
                  ? Constant.medium
                  : fontSize,
          fontWeight: (fontWeight != null)
              ? fontWeight
              : (label == true)
                  ? FontWeight.bold
                  : (bold == true)
                      ? FontWeight.bold
                      : FontWeight.normal,
          color: color),
      maxLines: (maxLines == null) ? null : maxLines,
      overflow: (maxLines == null) ? null : TextOverflow.ellipsis,
    );
  }
}
