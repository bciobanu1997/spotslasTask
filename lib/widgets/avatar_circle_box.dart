import 'package:flutter/material.dart';
import 'package:spotlastask/widgets/app_icon_button.dart';
import 'package:spotlastask/widgets/app_text_style.dart';

class AvatarCircleBox extends StatelessWidget {
  const AvatarCircleBox({
    Key? key,
    required this.photoUrl,
    required this.title,
    required this.subtitle,
    required this.buttonIcon,
    required this.titleColor,
    required this.buttonIconColor,
    required this.subtitleColor,
    required this.borderColor,
  }) : super(key: key);
  final String photoUrl;
  final String title;
  final String subtitle;
  final String buttonIcon;
  final Color titleColor;
  final Color buttonIconColor;
  final Color subtitleColor;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: 3),
          ),
          child: CircleAvatar(
            child: ClipOval(
                child: Image.network(
              photoUrl,
              height: 56,
              width: 56,
              fit: BoxFit.cover,
            )),
          ),
        ),
        title: AppTextStyle(
          text: title,
          color: titleColor,
          fontSize: 18,
        ),
        subtitle: AppTextStyle(
          text: subtitle,
          color: subtitleColor,
          fontSize: 14,
        ),
        trailing: AppIconButton(
          image: buttonIcon,
          color: buttonIconColor,
          size: 24,
          action: () {},
        ));
  }
}
