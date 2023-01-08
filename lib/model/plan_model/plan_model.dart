import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'plan_model.freezed.dart';
part 'plan_model.g.dart';

@freezed
class PlanModel with _$PlanModel {
  const factory PlanModel({
    required String id,
    required DateTime startDate,
    required DateTime endDate,
    required String title,
    required String comment,
    required bool isAllDay,
  }) = _PlanModel;

  factory PlanModel.fromJson(Map<String, Object?> json) =>
      _$PlanModelFromJson(json);

  factory PlanModel.toModel(String id, Map<String, Object?> json) {
    json['id'] = id;
    return PlanModel.fromJson(json);
  }
}
