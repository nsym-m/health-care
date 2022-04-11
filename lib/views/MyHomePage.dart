import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_care/views/TestPage1.dart';
import 'package:health_care/viewModel/MyHomeViewModel.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(body: TestPage1());
  }
}
