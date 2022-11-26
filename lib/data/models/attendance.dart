import 'package:equatable/equatable.dart';

class Attendance extends Equatable {
  final String user;
  final String phone;
  final DateTime checkIn;

  const Attendance({
    required this.user,
    required this.phone,
    required this.checkIn,
  });

  factory Attendance.fromMap(Map<String, dynamic> map) {
    return Attendance(
      user: map['user'],
      phone: map['phone'],
      checkIn: map['check-in']?.toDate(),
    );
  }

  Map<String, dynamic> toMap() => {
        'user': user,
        'phone': phone,
        'check-in': checkIn,
      };

  Attendance copyWith({
    final String? user,
    final String? phone,
    final DateTime? checkIn,
  }) {
    return Attendance(
      user: user ?? this.user,
      phone: phone ?? this.phone,
      checkIn: checkIn ?? this.checkIn,
    );
  }

  @override
  String toString() {
    return '${user.toString()}, ${phone.toString()}, ${checkIn.toString()}, ';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [user, phone, checkIn];
}
