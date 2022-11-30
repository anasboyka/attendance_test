import 'package:attendance_test/constants/constant_string.dart';
import 'package:attendance_test/constants/constant_widget.dart';
import 'package:attendance_test/data/models/attendance.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserDetail extends StatefulWidget {
  final Attendance attendance;
  const UserDetail({Key? key, required this.attendance}) : super(key: key);

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              gaphr(h: 30),
              rowDataDesign('User', widget.attendance.user),
              gaphr(),
              rowDataDesign('Phone Number', widget.attendance.phone),
              gaphr(),
              rowDataDesign(
                  'Check - in',
                  DateFormat(ksDateTimeFormatDefault)
                      .format(widget.attendance.checkIn)),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowDataDesign(String title, String data) {
    return Row(
      children: [
        Text(
          title,
          style: kwtextStyleRD(
            fs: 16,
            fw: kfbold,
          ),
        ),
        const Spacer(),
        Text(
          data,
          style: kwtextStyleRD(
            fs: 16,
          ),
        ),
      ],
    );
  }
}
