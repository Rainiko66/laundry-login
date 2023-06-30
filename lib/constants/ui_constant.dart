import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laundry/constants/constants.dart';


class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.laundryLogo,
        color:Color.fromARGB(255, 221, 219, 223),
        height: 30,
        ),
        centerTitle: true,
    );
  }

}