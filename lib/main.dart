import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_prototype/models/hello-world-model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HelloWorldModel>(
      create: (context) => HelloWorldModel(),
      child: MaterialApp(
        title: 'Provider Prototype',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Prototype"),
      ),
      body: Center(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.amberAccent,
            child: Consumer<HelloWorldModel>(
              builder: (BuildContext context, myModel, Widget child) {
                return RaisedButton(
                    child: Text('Click me'),
                    onPressed: () {
                      myModel.updateDisplayMessage();
                    });
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(35),
            color: Theme.of(context).primaryColor,
            child: Consumer<HelloWorldModel>(
              builder: (BuildContext context, helloWorldModel, Widget child) {
                return Text(helloWorldModel.displayMessage);
            },
          ),)
        ]),
      ),
    );
  }
}
