import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:new_nfc/configs/ui/colors.dart';
import 'package:new_nfc/widgets/cards/assignment_card.dart';
import 'package:new_nfc/widgets/cards/file_wrapper.dart';
import 'package:new_nfc/widgets/labels/label_card.dart';

class TaskListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Center(
        child: ListView(
          children: <Widget>[
            LabelCard(
              label: '${DateFormat('h:mm a | dd MMMM, yyyy').format(DateTime.now())}',
              color: UiColors.defaultIcon,
              width:  ScreenUtil().setWidth(20),
            ),
            Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(5.0)),
              child: AssignmentCard(
                deadline: DateTime.now(),
                status: 'Назначено',
                question:
                    'Chapter 3 - Q.no 1 - Q.no 10 (Please submit in word format with names attached)',
                subject: 'Mathematics',
                teacher: 'Dr. Stone',
                onUploadHandler: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(5.0)),
              child: AssignmentCard(
                deadline: DateTime.now(),
                status: 'В работе',
                question:
                    'Chapter 3 - Q.no 1 - Q.no 10 (Please submit in word format with names attached)',
                subject: 'Mathematics',
                teacher: 'Dr. Stone',
                deadlineBackgroundColor: UiColors.darkYellow,
                onUploadHandler: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(5.0)),
              child: AssignmentCard(
                deadline: DateTime.now(),
                status: 'В работе',
                question:
                    'Chapter 3 - Q.no 1 - Q.no 10 (Please submit in word format with names attached)',
                subject: 'Mathematics',
                teacher: 'Dr. Stone',
                deadlineBackgroundColor: UiColors.darkYellow,
                onUploadHandler: () {},
              ),
            ),
            Padding(
              // padding: EdgeInsets.all(1),

              padding: EdgeInsets.all(ScreenUtil().setWidth(5.0)),
              child: AssignmentCard(
                deadline: DateTime.now(),
                status: 'В работе',

                question:
                    'Chapter 3 - Q.no 1 - Q.no 10 (Please submit in word format with names attached)',
                subject: 'Mathematics',
                teacher: 'Dr. Stone',
                deadlineBackgroundColor: UiColors.darkYellow,
                onUploadHandler: () {},
              ),
            ),
            Padding(
              // padding: EdgeInsets.all(1),

              padding: EdgeInsets.all(ScreenUtil().setWidth(5.0)),
              child: AssignmentCard(
                deadline: DateTime.now(),
                status: 'Просрочено',

                question:
                    'Chapter 3 - Q.no 1 - Q.no 10 (Please submit in word format with names attached)',
                subject: 'Mathematics',
                teacher: 'Dr. Stone',
                deadlineBackgroundColor: UiColors.red,
                onUploadHandler: () {
                  print('Handle upload');
                },
                // fileList: [
                //   FileWrapper(
                //     fileName: 'assignment-information.pdf',
                //     fileSize: '11.5 KB',
                //     onTap: () {
                //       print('Handle on tap');
                //     },
                //   ),
                //   FileWrapper(
                //     fileName: 'assignment-information-2.pdf',
                //     fileSize: '11.5 KB',
                //     onTap: () {
                //       print('Handle on tap');
                //     },
                //   ),
                // ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
