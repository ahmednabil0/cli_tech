// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appBlocInitial,
    required TResult Function() changeLangLoading,
    required TResult Function() changeLangSucess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? appBlocInitial,
    TResult? Function()? changeLangLoading,
    TResult? Function()? changeLangSucess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appBlocInitial,
    TResult Function()? changeLangLoading,
    TResult Function()? changeLangSucess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppBlocInitialState value) appBlocInitial,
    required TResult Function(_ChangeLangLoadingState value) changeLangLoading,
    required TResult Function(_ChangeLangSucessState value) changeLangSucess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppBlocInitialState value)? appBlocInitial,
    TResult? Function(_ChangeLangLoadingState value)? changeLangLoading,
    TResult? Function(_ChangeLangSucessState value)? changeLangSucess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppBlocInitialState value)? appBlocInitial,
    TResult Function(_ChangeLangLoadingState value)? changeLangLoading,
    TResult Function(_ChangeLangSucessState value)? changeLangSucess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AppBlocInitialStateImplCopyWith<$Res> {
  factory _$$AppBlocInitialStateImplCopyWith(_$AppBlocInitialStateImpl value,
          $Res Function(_$AppBlocInitialStateImpl) then) =
      __$$AppBlocInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppBlocInitialStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppBlocInitialStateImpl>
    implements _$$AppBlocInitialStateImplCopyWith<$Res> {
  __$$AppBlocInitialStateImplCopyWithImpl(_$AppBlocInitialStateImpl _value,
      $Res Function(_$AppBlocInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppBlocInitialStateImpl implements _AppBlocInitialState {
  const _$AppBlocInitialStateImpl();

  @override
  String toString() {
    return 'AppState.appBlocInitial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppBlocInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appBlocInitial,
    required TResult Function() changeLangLoading,
    required TResult Function() changeLangSucess,
  }) {
    return appBlocInitial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? appBlocInitial,
    TResult? Function()? changeLangLoading,
    TResult? Function()? changeLangSucess,
  }) {
    return appBlocInitial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appBlocInitial,
    TResult Function()? changeLangLoading,
    TResult Function()? changeLangSucess,
    required TResult orElse(),
  }) {
    if (appBlocInitial != null) {
      return appBlocInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppBlocInitialState value) appBlocInitial,
    required TResult Function(_ChangeLangLoadingState value) changeLangLoading,
    required TResult Function(_ChangeLangSucessState value) changeLangSucess,
  }) {
    return appBlocInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppBlocInitialState value)? appBlocInitial,
    TResult? Function(_ChangeLangLoadingState value)? changeLangLoading,
    TResult? Function(_ChangeLangSucessState value)? changeLangSucess,
  }) {
    return appBlocInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppBlocInitialState value)? appBlocInitial,
    TResult Function(_ChangeLangLoadingState value)? changeLangLoading,
    TResult Function(_ChangeLangSucessState value)? changeLangSucess,
    required TResult orElse(),
  }) {
    if (appBlocInitial != null) {
      return appBlocInitial(this);
    }
    return orElse();
  }
}

abstract class _AppBlocInitialState implements AppState {
  const factory _AppBlocInitialState() = _$AppBlocInitialStateImpl;
}

/// @nodoc
abstract class _$$ChangeLangLoadingStateImplCopyWith<$Res> {
  factory _$$ChangeLangLoadingStateImplCopyWith(
          _$ChangeLangLoadingStateImpl value,
          $Res Function(_$ChangeLangLoadingStateImpl) then) =
      __$$ChangeLangLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangeLangLoadingStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$ChangeLangLoadingStateImpl>
    implements _$$ChangeLangLoadingStateImplCopyWith<$Res> {
  __$$ChangeLangLoadingStateImplCopyWithImpl(
      _$ChangeLangLoadingStateImpl _value,
      $Res Function(_$ChangeLangLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangeLangLoadingStateImpl implements _ChangeLangLoadingState {
  const _$ChangeLangLoadingStateImpl();

  @override
  String toString() {
    return 'AppState.changeLangLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeLangLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appBlocInitial,
    required TResult Function() changeLangLoading,
    required TResult Function() changeLangSucess,
  }) {
    return changeLangLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? appBlocInitial,
    TResult? Function()? changeLangLoading,
    TResult? Function()? changeLangSucess,
  }) {
    return changeLangLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appBlocInitial,
    TResult Function()? changeLangLoading,
    TResult Function()? changeLangSucess,
    required TResult orElse(),
  }) {
    if (changeLangLoading != null) {
      return changeLangLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppBlocInitialState value) appBlocInitial,
    required TResult Function(_ChangeLangLoadingState value) changeLangLoading,
    required TResult Function(_ChangeLangSucessState value) changeLangSucess,
  }) {
    return changeLangLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppBlocInitialState value)? appBlocInitial,
    TResult? Function(_ChangeLangLoadingState value)? changeLangLoading,
    TResult? Function(_ChangeLangSucessState value)? changeLangSucess,
  }) {
    return changeLangLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppBlocInitialState value)? appBlocInitial,
    TResult Function(_ChangeLangLoadingState value)? changeLangLoading,
    TResult Function(_ChangeLangSucessState value)? changeLangSucess,
    required TResult orElse(),
  }) {
    if (changeLangLoading != null) {
      return changeLangLoading(this);
    }
    return orElse();
  }
}

abstract class _ChangeLangLoadingState implements AppState {
  const factory _ChangeLangLoadingState() = _$ChangeLangLoadingStateImpl;
}

/// @nodoc
abstract class _$$ChangeLangSucessStateImplCopyWith<$Res> {
  factory _$$ChangeLangSucessStateImplCopyWith(
          _$ChangeLangSucessStateImpl value,
          $Res Function(_$ChangeLangSucessStateImpl) then) =
      __$$ChangeLangSucessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangeLangSucessStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$ChangeLangSucessStateImpl>
    implements _$$ChangeLangSucessStateImplCopyWith<$Res> {
  __$$ChangeLangSucessStateImplCopyWithImpl(_$ChangeLangSucessStateImpl _value,
      $Res Function(_$ChangeLangSucessStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangeLangSucessStateImpl implements _ChangeLangSucessState {
  const _$ChangeLangSucessStateImpl();

  @override
  String toString() {
    return 'AppState.changeLangSucess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeLangSucessStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() appBlocInitial,
    required TResult Function() changeLangLoading,
    required TResult Function() changeLangSucess,
  }) {
    return changeLangSucess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? appBlocInitial,
    TResult? Function()? changeLangLoading,
    TResult? Function()? changeLangSucess,
  }) {
    return changeLangSucess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? appBlocInitial,
    TResult Function()? changeLangLoading,
    TResult Function()? changeLangSucess,
    required TResult orElse(),
  }) {
    if (changeLangSucess != null) {
      return changeLangSucess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppBlocInitialState value) appBlocInitial,
    required TResult Function(_ChangeLangLoadingState value) changeLangLoading,
    required TResult Function(_ChangeLangSucessState value) changeLangSucess,
  }) {
    return changeLangSucess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppBlocInitialState value)? appBlocInitial,
    TResult? Function(_ChangeLangLoadingState value)? changeLangLoading,
    TResult? Function(_ChangeLangSucessState value)? changeLangSucess,
  }) {
    return changeLangSucess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppBlocInitialState value)? appBlocInitial,
    TResult Function(_ChangeLangLoadingState value)? changeLangLoading,
    TResult Function(_ChangeLangSucessState value)? changeLangSucess,
    required TResult orElse(),
  }) {
    if (changeLangSucess != null) {
      return changeLangSucess(this);
    }
    return orElse();
  }
}

abstract class _ChangeLangSucessState implements AppState {
  const factory _ChangeLangSucessState() = _$ChangeLangSucessStateImpl;
}
