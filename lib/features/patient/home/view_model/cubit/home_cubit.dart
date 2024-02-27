import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);
  int indexOfNavBar = 0;
  changeIndex(int index) {
    indexOfNavBar = index;
    emit(indexOfNavBar);
  }
}
