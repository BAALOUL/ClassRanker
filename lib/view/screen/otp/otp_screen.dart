import 'package:flutter/material.dart';
import 'package:ecommerce_store/view/size_config.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
