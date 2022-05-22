import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';
import 'package:health_care/model/step_model.dart';
import 'package:health_care/viewModel/my_home_view_model.dart';
import 'package:health_care/viewModel/step_view_model.dart';

class HealthAppView extends ConsumerWidget {
  const HealthAppView({Key? key}) : super(key: key);

  Widget _contentFetchingData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(20),
            child: CircularProgressIndicator(
              strokeWidth: 10,
            )),
        Text('Fetching data...')
      ],
    );
  }

  Widget _contentNoData() {
    return Text('No Data to show');
  }

  Widget _contentNotFetched() {
    return const Text('まだ歩数取得できてませ〜〜〜〜〜ん');
  }

  Widget _authorizationNotGranted() {
    return const Text(
      'Authorization not given. '
      'For Android please check your OAUTH2 client ID is correct in Google Developer Console. '
      'For iOS check your permissions in Apple Health.',
    );
  }

  Widget _stepsFetched(StepViewModel viewModel) {
    return Text('Total number of steps: ${viewModel.step?.steps}');
  }

  Widget _dataNotAdded() {
    return const Text('Failed to add data');
  }

  Widget _content(StepViewModel viewModel) {
    if (viewModel.step?.state == AppState.NO_DATA) {
      return _contentNoData();
    } else if (viewModel.step?.state == AppState.FETCHING_DATA) {
      return _contentFetchingData();
    } else if (viewModel.step?.state == AppState.AUTH_NOT_GRANTED) {
      return _authorizationNotGranted();
    } else if (viewModel.step?.state == AppState.STEPS_READY) {
      return _stepsFetched(viewModel);
    } else if (viewModel.step?.state == AppState.DATA_NOT_ADDED) {
      return _dataNotAdded();
    }

    return _contentNotFetched();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(stepViewModelProvider);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _stepsFetched(viewModel),
            TextButton(
              onPressed: () => {Navigator.of(context).pop()},
              child: const Text('戻る', style: TextStyle(fontSize: 40)),
            ),
            TextButton(
              onPressed: viewModel.fetchStepData,
              child: const Text('今日の歩数取得', style: TextStyle(fontSize: 40)),
            ),
          ]),
        ),
      ),
    );
  }
}
