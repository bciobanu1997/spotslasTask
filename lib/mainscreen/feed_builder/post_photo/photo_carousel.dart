import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spotlastask/mainscreen/feed_builder/post_photo/username_details.dart';
import 'package:spotlastask/model/users_list_model.dart';
import 'package:spotlastask/widgets/image_builder.dart';

class PhotoCarousel extends StatelessWidget {
  PhotoCarousel({Key? key, required this.userModel}) : super(key: key);
  UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 450,
      child: Stack(children: [
        CarouselSlider.builder(
            options: CarouselOptions(
              height: 450,
              aspectRatio: 1,
              viewportFraction: 1,
              enableInfiniteScroll: false,
            ),
            itemCount: userModel.media?.length,
            itemBuilder: (context, index, realIndex) {
              return ImageBuilder(userModel.media![index].url as String, index);
            }), //next
        UserNameDetails(
          userModel: userModel,
        ),
      ]),
    );
  }
}
