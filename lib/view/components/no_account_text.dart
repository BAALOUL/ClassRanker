import 'package:flutter/material.dart';

import '../../core/constant/consColors.dart';
import '../constants.dart';
import '../../config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: Config.getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          //onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontSize: Config.getProportionateScreenWidth(16),
              color: ConsColors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
