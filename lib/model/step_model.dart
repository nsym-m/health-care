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

final types = [
  HealthDataType.STEPS,
  HealthDataType.WEIGHT,
  HealthDataType.HEIGHT,
  HealthDataType.BLOOD_GLUCOSE,
  HealthDataType.SLEEP_ASLEEP,
  HealthDataType.SLEEP_AWAKE,
  HealthDataType.SLEEP_IN_BED,
];

final permissions = [
  HealthDataAccess.READ,
  HealthDataAccess.READ,
  HealthDataAccess.READ,
  HealthDataAccess.READ,
  HealthDataAccess.READ,
  HealthDataAccess.READ,
  HealthDataAccess.READ,
];

class StepModel {

  List<HealthDataPoint> _healthDataList = [];
  AppState _state = AppState.DATA_NOT_FETCHED;
  int _nofSteps = 10;
  double _mgdl = 10.0;

  HealthFactory health = HealthFactory();
}


