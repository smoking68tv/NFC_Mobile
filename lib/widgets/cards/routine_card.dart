import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_nfc/configs/ui/colors.dart';
import 'package:new_nfc/configs/ui/font_size.dart';
import 'package:new_nfc/util/ui/screen_size.dart';
import 'package:new_nfc/widgets/cards/card.dart';

class RoutineCardWidgete extends StatelessWidget {
  final String classTopic;
  final String classType;
  final String subject;
  final String professor;
  final String time;

  const RoutineCardWidgete({
    Key key,
    this.classTopic,
    this.classType,
    this.subject,
    this.professor,
    this.time,
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

    return CardWidget(
      active: true,
      // height: ScreenUtil().setHeight(220),
      width: ScreenUtil().setWidth(274),
      margin: EdgeInsets.fromLTRB(5, 4, 5, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(64),
                height: ScreenUtil().setWidth(64),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(15),
                  ),
                ),
                child: Icon(
                  FontAwesomeIcons.book,
                  color: Colors.white,
                  size: FontSize.fontSize28,
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(15),
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(240),
                    child: Text(
                      '$classTopic',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: FontSize.fontSize22,
                        fontWeight: FontSize.semiBold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(240),
                    child: Text(
                      '${classType ?? ''}',
                      style: TextStyle(
                        color: UiColors.grey,
                        fontSize: FontSize.fontSize14,
                        fontWeight: FontSize.regular,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Subject',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: FontSize.fontSize14,
                      fontWeight: FontSize.regular,
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(150),
                    height: ScreenUtil().setHeight(20),
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      child: Text(
                        '$subject',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: FontSize.fontSize14,
                          fontWeight: FontSize.semiBold,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Professor/Teacher',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: FontSize.fontSize14,
                      fontWeight: FontSize.regular,
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(190),
                    height: ScreenUtil().setHeight(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '$professor',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: FontSize.fontSize14,
                        fontWeight: FontSize.semiBold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ],
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
                Container(
                  width: ScreenUtil().setWidth(132),
                  height: ScreenUtil().setHeight(32),
                  decoration: BoxDecoration(
                    color: UiColors.defaultIcon,
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setWidth(5),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '$time',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: FontSize.fontSize14,
                      fontWeight: FontSize.semiBold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  width: ScreenUtil().setWidth(132),
                  height: ScreenUtil().setHeight(32),
                  // decoration: BoxDecoration(
                  //   color: UiColors.defaultIcon,
                  //   borderRadius: BorderRadius.circular(
                  //     ScreenUtil().setWidth(5),
                  //   ),
                  // ),
                  alignment: Alignment.center,
                  child: FlatButton(
                      onPressed: () {},
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
                      child: Text(
                        'Start',
                        style: TextStyle(color: UiColors.defaultIcon),
                      )),
                ),
              ]),
        ],
      ),
    );
  }
}
