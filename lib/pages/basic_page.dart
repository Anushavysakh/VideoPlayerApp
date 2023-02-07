import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player_app/widgets/file_player.dart';

import '../widgets/asset_player.dart';

class BasicsPage extends StatefulWidget {
  const BasicsPage({Key? key}) : super(key: key);

  @override
  State<BasicsPage> createState() => _BasicsPageState();
}

class _BasicsPageState extends State<BasicsPage> {
  @override
  Widget build(BuildContext context) {
    return TabBarWidget(
        const [ Tab(
          text: 'Asset',
        ),
          Tab(
            text: 'File',
          ),
          Tab(
            text: 'Network',
          )
        ],
        (value) {},
        children: const [AssetPlayer(), FilePlayer()]);
  }
}

class TabBarWidget extends StatelessWidget {
  final List<Tab> tabs;
  final List<Widget> children;
  final ValueChanged<int> onTap;

  TabBarWidget(this.tabs, this.onTap, {required this.children});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
              decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purple, Colors.red],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft),
          )),
          toolbarHeight: 20,
          bottom: TabBar(
            onTap: onTap,
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            tabs: tabs,

          ),
        ),

        bottomNavigationBar: SafeArea(
          child: TabBarView(children: children,)
        ),
      ),
    );
  }
}
