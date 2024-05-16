// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PendingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function() loadedProgress,
    required TResult Function() errorProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? loadedProgress,
    TResult? Function()? errorProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? loadedProgress,
    TResult Function()? errorProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadedProgress value) loadedProgress,
    required TResult Function(_ErrorProgress value) errorProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadedProgress value)? loadedProgress,
    TResult? Function(_ErrorProgress value)? errorProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadedProgress value)? loadedProgress,
    TResult Function(_ErrorProgress value)? errorProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PendingStateCopyWith<$Res> {
  factory $PendingStateCopyWith(
          PendingState value, $Res Function(PendingState) then) =
      _$PendingStateCopyWithImpl<$Res, PendingState>;
}

/// @nodoc
class _$PendingStateCopyWithImpl<$Res, $Val extends PendingState>
    implements $PendingStateCopyWith<$Res> {
  _$PendingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PendingStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PendingState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function() loadedProgress,
    required TResult Function() errorProgress,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? loadedProgress,
    TResult? Function()? errorProgress,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? loadedProgress,
    TResult Function()? errorProgress,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadedProgress value) loadedProgress,
    required TResult Function(_ErrorProgress value) errorProgress,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadedProgress value)? loadedProgress,
    TResult? Function(_ErrorProgress value)? errorProgress,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadedProgress value)? loadedProgress,
    TResult Function(_ErrorProgress value)? errorProgress,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PendingState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadInProgressImplCopyWith<$Res> {
  factory _$$LoadInProgressImplCopyWith(_$LoadInProgressImpl value,
          $Res Function(_$LoadInProgressImpl) then) =
      __$$LoadInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadInProgressImplCopyWithImpl<$Res>
    extends _$PendingStateCopyWithImpl<$Res, _$LoadInProgressImpl>
    implements _$$LoadInProgressImplCopyWith<$Res> {
  __$$LoadInProgressImplCopyWithImpl(
      _$LoadInProgressImpl _value, $Res Function(_$LoadInProgressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadInProgressImpl implements _LoadInProgress {
  const _$LoadInProgressImpl();

  @override
  String toString() {
    return 'PendingState.loadInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function() loadedProgress,
    required TResult Function() errorProgress,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? loadedProgress,
    TResult? Function()? errorProgress,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? loadedProgress,
    TResult Function()? errorProgress,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadedProgress value) loadedProgress,
    required TResult Function(_ErrorProgress value) errorProgress,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadedProgress value)? loadedProgress,
    TResult? Function(_ErrorProgress value)? errorProgress,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadedProgress value)? loadedProgress,
    TResult Function(_ErrorProgress value)? errorProgress,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements PendingState {
  const factory _LoadInProgress() = _$LoadInProgressImpl;
}

/// @nodoc
abstract class _$$LoadedProgressImplCopyWith<$Res> {
  factory _$$LoadedProgressImplCopyWith(_$LoadedProgressImpl value,
          $Res Function(_$LoadedProgressImpl) then) =
      __$$LoadedProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadedProgressImplCopyWithImpl<$Res>
    extends _$PendingStateCopyWithImpl<$Res, _$LoadedProgressImpl>
    implements _$$LoadedProgressImplCopyWith<$Res> {
  __$$LoadedProgressImplCopyWithImpl(
      _$LoadedProgressImpl _value, $Res Function(_$LoadedProgressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadedProgressImpl implements _LoadedProgress {
  const _$LoadedProgressImpl();

  @override
  String toString() {
    return 'PendingState.loadedProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadedProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function() loadedProgress,
    required TResult Function() errorProgress,
  }) {
    return loadedProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? loadedProgress,
    TResult? Function()? errorProgress,
  }) {
    return loadedProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? loadedProgress,
    TResult Function()? errorProgress,
    required TResult orElse(),
  }) {
    if (loadedProgress != null) {
      return loadedProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadedProgress value) loadedProgress,
    required TResult Function(_ErrorProgress value) errorProgress,
  }) {
    return loadedProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadedProgress value)? loadedProgress,
    TResult? Function(_ErrorProgress value)? errorProgress,
  }) {
    return loadedProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadedProgress value)? loadedProgress,
    TResult Function(_ErrorProgress value)? errorProgress,
    required TResult orElse(),
  }) {
    if (loadedProgress != null) {
      return loadedProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadedProgress implements PendingState {
  const factory _LoadedProgress() = _$LoadedProgressImpl;
}

/// @nodoc
abstract class _$$ErrorProgressImplCopyWith<$Res> {
  factory _$$ErrorProgressImplCopyWith(
          _$ErrorProgressImpl value, $Res Function(_$ErrorProgressImpl) then) =
      __$$ErrorProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorProgressImplCopyWithImpl<$Res>
    extends _$PendingStateCopyWithImpl<$Res, _$ErrorProgressImpl>
    implements _$$ErrorProgressImplCopyWith<$Res> {
  __$$ErrorProgressImplCopyWithImpl(
      _$ErrorProgressImpl _value, $Res Function(_$ErrorProgressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorProgressImpl implements _ErrorProgress {
  const _$ErrorProgressImpl();

  @override
  String toString() {
    return 'PendingState.errorProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function() loadedProgress,
    required TResult Function() errorProgress,
  }) {
    return errorProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function()? loadedProgress,
    TResult? Function()? errorProgress,
  }) {
    return errorProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function()? loadedProgress,
    TResult Function()? errorProgress,
    required TResult orElse(),
  }) {
    if (errorProgress != null) {
      return errorProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadedProgress value) loadedProgress,
    required TResult Function(_ErrorProgress value) errorProgress,
  }) {
    return errorProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadedProgress value)? loadedProgress,
    TResult? Function(_ErrorProgress value)? errorProgress,
  }) {
    return errorProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadedProgress value)? loadedProgress,
    TResult Function(_ErrorProgress value)? errorProgress,
    required TResult orElse(),
  }) {
    if (errorProgress != null) {
      return errorProgress(this);
    }
    return orElse();
  }
}

abstract class _ErrorProgress implements PendingState {
  const factory _ErrorProgress() = _$ErrorProgressImpl;
}
