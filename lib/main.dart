import 'package:flutter/material.dart';
import 'package:video_player_app/pages/basic_page.dart';
import 'package:video_player_app/pages/orientation_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        fontFamily: 'Georgia',
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar:  AppBar(
        //   title: DefaultTabController(
        //     length: 3,
        //     child: TabBar(tabs: [
        //       Text('Asset'),
        //       Text('File'),
        //       Text('Network')
        //     ]),
        //   ),
        // ),
        body: Center(child: buildPages()),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          currentIndex: index,
          onTap: (int index) => setState(() => this.index = index),
          items: const [
            BottomNavigationBarItem(
                icon: Text(
                  'VideoPlayer',
                ),
                label: 'Basic'
                //   title: Text('Basics'),
                ),
            BottomNavigationBarItem(
                icon: Text(
                  'VideoPlayer',
                ),
                label: 'Orientation'
                // title: Text('Orientation'),
                ),
          ],
        ));
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return BasicsPage();
      case 1:
        return OrientationPage();
      default:
        return Container();
    }
  }
}
