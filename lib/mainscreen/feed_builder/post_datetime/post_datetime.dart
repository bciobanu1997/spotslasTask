import 'package:flutter/material.dart';
import 'package:spotlastask/model/users_list_model.dart';
import 'package:spotlastask/widgets/app_text_style.dart';
import 'package:spotlastask/widgets/colors.dart';
import 'package:spotlastask/widgets/constant.dart';

class PostDateTime extends StatelessWidget {
  const PostDateTime({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: Constant.s, left: Constant.s),
      child: AppTextStyle(
        text:
            '${Constant.date.difference(userModel.createdAt!).inDays} days ago',
        color: AppColors.chineseSilver,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
