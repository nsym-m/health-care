import 'package:flutter_riverpod/flutter_riverpod.dart';

final resultModelProvider = Provider((ref) => ResultModel());

class ResultModel {
  int counter = 0;
}
