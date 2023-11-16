import 'package:flutter/material.dart';

import '../them/app_them_data.dart';
import '../them/responsive.dart';

class RoundedButtonFill extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final double? fontSizes;
  final Color? color;
  final Color? textColor;
  final Widget? icon;
  final bool? isRight;
  final String? fontFamily;
  final Function()? onPress;

  const RoundedButtonFill({super.key, required this.title, this.height, required this.onPress, this.width, this.color, this.icon, this.fontSizes, this.textColor, this.isRight, this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        onPress!();
      },
      child: Container(
        width: Responsive.width(width ?? 100, context),
        height: Responsive.height(height ?? 6, context),
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (isRight == false) ? Padding(padding: const EdgeInsets.only(right: 5), child: icon) : const SizedBox(),
            Text(
              title.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: fontFamily ?? AppThemData.medium,
                color: textColor ?? AppThemData.white,
                fontSize: fontSizes ?? 14,
              ),
            ),
            (isRight == true) ? Padding(padding: const EdgeInsets.only(left: 5), child: icon) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
