import 'package:flutter/cupertino.dart';
import 'package:readmore/readmore.dart';
import 'package:spotlastask/model/users_list_model.dart';
import 'package:spotlastask/widgets/app_text_style.dart';
import 'package:spotlastask/widgets/colors.dart';
import 'package:spotlastask/widgets/constant.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    String spaces(n) => List.filled(n + 1, ' ').join();
    return Padding(
      padding: const EdgeInsets.only(left: Constant.s, right: Constant.s),
      child: Stack(children: [
        AppTextStyle(
          text: userModel.author!.username!,
          color: AppColors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReadMoreText(
              spaces(userModel.author!.username!.length * 2 + 2) +
                  userModel.caption!.text!,
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimCollapsedText: ' more',
              trimExpandedText: '  less',
              lessStyle: const TextStyle(
                fontSize: 15,
                color: AppColors.shuttleGrey,
                fontFamily: 'SFPRODISPLAY',
              ),
              moreStyle: const TextStyle(
                fontSize: 15,
                color: AppColors.shuttleGrey,
              ),
              style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.black,
                  fontFamily: 'SFPRODISPLAY'),
            ),
          ],
        )
      ]),
    );
  }
}
