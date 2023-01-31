import 'package:flutter/material.dart';

class RightBar extends StatelessWidget {
  const RightBar({Key? key, required this.barWidth}) : super(key: key);

  final double barWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 20,
          width: barWidth,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Color.fromARGB(500, 252, 201, 28),
          ),
        )
      ],
    );
  }
}
