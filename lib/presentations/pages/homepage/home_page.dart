import 'package:attendance_test/business_logic/bloc/attendance_bloc.dart';

import 'package:attendance_test/constants/constant_color.dart';
import 'package:attendance_test/data/models/attendance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: BlocBuilder<AttendanceBloc, AttendanceState>(
        builder: (context, state) {
          if (state is AttendanceLoaded) {
            return NotificationListener<ScrollEndNotification>(
              onNotification: (scrollEnd) {
                final metrics = scrollEnd.metrics;
                if (metrics.atEdge) {
                  bool isLast = metrics.pixels != 0;
                  if (isLast) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('You reach the end')));
                  }
                }
                return true;
              },
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: true,
                    pinned: true,
                    snap: true,
                    title: const Text('data'),
                    bottom: AppBar(
                      title: Container(),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(state.attendanceList
                        .map(
                          (attendance) => ListTile(
                            title: Text(attendance.user),
                            subtitle: Text(DateFormat('yyyy-MM-dd, h:mm a')
                                .format(attendance.checkIn)),
                            onTap: () {},
                          ),
                        )
                        .toList()),
                  )
                ],
              ),
            );
          } else {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  snap: true,
                  title: const Text('data'),
                  bottom: AppBar(
                    title: Container(),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      height: 20,
                      width: 20,
                      color: kcBlack,
                    )
                  ]),
                ),
              ],
            );
          }
        },
      ),
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       BlocBuilder<AttendanceCubit, AttendanceState>(
      //         builder: (context, state) {
      //           return Text(state.attendanceList.toString());
      //         },
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(DateTime(2020, 06, 30, 16, 10, 05));
          context.read<AttendanceBloc>().add(AddAttendance(
              attendance: Attendance(
                  user: 'user', phone: 'phone', checkIn: DateTime.now())));
          // context.read<AttendanceCubit>().addAttendance(Attendance(
          //     user: 'user', phone: 'phone', checkIn: DateTime.now()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
