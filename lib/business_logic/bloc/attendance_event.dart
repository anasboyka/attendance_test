part of 'attendance_bloc.dart';

abstract class AttendanceEvent extends Equatable {
  const AttendanceEvent();

  @override
  List<Object> get props => [];
}

class LoadAttendance extends AttendanceEvent {
  final List<Attendance> attendanceList;
  const LoadAttendance({this.attendanceList = const []});

  @override
  List<Object> get props => [attendanceList];
}

class SearchAttendance extends AttendanceEvent {
  final String query;
  const SearchAttendance({required this.query});

  @override
  List<Object> get props => [query];
}

class AddAttendance extends AttendanceEvent {
  final Attendance attendance;
  const AddAttendance({required this.attendance});

  @override
  List<Object> get props => [attendance];
}

class UpdateAttendance extends AttendanceEvent {
  final Attendance attendance;
  const UpdateAttendance({required this.attendance});

  @override
  List<Object> get props => [attendance];
}

class DeleteAttendance extends AttendanceEvent {
  final Attendance attendance;
  const DeleteAttendance({required this.attendance});

  @override
  List<Object> get props => [attendance];
}
