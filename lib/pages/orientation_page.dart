import 'package:flutter/material.dart';

import '../widgets/orientation/landsccape_player_widget.dart';
import '../widgets/orientation/portrait_landscape_player_page.dart';
import '../widgets/orientation/portrait_player.dart';
import 'basic_page.dart';

class OrientationPage extends StatelessWidget {
  const OrientationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarWidget(
      const [
        Tab(icon: Icon(Icons.screen_lock_portrait), text: 'Portrait'),
        Tab(icon: Icon(Icons.screen_lock_landscape), text: 'Landscape'),
        Tab(icon: Icon(Icons.screen_rotation), text: 'Both'),
      ],
      (index) {
        switch (index) {
          case 1:
            goToLandscape(context);
            break;
          case 2:
            goToPortraitAndLandscape(context);
            break;
        }
      },
      children: [
        buildPortrait(),
        buildLandscape(context),
        buildPortraitAndLandscape(context),
      ],
    );
  }

  Widget buildPortrait() => PortraitPlayer();

  Widget buildLandscape(BuildContext context) => buildButton(
        text: 'Back To Landscape',
        onClicked: () => goToLandscape(context),
      );

  Widget buildPortraitAndLandscape(BuildContext context) => buildButton(
        text: 'Back To Both',
        onClicked: () => goToPortraitAndLandscape(context),
      );

  Widget buildButton({
    required String text,
    required VoidCallback onClicked,
  }) =>
      Center(
        child: TextButton(
          child: Text(
            text,
            style: TextStyle(fontSize: 24),
          ),
          onPressed: onClicked,
        ),
      );

  void goToLandscape(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => LandscapePlayerPage()));

  void goToPortraitAndLandscape(BuildContext context) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PortraitLandscapePlayerPage()));
}
