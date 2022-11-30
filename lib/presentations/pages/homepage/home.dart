import 'package:attendance_test/business_logic/provider/attendance_provider.dart';
import 'package:attendance_test/constants/constant_color.dart';
import 'package:attendance_test/constants/constant_string.dart';
import 'package:attendance_test/constants/constant_widget.dart';
import 'package:attendance_test/data/models/attendance.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final userCon = TextEditingController();
  final phoneCon = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollEndNotification>(
        onNotification: (scrollEnd) {
          final metrics = scrollEnd.metrics;
          if (metrics.atEdge) {
            bool isLast = metrics.pixels != 0;
            if (isLast) {
              kwShowSnackbar(context, "You reach the end of the list");
            }
          }
          return true;
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              // floating: true,
              // pinned: true,
              // snap: true,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text('Attendance'),
                  const Spacer(),
                  Consumer<AttendanceProvider>(
                      builder: (_, attendanceProvider, child) {
                    bool? isDate = attendanceProvider.isDate;
                    // print(timeAgo1);
                    return Switch.adaptive(
                      value: isDate,
                      onChanged: (isDate) {
                        Provider.of<AttendanceProvider>(context, listen: false)
                            .setDateFormat(isDate);
                      },
                      activeColor: kcYellow1,
                      inactiveTrackColor: kcYellow2,
                    );
                  })
                ],
              ),
              bottom: AppBar(
                title: TextFormField(
                  onChanged: (query) {
                    Provider.of<AttendanceProvider>(context, listen: false)
                        .searchAttendance(query);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kcWhite,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Consumer<AttendanceProvider>(
                builder: (_, attendanceProvider, child) {
              List<Attendance>? attendanceList = attendanceProvider.attendances;
              bool isDate = attendanceProvider.isDate;

              if (attendanceList.isEmpty) {
                return SliverList(
                    delegate: SliverChildListDelegate([
                  const SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: CircularProgressIndicator.adaptive(),
                  )
                ]));
              } else {
                return SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: attendanceList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(attendanceList[index].user),
                            subtitle: Text(
                              isDate
                                  ? DateFormat(ksDateTimeFormatDefault)
                                      .format(attendanceList[index].checkIn)
                                  : timeago
                                      .format(attendanceList[index].checkIn),
                            ),
                            onTap: () async {
                              Navigator.of(context).pushNamed('/userDetail',
                                  arguments: attendanceList[index]);
                            },
                          );
                        },
                      ),
                      gaphr(h: 60),
                    ],
                  ),
                );
              }
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Provider.of<AttendanceProvider>(context, listen: false).addAttendance(
          //   Attendance(
          //     user: 'user1',
          //     phone: 'phone',
          //     checkIn: DateTime(2021, 06, 30, 16, 10, 05),
          //   ),
          // );
          return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('title'),
                  content: SingleChildScrollView(
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const Expanded(child: Text('User : ')),
                              gapwr(w: 10),
                              Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: userCon,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'User cannot be empty';
                                      }
                                    },
                                  )),
                            ],
                          ),
                          gaphr(),
                          Row(
                            children: [
                              const Expanded(child: Text('Phone : ')),
                              gapwr(),
                              Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: phoneCon,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Phone cannot be empty';
                                      }
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: kwInset0,
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      color: kcPrimary,
                      textColor: Colors.white,
                      child: const Text('Add'),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          Attendance attendance = Attendance(
                              user: userCon.text,
                              phone: phoneCon.text,
                              checkIn: DateTime.now());
                          Provider.of<AttendanceProvider>(context,
                                  listen: false)
                              .addAttendance(attendance);

                          kwShowSnackbar(context,
                              "User ${userCon.text} added successfully");
                          userCon.clear();
                          phoneCon.clear();
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ],
                );
              });

          // print(DateTime(2020, 06, 30, 16, 10, 05));
          // context.read<AttendanceBloc>().add(
          //       AddAttendance(
          //         attendance: Attendance(
          //           user: 'user',
          //           phone: 'phone',
          //           checkIn: DateTime.now(),
          //         ),
          //       ),
          //     );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
