import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:new_nfc/configs/ui.dart';
import 'package:new_nfc/util/ui/screen_size.dart';

class DeadlineCard extends StatelessWidget {
  final DateTime deadline;
  final Color primaryColor;
  final Color secondaryColor;
  final String status;

  const DeadlineCard({
    Key key,
    @required this.deadline,
    @required this.status,
    this.primaryColor = Colors.white,
    this.secondaryColor = UiColors.tealGreen,
  })  : assert(deadline != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ScreenUtil() == null) {
      ScreenUtil.init(
        context,
        designSize: Size(ScreenSize.width, ScreenSize.height),

        // width: ScreenSize.width,
        // height: ScreenSize.height,
        allowFontScaling: true,
      );
    }

    return Container(
      height: ScreenUtil().setHeight(40),
      constraints: BoxConstraints(
        minWidth: ScreenUtil().setWidth(100),
        maxWidth: ScreenUtil().setWidth(150),
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
        vertical: ScreenUtil().setWidth(5),
      ),
      decoration: BoxDecoration(
        color: secondaryColor ?? UiColors.tealGreen,
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(5.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(6),
            height: ScreenUtil().setHeight(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(5.0),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                // 'Deadline: ${DateFormat('h:mm a | dd MMMM, yyyy').format(deadline)}'
                //     .toUpperCase(),
                '${status}'.toUpperCase(),
                style: TextStyle(
                  color: primaryColor ?? Colors.white,
                  fontSize: FontSize.fontSize14,
                  fontWeight: FontSize.semiBold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
