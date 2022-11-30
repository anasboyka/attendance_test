import 'package:attendance_test/business_logic/bloc/attendance_bloc.dart';
import 'package:attendance_test/business_logic/provider/attendance_provider.dart';
import 'package:attendance_test/constants/constant_color.dart';
import 'package:attendance_test/data/data_repo/attendance_repository.dart';
import 'package:attendance_test/data/local/shared_prefences.dart';
import 'package:attendance_test/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Spreferences.init();
  runApp(MultiProvider(providers: [
    // BlocProvider<AttendanceBloc>(
    //   create: (context) =>
    //       AttendanceBloc(AttendanceRepo())..add(LoadAttendance()),
    // ),
    ChangeNotifierProvider(
        create: (_) => AttendanceProvider()..initializeData()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Attendance Demo',
            theme: ThemeData(
              primarySwatch: kcPrimarySwatch,
            ),
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        });
  }
}
