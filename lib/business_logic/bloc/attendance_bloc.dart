import 'package:attendance_test/data/data_repo/attendance_repository.dart';
import 'package:attendance_test/data/local/shared_prefences.dart';
import 'package:attendance_test/data/models/attendance.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AttendanceRepo _attendanceRepo;
  AttendanceBloc(this._attendanceRepo) : super(const AttendanceState()) {
    on<LoadAttendance>(_onLoadAttendance);
    on<AddAttendance>(_onAddAttendance);
    on<UpdateAttendance>(_onUpdateAttendance);
    on<DeleteAttendance>(_onDeleteAttendance);
    on<SearchAttendance>(_onSearchAttendance);
  }

  _onLoadAttendance(LoadAttendance event, Emitter<AttendanceState> emit) async {
    emit(AttendanceLoading());
    final List<Attendance> attendanceList =
        await _attendanceRepo.getAttendanceListPreferences();
    attendanceList.sort(
      (a, b) => a.checkIn.compareTo(b.checkIn),
    );
    emit(AttendanceLoaded(attendanceList: attendanceList));
  }

  _onAddAttendance(AddAttendance event, Emitter<AttendanceState> emit) async {
    final state = this.state;
    emit(AttendanceLoading());
    if (state is AttendanceLoaded) {
      List<Attendance> attendanceList = state.attendanceList
        ..add(event.attendance);
      attendanceList.sort(
        (a, b) => a.checkIn.compareTo(b.checkIn),
      );
      print('bloc');
      print(attendanceList);
      await _attendanceRepo.setAttendanceListPreferences(attendanceList);

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

  _onSearchAttendance(SearchAttendance event, Emitter<AttendanceState> emit) {
    final state = this.state;
    emit(AttendanceLoading());
    if (state is AttendanceLoaded) {
      List<Attendance> attendanceList = state.attendanceList;
      if (event.query.isNotEmpty) {
        List<Attendance> attendanceListTemp = [];
        attendanceListTemp = attendanceList.where((attendance) {
          final String input = event.query;
          return attendance.user.toLowerCase().contains(input);
        }).toList();
        emit(AttendanceSearched(attendanceList: attendanceListTemp));
      } else {
        // emit(AttendanceLoaded(attendanceList: attendanceList));
      }
    }
  }
}
