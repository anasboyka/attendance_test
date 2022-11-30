part of 'attendance_bloc.dart';

class AttendanceState extends Equatable {
  //final List<Attendance> attendanceList;
  // const AttendanceState({
  //   this.attendanceList = const [],
  // });
  const AttendanceState();
  @override
  List<Object> get props => [];
}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoading extends AttendanceState {}

class AttendanceLoaded extends AttendanceState {
  final List<Attendance> attendanceList;
  const AttendanceLoaded({this.attendanceList = const []});

  @override
  List<Object> get props => [attendanceList];
}

class AttendanceSearched extends AttendanceState {
  final List<Attendance> attendanceList;
  const AttendanceSearched({this.attendanceList = const []});

  @override
  List<Object> get props => [attendanceList];
}
