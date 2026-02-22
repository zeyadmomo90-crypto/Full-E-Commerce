// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState()';
}


}

/// @nodoc
class $CategoryStateCopyWith<$Res>  {
$CategoryStateCopyWith(CategoryState _, $Res Function(CategoryState) __);
}


/// Adds pattern-matching-related methods to [CategoryState].
extension CategoryStatePatterns on CategoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( CategoryLoading value)?  categoryLoading,TResult Function( CategoryLoaded value)?  categoryLoaded,TResult Function( CategoryFailure value)?  categoryFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CategoryLoading() when categoryLoading != null:
return categoryLoading(_that);case CategoryLoaded() when categoryLoaded != null:
return categoryLoaded(_that);case CategoryFailure() when categoryFailure != null:
return categoryFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( CategoryLoading value)  categoryLoading,required TResult Function( CategoryLoaded value)  categoryLoaded,required TResult Function( CategoryFailure value)  categoryFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case CategoryLoading():
return categoryLoading(_that);case CategoryLoaded():
return categoryLoaded(_that);case CategoryFailure():
return categoryFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( CategoryLoading value)?  categoryLoading,TResult? Function( CategoryLoaded value)?  categoryLoaded,TResult? Function( CategoryFailure value)?  categoryFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CategoryLoading() when categoryLoading != null:
return categoryLoading(_that);case CategoryLoaded() when categoryLoaded != null:
return categoryLoaded(_that);case CategoryFailure() when categoryFailure != null:
return categoryFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  categoryLoading,TResult Function( List<Category> categories,  int selectedId)?  categoryLoaded,TResult Function( ApiErrorModel errorModel)?  categoryFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CategoryLoading() when categoryLoading != null:
return categoryLoading();case CategoryLoaded() when categoryLoaded != null:
return categoryLoaded(_that.categories,_that.selectedId);case CategoryFailure() when categoryFailure != null:
return categoryFailure(_that.errorModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  categoryLoading,required TResult Function( List<Category> categories,  int selectedId)  categoryLoaded,required TResult Function( ApiErrorModel errorModel)  categoryFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case CategoryLoading():
return categoryLoading();case CategoryLoaded():
return categoryLoaded(_that.categories,_that.selectedId);case CategoryFailure():
return categoryFailure(_that.errorModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  categoryLoading,TResult? Function( List<Category> categories,  int selectedId)?  categoryLoaded,TResult? Function( ApiErrorModel errorModel)?  categoryFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CategoryLoading() when categoryLoading != null:
return categoryLoading();case CategoryLoaded() when categoryLoaded != null:
return categoryLoaded(_that.categories,_that.selectedId);case CategoryFailure() when categoryFailure != null:
return categoryFailure(_that.errorModel);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CategoryState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState.initial()';
}


}




/// @nodoc


class CategoryLoading implements CategoryState {
  const CategoryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState.categoryLoading()';
}


}




/// @nodoc


class CategoryLoaded implements CategoryState {
  const CategoryLoaded({required final  List<Category> categories, required this.selectedId}): _categories = categories;
  

 final  List<Category> _categories;
 List<Category> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  int selectedId;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryLoadedCopyWith<CategoryLoaded> get copyWith => _$CategoryLoadedCopyWithImpl<CategoryLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryLoaded&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.selectedId, selectedId) || other.selectedId == selectedId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),selectedId);

@override
String toString() {
  return 'CategoryState.categoryLoaded(categories: $categories, selectedId: $selectedId)';
}


}

/// @nodoc
abstract mixin class $CategoryLoadedCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory $CategoryLoadedCopyWith(CategoryLoaded value, $Res Function(CategoryLoaded) _then) = _$CategoryLoadedCopyWithImpl;
@useResult
$Res call({
 List<Category> categories, int selectedId
});




}
/// @nodoc
class _$CategoryLoadedCopyWithImpl<$Res>
    implements $CategoryLoadedCopyWith<$Res> {
  _$CategoryLoadedCopyWithImpl(this._self, this._then);

  final CategoryLoaded _self;
  final $Res Function(CategoryLoaded) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? selectedId = null,}) {
  return _then(CategoryLoaded(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,selectedId: null == selectedId ? _self.selectedId : selectedId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class CategoryFailure implements CategoryState {
  const CategoryFailure(this.errorModel);
  

 final  ApiErrorModel errorModel;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryFailureCopyWith<CategoryFailure> get copyWith => _$CategoryFailureCopyWithImpl<CategoryFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryFailure&&(identical(other.errorModel, errorModel) || other.errorModel == errorModel));
}


@override
int get hashCode => Object.hash(runtimeType,errorModel);

@override
String toString() {
  return 'CategoryState.categoryFailure(errorModel: $errorModel)';
}


}

/// @nodoc
abstract mixin class $CategoryFailureCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory $CategoryFailureCopyWith(CategoryFailure value, $Res Function(CategoryFailure) _then) = _$CategoryFailureCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel errorModel
});




}
/// @nodoc
class _$CategoryFailureCopyWithImpl<$Res>
    implements $CategoryFailureCopyWith<$Res> {
  _$CategoryFailureCopyWithImpl(this._self, this._then);

  final CategoryFailure _self;
  final $Res Function(CategoryFailure) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorModel = null,}) {
  return _then(CategoryFailure(
null == errorModel ? _self.errorModel : errorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
