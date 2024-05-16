import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gradution_project/core/db/cache/cache_helper.dart';
import 'package:gradution_project/core/routes/app_routes.dart';
import 'package:gradution_project/core/routes/navigate.dart';
import 'package:gradution_project/core/services/services_locator.dart';
import 'package:gradution_project/core/widgets/toast.dart';

part 'pending_state.dart';
part 'pending_bloc.freezed.dart';

class PendingBloc extends Cubit<PendingState> {
  PendingBloc() : super(const PendingState.initial());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> checkPending(BuildContext context) async {
    try {
      emit(const PendingState.loadInProgress());
      await firestore
          .collection('doctors')
          .doc(sl<CacheHelper>().getData(key: 'uid'))
          .get()
          .then((value) {
        if (value.data()!['pending'] == true) {
          showToastWarring(
              msg: 'Warring',
              context: context,
              des: 'Your Request is still Pending.');
        } else if (value.data()!['pending'] == false) {
          navigateReplace(
            context: context,
            route: Routes.homePage,
          );
          sl<CacheHelper>().setData(key: 'pending', value: false);
          showToastSucess(
              msg: 'Congrats.',
              context: context,
              dismissibles: true,
              des: 'Your Request is accepted, Enjoy');
        }
      });
      emit(const PendingState.loadedProgress());
    } catch (e) {
      // ignore: use_build_context_synchronously
      showToastError(msg: 'Error', context: context, des: e.toString());
    }
  }
}
