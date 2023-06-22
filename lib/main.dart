import 'package:flutter/material.dart';
import 'views/auth/route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CassoaTraveller());
}

class CassoaTraveller extends StatelessWidget {
  const CassoaTraveller({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const CheckIfSignedIn(),
    );
  }
}

