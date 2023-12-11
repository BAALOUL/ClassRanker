import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String?> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index]!)),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: Config.getProportionateScreenWidth(14),
          width: Config.getProportionateScreenWidth(14),
        ),
        SizedBox(
          width: Config.getProportionateScreenWidth(10),
        ),
        Text(error),
      ],
    );
  }
}
