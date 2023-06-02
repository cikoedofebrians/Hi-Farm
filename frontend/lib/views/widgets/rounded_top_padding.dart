import 'package:flutter/material.dart';
import 'package:hifarm/constants/appcolor.dart';

class RoundedTopPadding extends StatelessWidget {
  const RoundedTopPadding({super.key, this.title, this.size});

  final String? title;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size ?? 40,
          color: AppColor.secondary,
        ),
        Container(
          alignment: Alignment.center,
          height: size ?? 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: title != null
              ? Text(
                  title!,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              : null,
        ),
      ],
    );
  }
}
