import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF2F4F5),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(vertical: 16.0),
          // child: Center(
          // можливо не треба
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Row(children: [const Text('ТУТ ІНПУТ БУДЕ')]),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Ознайомтеся з категоріями OLX',
                    selectionColor: .fromRGBO(2, 40, 44, 0),
                  ),
                ),
              ],
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
