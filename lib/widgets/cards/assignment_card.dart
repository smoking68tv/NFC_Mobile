import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_nfc/configs/ui/colors.dart';
import 'package:new_nfc/configs/ui/font_size.dart';
import 'package:new_nfc/util/ui/screen_size.dart';
import 'package:new_nfc/widgets/cards/deadline_card.dart';
import 'package:new_nfc/widgets/cards/file_wrapper.dart';

import 'assigment_card_file_element.dart';

class AssignmentCard extends StatelessWidget {
  final String question;
  final String status;
  final String subject;
  final String teacher;
  final DateTime deadline;
  final Color deadlineBackgroundColor;
  final Color deadlineTextColor;
  final Function onUploadHandler;
  final List<FileWrapper> fileList;

  const AssignmentCard({
    Key key,
    this.question,
    this.status,
    this.subject,
    this.teacher,
    this.deadline,
    this.deadlineBackgroundColor,
    this.deadlineTextColor,
    this.onUploadHandler,
    this.fileList,
  }) : super(key: key);

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
      width: ScreenUtil().setWidth(274),
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(25),
        horizontal: ScreenUtil().setWidth(15),
        // vertical: 15,
        // horizontal: 15,
      ),
      constraints: BoxConstraints(
        // minHeight: 140,
        minHeight: ScreenUtil().setHeight(140),
      ),
      decoration: BoxDecoration(
        color: UiColors.blueGrey,
        borderRadius: BorderRadius.circular(
          // 10,
          ScreenUtil().setWidth(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.questionCircle,
                color: UiColors.mediumGrey,
                size: FontSize.fontSize24,
              ),
              SizedBox(
                width: ScreenUtil().setWidth(10),
              ),
              Container(
                width: ScreenUtil().setWidth(320),
                child: Text(
                  '$question',
                  style: TextStyle(
                    color: UiColors.darkBlack,
                    fontSize: FontSize.fontSize24,
                    fontWeight: FontSize.semiBold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.book,
                color: UiColors.mediumGrey,
                size: FontSize.fontSize16,
              ),
              SizedBox(
                width: ScreenUtil().setWidth(15),
              ),
              Text(
                '$subject',
                style: TextStyle(
                  color: UiColors.mediumGrey,
                  fontSize: FontSize.fontSize22,
                  fontWeight: FontSize.medium,
                ),
              ),
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.userGraduate,
                color: UiColors.mediumGrey,
                size: FontSize.fontSize16,
              ),
              SizedBox(
                width: ScreenUtil().setWidth(15),
              ),
              Text(
                '$teacher',
                style: TextStyle(
                  color: UiColors.mediumGrey,
                  fontSize: FontSize.fontSize22,
                  fontWeight: FontSize.medium,
                ),
              ),
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (deadline != null)
                DeadlineCard(
                  deadline: deadline,
                  status: status,
                  primaryColor: deadlineTextColor,
                  secondaryColor: deadlineBackgroundColor,
                ),
              Expanded(
                child: Container(),
              ),
              if (onUploadHandler != null)
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: ScreenUtil().setWidth(56),
                    maxWidth: ScreenUtil().setWidth(56),
                  ),
                  child: FlatButton(
                    onPressed: onUploadHandler,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        ScreenUtil().setWidth(10),
                      ),
                      side: BorderSide(
                        color: UiColors.defaultIcon,
                        width: ScreenUtil().setWidth(1),
                      ),
                    ),
                    splashColor: UiColors.lightBlue,
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(5.0),
                    ),
                    child: Icon(
                      Icons.open_in_new,
                      size: FontSize.fontSize28,
                      color: UiColors.defaultIcon,
                    ),
                  ),
                ),
            ],
          ),
          if (fileList != null && ((fileList?.length ?? 0) > 0)) ...[
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            ...fileList?.map((e) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: ScreenUtil().setHeight(10),
                ),
                child: AssignmentCardFileElement(fileWrapper: e),
              );
            })?.toList(),
          ]
        ],
      ),
    );
  }
}