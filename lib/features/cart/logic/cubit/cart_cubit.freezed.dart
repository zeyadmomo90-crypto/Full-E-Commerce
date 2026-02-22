// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState()';
}


}

/// @nodoc
class $CartStateCopyWith<$Res>  {
$CartStateCopyWith(CartState _, $Res Function(CartState) __);
}


/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns on CartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( CartLoading value)?  loading,TResult Function( CartError value)?  error,TResult Function( CartLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CartLoading() when loading != null:
return loading(_that);case CartError() when error != null:
return error(_that);case CartLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( CartLoading value)  loading,required TResult Function( CartError value)  error,required TResult Function( CartLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case CartLoading():
return loading(_that);case CartError():
return error(_that);case CartLoaded():
return loaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( CartLoading value)?  loading,TResult? Function( CartError value)?  error,TResult? Function( CartLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CartLoading() when loading != null:
return loading(_that);case CartError() when error != null:
return error(_that);case CartLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ApiErrorModel error)?  error,TResult Function( List<CartModel> cart)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CartLoading() when loading != null:
return loading();case CartError() when error != null:
return error(_that.error);case CartLoaded() when loaded != null:
return loaded(_that.cart);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ApiErrorModel error)  error,required TResult Function( List<CartModel> cart)  loaded,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case CartLoading():
return loading();case CartError():
return error(_that.error);case CartLoaded():
return loaded(_that.cart);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ApiErrorModel error)?  error,TResult? Function( List<CartModel> cart)?  loaded,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CartLoading() when loading != null:
return loading();case CartError() when error != null:
return error(_that.error);case CartLoaded() when loaded != null:
return loaded(_that.cart);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CartState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState.initial()';
}


}




/// @nodoc


class CartLoading implements CartState {
  const CartLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState.loading()';
}


}




/// @nodoc


class CartError implements CartState {
  const CartError(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartErrorCopyWith<CartError> get copyWith => _$CartErrorCopyWithImpl<CartError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CartState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $CartErrorCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory $CartErrorCopyWith(CartError value, $Res Function(CartError) _then) = _$CartErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$CartErrorCopyWithImpl<$Res>
    implements $CartErrorCopyWith<$Res> {
  _$CartErrorCopyWithImpl(this._self, this._then);

  final CartError _self;
  final $Res Function(CartError) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(CartError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class CartLoaded implements CartState {
  const CartLoaded(final  List<CartModel> cart): _cart = cart;
  

 final  List<CartModel> _cart;
 List<CartModel> get cart {
  if (_cart is EqualUnmodifiableListView) return _cart;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cart);
}


/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartLoadedCopyWith<CartLoaded> get copyWith => _$CartLoadedCopyWithImpl<CartLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartLoaded&&const DeepCollectionEquality().equals(other._cart, _cart));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cart));

@override
String toString() {
  return 'CartState.loaded(cart: $cart)';
}


}

/// @nodoc
abstract mixin class $CartLoadedCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory $CartLoadedCopyWith(CartLoaded value, $Res Function(CartLoaded) _then) = _$CartLoadedCopyWithImpl;
@useResult
$Res call({
 List<CartModel> cart
});




}
/// @nodoc
class _$CartLoadedCopyWithImpl<$Res>
    implements $CartLoadedCopyWith<$Res> {
  _$CartLoadedCopyWithImpl(this._self, this._then);

  final CartLoaded _self;
  final $Res Function(CartLoaded) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cart = null,}) {
  return _then(CartLoaded(
null == cart ? _self._cart : cart // ignore: cast_nullable_to_non_nullable
as List<CartModel>,
  ));
}


}

// dart format on
