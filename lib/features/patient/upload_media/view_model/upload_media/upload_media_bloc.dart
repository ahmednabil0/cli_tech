import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_media_state.dart';
part 'upload_media_bloc.freezed.dart';

class UploadMediaBloc extends Cubit<UploadMediaState> {
  UploadMediaBloc() : super(const UploadMediaState.initial());

  String? filePath;

  Future<void> openFilePicker(int index) async {
    emit(UploadMediaState.uploadingMedia(index));

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      filePath = result.files.single.path;
      // ignore: avoid_print
      print(filePath);
      emit(UploadMediaState.uploadedMedia(index));
    } else {
      emit(UploadMediaState.uploadfailureIngMedia(index));
    }
  }
}
