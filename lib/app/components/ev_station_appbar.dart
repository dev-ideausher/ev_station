import 'package:ev_station/app/services/index.dart';
import 'package:ev_station/app/services/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/text_style_util.dart';

class EvStationAppbar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final bool isLeading;
  final String? title;
  final void Function()? onPressed;
  final Widget? leadChild, titleWidget;

  const EvStationAppbar({
    Key? key,
    this.actions,
    this.isLeading = true,
    this.title,
    this.onPressed,
    this.leadChild,
    this.titleWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: titleWidget ??
          (title ?? '').text600(20.kh,
              color: ColorUtil.mainDarkColor1, textAlign: TextAlign.start),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: isLeading
          ? leadChild ??
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: onPressed ?? () => Get.back(),
              )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.kh);
}
