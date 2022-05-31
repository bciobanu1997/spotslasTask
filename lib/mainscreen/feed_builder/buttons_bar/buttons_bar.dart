import 'package:flutter/material.dart';
import 'package:spotlastask/widgets/app_icon_button.dart';
import 'package:spotlastask/widgets/colors.dart';
import 'package:spotlastask/widgets/constant.dart';
import 'package:spotlastask/widgets/svg_images.dart';

class ButtonsBar extends StatelessWidget {
  const ButtonsBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: Constant.m, horizontal: Constant.xxl),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppIconButton(
            image: SvgImages.map,
            color: AppColors.black,
            size: 24,
            action: () {},
          ),
          AppIconButton(
            image: SvgImages.speech,
            color: AppColors.black,
            size: 24,
            action: () {},
          ),
          AppIconButton(
            image: SvgImages.heartBorder,
            color: AppColors.black,
            size: 24,
            action: () {},
          ),
          AppIconButton(
            image: SvgImages.paperPlaneBorder,
            color: AppColors.black,
            size: 24,
            action: () {},
          )
        ],
      ),
    );
  }
}
