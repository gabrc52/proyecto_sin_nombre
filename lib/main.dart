import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/onboarding.dart';
import 'package:provider/provider.dart';
import 'models/app_state.dart';
import 'models/constants.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (context) => AppState(),
      child: MaterialApp(
        title: app_name,
        theme: new_light_theme,
        darkTheme: dark_theme,
        home: OnboardingPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
