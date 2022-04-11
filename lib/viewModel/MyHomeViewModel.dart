// ViewModelの格納先はChangeNotifierProviderとなる
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_care/repository/MyHomeRepository.dart';

final myHomeViewModelProvider = ChangeNotifierProvider(
    (ref) => MyHomeViewModel(repository: ref.read(myHomeRepositoryProvider)));

// ChangeNotifierを継承することで、呼び出し元に変更を通知することが可能
class MyHomeViewModel extends ChangeNotifier {
  int _counter = 0;

  MyHomeRepository? repository;

  MyHomeViewModel({this.repository});

  int getCounter() {
    return _counter;
  }

  void incrementCounter() {
    this.repository?.incrementCounter().then((resultModel) {
      _counter = resultModel.counter;
      // 以下を実行することで、呼び出し元に変更が通知され、setStateしたときと同様に画面がリビルドされる
      notifyListeners();
    });
  }
}
