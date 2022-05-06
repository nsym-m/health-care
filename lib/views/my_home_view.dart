import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_care/viewModel/my_home_view_model.dart';

class MyHomeView extends ConsumerWidget {
  const MyHomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watchメソッドのパラメータにChangeNotifierProviderに格納したMyHomeViewModelを取得する
    // これによって、_viewModelでnotifyListeners()が実行された場合、本Widgetのリビルドが走る
    final viewModel = ref.watch(myHomeViewModelProvider);

    // MyHomePageStateのreturn内容をそのまま入れる
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 60,
                color: Colors.grey[200],
                child: Column(
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${viewModel.getCounter()}', // <-- viewModelのgetCounter()に置き換え
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              )
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            viewModel.incrementCounter, // <-- viewModelのincrementCounterに置き換え
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
