import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:new_nfc/configs/ui/colors.dart';
import 'package:new_nfc/util/ui/screen_size.dart';

class CardWidget extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final Color activeColor;
  final bool active;
  final Duration animationDuration;
  final Alignment alignment;
  final double width;
  final double height;
  final bool showShadow;
  final EdgeInsets margin;

  const CardWidget({
    Key key,
    this.child,
    this.backgroundColor = UiColors.grey,
    this.activeColor = Colors.white,
    this.active = false,
    this.animationDuration = const Duration(milliseconds: 300),
    this.alignment = Alignment.center,
    this.width,
    this.height,
    this.showShadow = false,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ScreenUtil() == null) {
      ScreenUtil.init(
        context,
        designSize: Size(ScreenSize.width, ScreenSize.height),
        allowFontScaling: true,
      );
    }

    return AnimatedContainer(
      duration: animationDuration,
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(25),
        horizontal: ScreenUtil().setWidth(15),
        // vertical: 15,
        // horizontal: 15,
      ),
      margin: margin,
      curve: Curves.ease,
      width: width,
      height: height,
      alignment: alignment,
      decoration: BoxDecoration(
        color: active ? activeColor : backgroundColor,
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(15),
        ),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  blurRadius: ScreenUtil().setHeight(15),
                  color: UiColors.blackShadow,
                  offset: Offset(
                    0,
                    ScreenUtil().setHeight(15),
                  ),
                  spreadRadius: ScreenUtil().setHeight(13),
                ),
              ]
            : [],
      ),
      child: child,
    );
  }
}