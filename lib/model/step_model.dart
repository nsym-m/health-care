import 'package:flutter_riverpod/flutter_riverpod.dart';

final stepModelProvider = Provider((ref) => StepModel());

class StepModel {
  int counter = 0;
}

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
