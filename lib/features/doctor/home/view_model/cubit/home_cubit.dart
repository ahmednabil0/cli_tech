import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDoctorCubit extends Cubit<int> {
  HomeDoctorCubit() : super(0);
  int indexOfNavBar = 0;
  changeIndex(int index) {
    indexOfNavBar = index;
    emit(indexOfNavBar);
  }
}
