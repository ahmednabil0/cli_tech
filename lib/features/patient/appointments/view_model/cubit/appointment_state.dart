import 'package:equatable/equatable.dart';

sealed class AppointmentState extends Equatable {
  const AppointmentState();

  // @override
  // List<Object> get props => [];
}

final class AppointmentInitial extends AppointmentState {
  @override
  List<Object?> get props => [];
}

final class UpdateHourState extends AppointmentState {
  @override
  List<Object> get props => [];
}

final class RemoveHourState extends AppointmentState {
  @override
  List<Object> get props => [];
}
