import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hifarm/constants/app_color.dart';
import 'package:hifarm/controllers/home_controller.dart';
import 'package:hifarm/views/widgets/navbar_indicator.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class NavbarIcon extends StatelessWidget {
  const NavbarIcon({
    super.key,
    required this.index,
    required this.icon,
    required this.text,
    this.size,
  });

  final int index;
  final String icon;
  final String text;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return InkWell(
      onTap: () => homeController.changeIndex(index),
      child: SizedBox(
        width: 70,
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavbarIndicator(
                  isSelected: homeController.selectedIndex == index),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Iconify(
                    icon,
                    size: size ?? 24,
                    color: homeController.isDarkTheme
                        ? AppColor.primary
                        : AppColor.tertiary,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 12,
                        color: homeController.isDarkTheme
                            ? AppColor.primary
                            : AppColor.tertiary),
                  ),
                ],
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
