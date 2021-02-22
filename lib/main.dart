import 'package:ElBladiya/presentation/widgets/post_widget.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_6INC5O_Fmb07C4w8d3GrfMSc6WKj3Y14Fw&usqp=CAU",
          fit: BoxFit.contain,
          scale: 2,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
          },
        ),
        actions: [
          Icon(
            Icons.add,
            color: Colors.grey,
          ),
        ],
      ),
      backgroundColor: Colors.grey,
      body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: 6,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.all(10.0),
          itemBuilder: (context, index) {
            return Post();
          }),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Increment',
        child: new Icon(Icons.add),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: IconButton(icon: Icon(Icons.home)),
            ),
            Expanded(
              child: IconButton(icon: Icon(Icons.show_chart)),
            ),
            Expanded(child: new Text('')),
            Expanded(
              child: IconButton(icon: Icon(Icons.tab)),
            ),
            Expanded(
              child: IconButton(icon: Icon(Icons.settings)),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
