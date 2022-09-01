// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PostListEventTearOff {
  const _$PostListEventTearOff();

  LoadPosts loadPost(int userId) {
    return LoadPosts(
      userId,
    );
  }
}

/// @nodoc
const $PostListEvent = _$PostListEventTearOff();

/// @nodoc
mixin _$PostListEvent {
  int get userId => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int userId) loadPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int userId)? loadPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int userId)? loadPost,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPosts value) loadPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadPosts value)? loadPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPosts value)? loadPost,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostListEventCopyWith<PostListEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostListEventCopyWith<$Res> {
  factory $PostListEventCopyWith(
          PostListEvent value, $Res Function(PostListEvent) then) =
      _$PostListEventCopyWithImpl<$Res>;
  $Res call({int userId});
}

/// @nodoc
class _$PostListEventCopyWithImpl<$Res>
    implements $PostListEventCopyWith<$Res> {
  _$PostListEventCopyWithImpl(this._value, this._then);

  final PostListEvent _value;
  // ignore: unused_field
  final $Res Function(PostListEvent) _then;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class $LoadPostsCopyWith<$Res>
    implements $PostListEventCopyWith<$Res> {
  factory $LoadPostsCopyWith(LoadPosts value, $Res Function(LoadPosts) then) =
      _$LoadPostsCopyWithImpl<$Res>;
  @override
  $Res call({int userId});
}

/// @nodoc
class _$LoadPostsCopyWithImpl<$Res> extends _$PostListEventCopyWithImpl<$Res>
    implements $LoadPostsCopyWith<$Res> {
  _$LoadPostsCopyWithImpl(LoadPosts _value, $Res Function(LoadPosts) _then)
      : super(_value, (v) => _then(v as LoadPosts));

  @override
  LoadPosts get _value => super._value as LoadPosts;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(LoadPosts(
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadPosts implements LoadPosts {
  const _$LoadPosts(this.userId);

  @override
  final int userId;

  @override
  String toString() {
    return 'PostListEvent.loadPost(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadPosts &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  $LoadPostsCopyWith<LoadPosts> get copyWith =>
      _$LoadPostsCopyWithImpl<LoadPosts>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int userId) loadPost,
  }) {
    return loadPost(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int userId)? loadPost,
  }) {
    return loadPost?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int userId)? loadPost,
    required TResult orElse(),
  }) {
    if (loadPost != null) {
      return loadPost(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPosts value) loadPost,
  }) {
    return loadPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadPosts value)? loadPost,
  }) {
    return loadPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPosts value)? loadPost,
    required TResult orElse(),
  }) {
    if (loadPost != null) {
      return loadPost(this);
    }
    return orElse();
  }
}

abstract class LoadPosts implements PostListEvent {
  const factory LoadPosts(int userId) = _$LoadPosts;

  @override
  int get userId;
  @override
  @JsonKey(ignore: true)
  $LoadPostsCopyWith<LoadPosts> get copyWith =>
      throw _privateConstructorUsedError;
}
