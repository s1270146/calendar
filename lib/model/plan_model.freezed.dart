// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlanModel _$PlanModelFromJson(Map<String, dynamic> json) {
  return _PlanModel.fromJson(json);
}

/// @nodoc
mixin _$PlanModel {
  String get id => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  bool get isAllDay => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanModelCopyWith<PlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanModelCopyWith<$Res> {
  factory $PlanModelCopyWith(PlanModel value, $Res Function(PlanModel) then) =
      _$PlanModelCopyWithImpl<$Res, PlanModel>;
  @useResult
  $Res call(
      {String id,
      DateTime startDate,
      DateTime endDate,
      String title,
      String comment,
      bool isAllDay});
}

/// @nodoc
class _$PlanModelCopyWithImpl<$Res, $Val extends PlanModel>
    implements $PlanModelCopyWith<$Res> {
  _$PlanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? title = null,
    Object? comment = null,
    Object? isAllDay = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      isAllDay: null == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlanModelCopyWith<$Res> implements $PlanModelCopyWith<$Res> {
  factory _$$_PlanModelCopyWith(
          _$_PlanModel value, $Res Function(_$_PlanModel) then) =
      __$$_PlanModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime startDate,
      DateTime endDate,
      String title,
      String comment,
      bool isAllDay});
}

/// @nodoc
class __$$_PlanModelCopyWithImpl<$Res>
    extends _$PlanModelCopyWithImpl<$Res, _$_PlanModel>
    implements _$$_PlanModelCopyWith<$Res> {
  __$$_PlanModelCopyWithImpl(
      _$_PlanModel _value, $Res Function(_$_PlanModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? title = null,
    Object? comment = null,
    Object? isAllDay = null,
  }) {
    return _then(_$_PlanModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      isAllDay: null == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlanModel with DiagnosticableTreeMixin implements _PlanModel {
  const _$_PlanModel(
      {required this.id,
      required this.startDate,
      required this.endDate,
      required this.title,
      required this.comment,
      required this.isAllDay});

  factory _$_PlanModel.fromJson(Map<String, dynamic> json) =>
      _$$_PlanModelFromJson(json);

  @override
  final String id;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String title;
  @override
  final String comment;
  @override
  final bool isAllDay;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlanModel(id: $id, startDate: $startDate, endDate: $endDate, title: $title, comment: $comment, isAllDay: $isAllDay)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlanModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('startDate', startDate))
      ..add(DiagnosticsProperty('endDate', endDate))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('isAllDay', isAllDay));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlanModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.isAllDay, isAllDay) ||
                other.isAllDay == isAllDay));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, startDate, endDate, title, comment, isAllDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlanModelCopyWith<_$_PlanModel> get copyWith =>
      __$$_PlanModelCopyWithImpl<_$_PlanModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlanModelToJson(
      this,
    );
  }
}

abstract class _PlanModel implements PlanModel {
  const factory _PlanModel(
      {required final String id,
      required final DateTime startDate,
      required final DateTime endDate,
      required final String title,
      required final String comment,
      required final bool isAllDay}) = _$_PlanModel;

  factory _PlanModel.fromJson(Map<String, dynamic> json) =
      _$_PlanModel.fromJson;

  @override
  String get id;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String get title;
  @override
  String get comment;
  @override
  bool get isAllDay;
  @override
  @JsonKey(ignore: true)
  _$$_PlanModelCopyWith<_$_PlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}
