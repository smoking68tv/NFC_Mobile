import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:new_nfc/configs/ui/colors.dart';
import 'package:new_nfc/widgets/cards/routine_card.dart';
import 'package:new_nfc/widgets/labels/label_card.dart';

class RoundListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Center(
        child: ListView(
          children: [
            LabelCard(
              label: '${DateFormat('h:mm a | dd MMMM, yyyy').format(DateTime.now())}',
              color: UiColors.defaultIcon,
              width:  ScreenUtil().setWidth(20),
            ),
            RoutineCardWidgete(
              classTopic: 'Fundamentals of Mathematics',
              classType: 'Theory Class',
              subject: 'Mathematics',
              professor: 'Mr. Ram Prasad Yadav',
              time: '8:00 - 9:00 AM',
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            RoutineCardWidgete(
              classTopic: 'Pully chain',
              classType: 'Practical Class',
              subject: 'Physics',
              professor: 'Mr. Ram Prasad Yadav',
              time: '10:00 - 11:00 AM',
            ),
          ],
        )
      )
    );
  }
}