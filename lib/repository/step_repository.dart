import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';
import 'package:health_care/model/step_model.dart';

final stepRepositoryProvider =
    Provider((ref) => StepRepositoryImpl(model: ref.read(stepModelProvider)));

abstract class StepRepository {
  Future<StepModel> fetchStepData();
  Future<bool> authorizetion();
}

class StepRepositoryImpl implements StepRepository {
  StepRepositoryImpl({required StepModel model}) : _model = model;

  final StepModel _model;

  /// 今日の歩数を取得
  @override
  Future<StepModel> fetchStepData() async {
    // get steps for today (i.e., since midnight)
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    try {
      _model.steps = await _model.health.getTotalStepsInInterval(midnight, now);
    } catch (error) {
      print("Caught exception in getTotalStepsInInterval: $error");
    }

    return Future.value(_model);
  }

  @override
  Future<bool> authorizetion() async {
    final hasPermission = HealthFactory.hasPermissions(_model.types,
        permissions: _model.permissions,);

    if (hasPermission == null) {
      await HealthFactory.requestPermissions(_model.types);
    }
    final requestedAuthorization = await _model.health
        .requestAuthorization(_model.types, permissions: _model.permissions);

    return requestedAuthorization;
  }
}
