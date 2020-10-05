import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_nfc/configs/ui/font_size.dart';
import 'package:new_nfc/util/ui/screen_size.dart';

class LabelCard extends StatelessWidget {
  final String label;
  final double width;
  final double height;
  final Color color;
  final TextStyle textStyle;

  const LabelCard({
    Key key,
    this.label,
    this.width,
    this.height,
    this.color = Colors.black26,
    this.textStyle,
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

    return Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(5.0)),
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(14),
            vertical: ScreenUtil().setHeight(10),
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              ScreenUtil().setWidth(5),
            ),
          ),
          child: Text(
            '$label',
            style: textStyle ??
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontSize.bold,
                  fontSize: FontSize.fontSize16,
                ),
          ),
        ));
  }
}
