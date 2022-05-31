import 'package:flutter/material.dart';
import 'package:spotlastask/model/users_list_model.dart';
import 'package:spotlastask/widgets/avatar_circle_box.dart';
import 'package:spotlastask/widgets/colors.dart';
import 'package:spotlastask/widgets/constant.dart';
import 'package:spotlastask/widgets/svg_images.dart';

class UserNameDetails extends StatelessWidget {
  UserNameDetails({Key? key, required this.userModel}) : super(key: key);
  UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: Constant.s, top: Constant.s, right: Constant.l),
          child: AvatarCircleBox(
            title: userModel.author!.username!,
            titleColor: AppColors.white,
            subtitle: userModel.author!.fullName!,
            subtitleColor: AppColors.desertStorm,
            photoUrl: userModel.author!.photoUrl!,
            buttonIcon: SvgImages.options,
            buttonIconColor: AppColors.white,
            borderColor: AppColors.pink,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: Constant.s, bottom: Constant.s, right: Constant.l),
          child: AvatarCircleBox(
            title: userModel.spot!.name!,
            titleColor: AppColors.white,
            subtitle: userModel.spot!.location!.display!,
            subtitleColor: AppColors.desertStorm,
            photoUrl: userModel.spot!.logo!.url!,
            buttonIcon: SvgImages.heartBorder,
            buttonIconColor: AppColors.white,
            borderColor: AppColors.white,
          ),
        ),
      ],
    );
  }
}
