import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_nfc/configs/ui.dart';

import 'file_wrapper.dart';

class AssignmentCardFileElement extends StatelessWidget {
  final FileWrapper fileWrapper;

  const AssignmentCardFileElement({
    Key key,
    @required this.fileWrapper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.file,
          color: UiColors.mediumGrey,
          size: FontSize.fontSize16,
        ),
        SizedBox(
          width: ScreenUtil().setWidth(7),
        ),
        Expanded(
          child: GestureDetector(
            onTap: fileWrapper.onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    '${fileWrapper.fileName}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: UiColors.blue,
                      fontSize: FontSize.fontSize14,
                      fontWeight: FontSize.medium,
                    ),
                  ),
                ),
                if (fileWrapper.fileSize != null)
                  Text(
                    '${fileWrapper.fileSize}',
                    style: TextStyle(
                      color: UiColors.mediumGrey,
                      fontSize: FontSize.fontSize14,
                      fontWeight: FontSize.medium,
                    ),
                  ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: ScreenUtil().setWidth(10),
        ),
        GestureDetector(
          onTap: fileWrapper.onTap,
          child: Container(
            width: ScreenUtil().setWidth(32),
            height: ScreenUtil().setHeight(32),
            padding: EdgeInsets.all(
              ScreenUtil().setWidth(5.0),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              fileWrapper.icon,
              size: FontSize.fontSize14,
              color: UiColors.mediumGrey,
            ),
          ),
        ),
      ],
    );
  }
}