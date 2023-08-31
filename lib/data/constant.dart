import 'package:flutter/material.dart';

import 'colors.dart';

class AppIcons {
  static const message = Image(
    image: AssetImage("images/message.png"),
  );
  static const facebook = Image(
    image: AssetImage("images/facebook.png"),
    height: 50,
  );
  static const stories = Image(
    image: AssetImage("images/stories.png"),
    height: 15,
    color: Colors.red,
  );
  static const images = Image(
    image: AssetImage("images/image.png"),
    height: 15,
    color: Colors.green,
  );
  static const room = Image(
    image: AssetImage("images/room.png"),
    height: 15,
    color: Colors.purple,
  );
  static const like = Image(
    image: AssetImage("images/like.png"),
    height: 15,
    color: AppColors.iconsColor,
  );
  static const comment = Image(
    image: AssetImage("images/comment.png"),
    height: 15,
    color: AppColors.iconsColor,
  );
  static const share = Image(
    image: AssetImage("images/share.png"),
    height: 15,
    color: AppColors.iconsColor,
  );
  static const dots = Image(
    image: AssetImage("images/dot.png"),
    height: 15,
    color: Colors.black,
  );
  static const people = Image(
    image: AssetImage("images/people.png"),
    height: 20,
    color: Colors.black,
  );
  static const watch = Image(
    image: AssetImage("images/watch.png"),
    height: 20,
    color: Colors.black,
  );
  static const profile = Image(
    image: AssetImage("images/profile.png"),
    height: 20,
    color: Colors.black,
  );
  static const notification = Image(
    image: AssetImage("images/notification.png"),
    height: 20,
    color: Colors.black,
  );
}
