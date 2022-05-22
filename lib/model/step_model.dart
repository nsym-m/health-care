import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';

final stepModelProvider = Provider((ref) => StepModel());

enum AppState {
  DATA_NOT_FETCHED,
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTH_NOT_GRANTED,
  DATA_ADDED,
  DATA_NOT_ADDED,
  STEPS_READY,
}

class StepModel {
  List<HealthDataPoint> healthDataList = [];
  AppState state = AppState.DATA_NOT_FETCHED;
  int? steps = 0;
  int nofSteps = 10;
  double mgdl = 10.0;
  bool? hasPermission = false;

  HealthFactory health = HealthFactory();

  final types = [
    HealthDataType.STEPS,
  ];

  final permissions = [
    HealthDataAccess.READ,
  ];
}
