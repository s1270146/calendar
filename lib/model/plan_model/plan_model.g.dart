// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlanModel _$$_PlanModelFromJson(Map<String, dynamic> json) => _$_PlanModel(
      id: json['id'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      title: json['title'] as String,
      comment: json['comment'] as String,
      isAllDay: json['isAllDay'] as bool,
    );

Map<String, dynamic> _$$_PlanModelToJson(_$_PlanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'title': instance.title,
      'comment': instance.comment,
      'isAllDay': instance.isAllDay,
    };
