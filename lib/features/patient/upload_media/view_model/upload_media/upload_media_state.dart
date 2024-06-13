part of 'upload_media_bloc.dart';

@freezed
class UploadMediaState with _$UploadMediaState {
  const factory UploadMediaState.initial() = _Initial;
  const factory UploadMediaState.uploadingMedia(int index) = _UploadingMedia;
  const factory UploadMediaState.uploadedMedia(int index) = _UploadedMedia;
  const factory UploadMediaState.uploadfailureIngMedia(int index) =
      _FailureUploading;
  const factory UploadMediaState.loading() = _Loading;
  const factory UploadMediaState.loaded() = _Loaded;
  const factory UploadMediaState.error() = _Error;
}
