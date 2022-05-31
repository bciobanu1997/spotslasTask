import 'package:flutter/material.dart';
import 'package:spotlastask/appbar/appbar.dart';
import 'package:spotlastask/widgets/colors.dart';

import 'feed_builder/feed_builder.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) =>
                [const CustomAppBar()],
            body: Column(
              children: const [
                FeedBuilder(),
              ],
            ),
          ),
        ));
  }
}
