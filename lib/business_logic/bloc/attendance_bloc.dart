import 'package:attendance_test/business_logic/cubit/attendance_cubit.dart';
import 'package:attendance_test/data/data_repo/attendance_repository.dart';
import 'package:attendance_test/data/models/attendance.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  AttendanceBloc() : super(const AttendanceState()) {
    on<LoadAttendance>(_onLoadAttendance);
    on<AddAttendance>(_onAddAttendance);
    on<UpdateAttendance>(_onUpdateAttendance);
    on<DeleteAttendance>(_onDeleteAttendance);
  }

  _onLoadAttendance(LoadAttendance event, Emitter<AttendanceState> emit) async {
    emit(AttendanceLoading());
    final List<Attendance> attendanceList =
        await AttendanceRepo().getAttendanceListPreferences();
    attendanceList.sort(
      (a, b) => a.checkIn.compareTo(b.checkIn),
    );
    emit(AttendanceLoaded(attendanceList: attendanceList));
  }

  _onAddAttendance(AddAttendance event, Emitter<AttendanceState> emit) async {
    final state = this.state;
    //emit(AttendanceLoading());
    if (state is AttendanceLoaded) {
      //print('loaded');
      List<Attendance> attendanceList = state.attendanceList
        ..add(event.attendance);
      attendanceList.sort(
        (a, b) => a.checkIn.compareTo(b.checkIn),
      );
      emit(AttendanceLoaded(attendanceList: attendanceList));
    }
  }

  void _onUpdateAttendance(
      UpdateAttendance event, Emitter<AttendanceState> emit) {
    // final state = this.state;
    // emit(AttendanceState(
    //   attendanceList: List.from(state.attendanceList)..add(event.attendance),
    // ));
  }

  void _onDeleteAttendance(
      DeleteAttendance event, Emitter<AttendanceState> emit) {
    // final state = this.state;
    // emit(AttendanceState(
    //   attendanceList: List.from(state.attendanceList)..add(event.attendance),
    // ));
  }
}
