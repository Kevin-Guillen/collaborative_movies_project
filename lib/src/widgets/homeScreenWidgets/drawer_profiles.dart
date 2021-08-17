import 'package:flutter/material.dart';

class Profile {
  const Profile({
    required this.name,
    required this.urlImage,
    required this.widget,
  });

  final String name;
  final String urlImage;
  final Widget widget;
}
