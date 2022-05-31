import 'package:flutter/material.dart';
import 'package:spotlastask/widgets/app_text_style.dart';
import 'package:spotlastask/widgets/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      floating: true,
      snap: true,
      elevation: 0,
      backgroundColor: AppColors.white,
      centerTitle: false,
      title: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Align(
          child: AppTextStyle(
            text: 'Feed',
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
