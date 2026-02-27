// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateUserState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateUserState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateUserState<$T>()';
}


}

/// @nodoc
class $CreateUserStateCopyWith<T,$Res>  {
$CreateUserStateCopyWith(CreateUserState<T> _, $Res Function(CreateUserState<T>) __);
}


/// Adds pattern-matching-related methods to [CreateUserState].
extension CreateUserStatePatterns<T> on CreateUserState<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<T> value)?  initial,TResult Function( CreateUserLoading<T> value)?  loading,TResult Function( CreateUserSuccess<T> value)?  success,TResult Function( CreateUserFailure<T> value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CreateUserLoading() when loading != null:
return loading(_that);case CreateUserSuccess() when success != null:
return success(_that);case CreateUserFailure() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<T> value)  initial,required TResult Function( CreateUserLoading<T> value)  loading,required TResult Function( CreateUserSuccess<T> value)  success,required TResult Function( CreateUserFailure<T> value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case CreateUserLoading():
return loading(_that);case CreateUserSuccess():
return success(_that);case CreateUserFailure():
return failure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<T> value)?  initial,TResult? Function( CreateUserLoading<T> value)?  loading,TResult? Function( CreateUserSuccess<T> value)?  success,TResult? Function( CreateUserFailure<T> value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CreateUserLoading() when loading != null:
return loading(_that);case CreateUserSuccess() when success != null:
return success(_that);case CreateUserFailure() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( T data)?  success,TResult Function( ApiErrorModel failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CreateUserLoading() when loading != null:
return loading();case CreateUserSuccess() when success != null:
return success(_that.data);case CreateUserFailure() when failure != null:
return failure(_that.failure);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( T data)  success,required TResult Function( ApiErrorModel failure)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case CreateUserLoading():
return loading();case CreateUserSuccess():
return success(_that.data);case CreateUserFailure():
return failure(_that.failure);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( T data)?  success,TResult? Function( ApiErrorModel failure)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CreateUserLoading() when loading != null:
return loading();case CreateUserSuccess() when success != null:
return success(_that.data);case CreateUserFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial<T> implements CreateUserState<T> {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateUserState<$T>.initial()';
}


}




/// @nodoc


class CreateUserLoading<T> implements CreateUserState<T> {
  const CreateUserLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateUserLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateUserState<$T>.loading()';
}


}




/// @nodoc


class CreateUserSuccess<T> implements CreateUserState<T> {
  const CreateUserSuccess(this.data);
  

 final  T data;

/// Create a copy of CreateUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateUserSuccessCopyWith<T, CreateUserSuccess<T>> get copyWith => _$CreateUserSuccessCopyWithImpl<T, CreateUserSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateUserSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CreateUserState<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $CreateUserSuccessCopyWith<T,$Res> implements $CreateUserStateCopyWith<T, $Res> {
  factory $CreateUserSuccessCopyWith(CreateUserSuccess<T> value, $Res Function(CreateUserSuccess<T>) _then) = _$CreateUserSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$CreateUserSuccessCopyWithImpl<T,$Res>
    implements $CreateUserSuccessCopyWith<T, $Res> {
  _$CreateUserSuccessCopyWithImpl(this._self, this._then);

  final CreateUserSuccess<T> _self;
  final $Res Function(CreateUserSuccess<T>) _then;

/// Create a copy of CreateUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(CreateUserSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class CreateUserFailure<T> implements CreateUserState<T> {
  const CreateUserFailure(this.failure);
  

 final  ApiErrorModel failure;

/// Create a copy of CreateUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateUserFailureCopyWith<T, CreateUserFailure<T>> get copyWith => _$CreateUserFailureCopyWithImpl<T, CreateUserFailure<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateUserFailure<T>&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'CreateUserState<$T>.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $CreateUserFailureCopyWith<T,$Res> implements $CreateUserStateCopyWith<T, $Res> {
  factory $CreateUserFailureCopyWith(CreateUserFailure<T> value, $Res Function(CreateUserFailure<T>) _then) = _$CreateUserFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel failure
});




}
/// @nodoc
class _$CreateUserFailureCopyWithImpl<T,$Res>
    implements $CreateUserFailureCopyWith<T, $Res> {
  _$CreateUserFailureCopyWithImpl(this._self, this._then);

  final CreateUserFailure<T> _self;
  final $Res Function(CreateUserFailure<T>) _then;

/// Create a copy of CreateUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(CreateUserFailure<T>(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
