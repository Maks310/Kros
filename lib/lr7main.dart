import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 350,
            height: 200,
            color: Colors.yellow, // зовнішній контейнер
            child: Stack(
              children: [

                // Зелений верхній прямокутник (b)
                Positioned(
                  top: 12, // a
                  left: 12,
                  right: 0,
                  height: 200, // b
                  child: Container(color: Colors.green),
                ),

                // Синій прямокутник
                Positioned(
                  top: 26, // a + b
                  left: 26,
                  right: 0,
                  height: 200, // c
                  child: Container(color: Colors.blue),
                ),

                // Фіолетовий прямокутник
                Positioned(
                  top: 50,
                  left: 60,
                  right: 0,
                  bottom: 0,
                  child: Container(color: Colors.deepPurple[200]),
                ),

                // Вертикальний текст "L I V I V"
                Positioned(
                  top: 80,
                  left: 2,
                  child: Column(
                    children: const [
                      Text('L', style: TextStyle(color: Colors.green, fontSize: 12)),
                      Text('I', style: TextStyle(color: Colors.green, fontSize: 12)),
                      Text('V', style: TextStyle(color: Colors.green, fontSize: 12)),
                      Text('I', style: TextStyle(color: Colors.green, fontSize: 12)),
                      Text('V', style: TextStyle(color: Colors.green, fontSize: 12)),
                    ],
                  ),
                ),

                // Вертикальний текст "B E S T"
                Positioned(
                  top: 80,
                  left: 15,
                  child: Column(
                    children: const [
                      Text('B', style: TextStyle(color: Colors.yellow, fontSize: 12)),
                      Text('E', style: TextStyle(color: Colors.yellow, fontSize: 12)),
                      Text('S', style: TextStyle(color: Colors.yellow, fontSize: 12)),
                      Text('T', style: TextStyle(color: Colors.yellow, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
