import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'transformStore.dart'; // Import Transform Store

final transformText = TransformText(); // Instantiate the store

void main() => runApp(ProviderDemo());

class ProviderDemo extends StatelessWidget {
  const ProviderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WidgetLevel1(),
    );
  }
}

class WidgetLevel1 extends StatelessWidget {
  const WidgetLevel1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('His Mom'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('this is level 1 of widget tree'),
          WidgetLevel2(),
          SizedBox(
            width: double.infinity,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (() {
          transformText.toggle();
        }),
      ),
    );
  }
}

class WidgetLevel2 extends StatelessWidget {
  const WidgetLevel2({Key? key}) : super(key: key);
  final String text = 'This is Level 2 of widget tree with MiXeD CaPiTaLiZe.';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      width: 100.0,
      height: 100.0,
      color: Colors.cyan,
      child: Observer(
        builder: (_) => Text(transformText.transform == 'uppercase'
            ? text.toUpperCase()
            : transformText.transform == 'lowercase'
                ? text.toLowerCase()
                : text),
      ),
    );
  }
}
