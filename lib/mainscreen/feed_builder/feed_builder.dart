import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotlastask/mainscreen/feed_builder/description_text/description_text.dart';
import 'package:spotlastask/mainscreen/feed_builder/post_datetime/post_datetime.dart';
import 'package:spotlastask/mainscreen/feed_builder/post_photo/photo_carousel.dart';
import 'package:spotlastask/mainscreen/feed_builder/tags/tags_builder.dart';
import 'package:spotlastask/model/users_list_model.dart';
import 'package:spotlastask/view_models/users_view_model.dart';
import 'package:spotlastask/widgets/constant.dart';

import 'buttons_bar/buttons_bar.dart';

class FeedBuilder extends StatelessWidget {
  const FeedBuilder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    if (usersViewModel.loading) {
      return Container();
    }
    if (usersViewModel.userError != null) {
      return Container();
    }
    return Expanded(
        child: ListView.builder(
            itemCount: usersViewModel.userListModel.length,
            itemBuilder: (context, index) {
              UserModel userModel = usersViewModel.userListModel[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: Constant.l),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PhotoCarousel(userModel: userModel),
                    const ButtonsBar(),
                    DescriptionText(userModel: userModel),
                    TagsBuilder(userModel: userModel),
                    PostDateTime(userModel: userModel),
                  ],
                ),
              );
            }));
  }
}
