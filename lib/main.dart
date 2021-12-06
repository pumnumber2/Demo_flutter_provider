import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ProviderDemo());

class ProviderDemo extends StatelessWidget {
  const ProviderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TextTransformContext>(
      create: (_) => TextTransformContext(),
      child: MaterialApp(
        home: WidgetLevel1(),
      ),
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
          // When using Provider in onPressed Function you need to set listen: false
          // to prevent Provider in onPressed reupdate.
          Provider.of<TextTransformContext>(context, listen: false)
              .toggleTransform();
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
    String transform = Provider.of<TextTransformContext>(context).textTransform;
    bool isUpperCase = transform == 'uppercase';
    bool isLowerCase = transform == 'lowercase';
    return Container(
      margin: EdgeInsets.all(15.0),
      width: 100.0,
      height: 100.0,
      color: Colors.cyan,
      child: Text(isUpperCase
          ? text.toUpperCase()
          : isLowerCase
              ? text.toLowerCase()
              : text),
    );
  }
}

// Change Notifier is from Flutter by default when value of this class has been
// Changed and run notifyListeners() it'll notify all widget who use this data
// it's gonna merging with Provider that like global state management in redux.
class TextTransformContext extends ChangeNotifier {
  String textTransform = '';
  void toggleTransform() {
    textTransform = textTransform == 'lowercase' ? 'uppercase' : 'lowercase';
    // Notify new value to all widget to rebuild of changed.
    notifyListeners();
  }
}
