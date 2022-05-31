import 'package:flutter/material.dart';
import 'package:spotlastask/model/users_list_model.dart';
import 'package:spotlastask/widgets/constant.dart';
import 'package:spotlastask/widgets/tag_widget.dart';

class TagsBuilder extends StatelessWidget {
  const TagsBuilder({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: (userModel.tags != null) ? 40 : 0,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: (userModel.tags != null) ? userModel.tags!.length : 0,
          itemBuilder: (context, index) {
            return (userModel.tags!.length != null)
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: Constant.s, top: Constant.xs, bottom: Constant.s),
                    child:
                        TagWidget(text: userModel.tags![index].name as String))
                : const SizedBox();
          },
        ));
  }
}
