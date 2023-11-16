import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../them/app_them_data.dart';
import '../utils/dark_theme_provider.dart';

class TextFieldWidget extends StatelessWidget {
  final String? title;
  final String hintText;
  final TextEditingController? controller;
  final Function()? onPress;
  final Function()? onChanged;
  final Widget? prefix;
  final bool? enable;
  final bool? obscureText;
  final int? maxLine;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldWidget(
      {super.key,
      this.textInputType,
      this.enable,
      this.prefix,
      this.title,
      required this.hintText,
      required this.controller,
      this.onPress,
      this.maxLine,
      this.inputFormatters,
      this.obscureText,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: title != null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title ?? '', style: const TextStyle(fontFamily: AppThemData.medium, fontSize: 14, color: AppThemData.assetColorLightGrey1000)),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          TextFormField(
            keyboardType: textInputType ?? TextInputType.text,
            textCapitalization: TextCapitalization.sentences,
            controller: controller,
            textAlign: TextAlign.start,
            maxLines: maxLine ?? 1,
            textInputAction: TextInputAction.done,
            inputFormatters: inputFormatters,
            obscureText: obscureText ?? false,
            onChanged: (value) => onChanged,
            style: TextStyle(
              fontSize: 16,
              color: themeChange.getThem() ? AppThemData.assetColorGrey600 : AppThemData.assetColorGrey600,
              fontFamily: AppThemData.medium,
            ),
            decoration: InputDecoration(
              errorStyle: const TextStyle(color: Colors.red),
              isDense: true,
              filled: true,
              enabled: enable ?? true,
              fillColor: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
              contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: prefix != null ? 0 : 10),
              prefixIcon: prefix,
              disabledBorder:
                  OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(30)), borderSide: BorderSide(color: themeChange.getThem() ? AppThemData.assetColorGrey900 : Colors.white)),
              focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)), borderSide: BorderSide(color: AppThemData.foodAppOrange600)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(30)), borderSide: BorderSide(color: themeChange.getThem() ? AppThemData.assetColorGrey900 : Colors.white)),
              errorBorder:
                  OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(30)), borderSide: BorderSide(color: themeChange.getThem() ? AppThemData.assetColorGrey900 : Colors.white)),
              border:
                  OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(30)), borderSide: BorderSide(color: themeChange.getThem() ? AppThemData.assetColorGrey900 : Colors.white)),
              hintText: hintText.tr,
              hintStyle: TextStyle(
                fontSize: 14,
                color: themeChange.getThem() ? AppThemData.assetColorLightGrey900 : AppThemData.assetColorLightGrey900,
                fontWeight: FontWeight.w500,
                fontFamily: AppThemData.medium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
