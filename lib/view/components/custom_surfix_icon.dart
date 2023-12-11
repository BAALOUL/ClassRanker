import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        Config.getProportionateScreenWidth(20),
        Config.getProportionateScreenWidth(20),
        Config.getProportionateScreenWidth(20),
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: Config.getProportionateScreenWidth(18),
      ),
    );
  }
}
