import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phenikaa_campus/constants/assets_constants.dart';
import 'package:phenikaa_campus/theme/pallete.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.phenikaaLogo,
        height: 40,
        colorFilter:
            const ColorFilter.mode(Pallete.whiteColor, BlendMode.srcIn),
      ),
      centerTitle: true,
    );
  }

  static List<Widget> bottomTabBarPages = [
    Text("Feed Screen"),
    Text("Search Screen"),
    Text("Notification Screen"),
  ];
}
