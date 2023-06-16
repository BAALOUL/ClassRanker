import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonForBottomBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onpressed;
  final Color color;
  const ButtonForBottomBar(
      {super.key,
      required this.title,
      required this.icon,
      required this.onpressed,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MaterialButton(
            onPressed: onpressed,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: color,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12, color: color),
                )
              ],
            )),
      ],
    );
  }
}
