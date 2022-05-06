import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_care/views/test_page_1.dart';
import 'package:health_care/viewModel/my_home_view_model.dart';

class MyHomePage extends ConsumerWidget {
  // StatefulWidgetからConsumerWidgetに変更

  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override // 実装が強要されるため、_MyHomePageStateのreturn内容をそのまま入れる
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watchメソッドのパラメータにChangeNotifierProviderに格納したMyHomeViewModelを取得する
    // これによって、_viewModelでnotifyListeners()が実行された場合、本Widgetのリビルドが走る
    final _viewModel = ref.watch(myHomeViewModelProvider);

    // _MyHomePageStateのreturn内容をそのまま入れる
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
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${_viewModel.getCounter()}', // <-- _viewModelのgetCounter()に置き換え
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
              Container(
                // width: double.minPositive,
                height: 60,
                child: Column(
                  children: <Widget>[
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return TestPage1();
                        }));
                      },
                      child: Text('go to next page'),
                    ),
                  ],
                ),
              )
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            _viewModel.incrementCounter, // <-- _viewModelのincrementCounterに置き換え
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
