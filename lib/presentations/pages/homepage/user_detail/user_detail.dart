import 'dart:io';

import 'package:attendance_test/constants/constant_color.dart';
import 'package:attendance_test/constants/constant_string.dart';
import 'package:attendance_test/constants/constant_widget.dart';
import 'package:attendance_test/data/models/attendance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

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
        actions: [
          IconButton(
            onPressed: () async {
              try {
                Share.share(widget.attendance.toJson().toString());
              } on Exception catch (e) {
                // TODO
                kwShowSnackbar(context, e.toString());
              }
            },
            icon: Icon(Platform.isAndroid ? Icons.share : CupertinoIcons.share),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              gaphr(h: 30),
              rowDataDesign('User', widget.attendance.user),
              gaphr(),
              rowDataDesign('Phone', widget.attendance.phone),
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
        // title == 'Phone'
        //     ? IconButton(
        //         onPressed: () {},
        //         icon: Icon(
        //           Icons.share,
        //           color: kcPrimary,
        //         ),
        //       )
        //     : empty()
      ],
    );
  }
}
