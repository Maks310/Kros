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
            width: 1600, // загальна ширина
            height: 750, // загальна висота
            //lor: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
              children: [
                // Верхній ряд з двома контейнерами
                SizedBox(
                  height: 150, // а
                  child: Row(
                    children: [
                      SizedBox(width: 250), // f
                      Container(
                        width: 300, // g
                        height: 280, // b
                        color: Colors.yellow,
                        alignment: Alignment.center,
                        child: const Text(
                          'Ще не вмерла Україна, і слава, і воля, ще нам, браття молодії, усміхнеться',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 6), // r
                      Spacer(),
                      Container(
                        width: 300, // h
                        height: 280, // b
                        
                        color: Colors.blue[200],
                        alignment: Alignment.center,
                        child: const Text(
                          'Згинуть наші вороженьки, як роса на сонці,\nзапануєм і ми, браття, у своїй сторонці.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    
                    ],
                  ),
                ),
                // Нижній ряд з контейнером
                SizedBox(height: 100), // c
                Row(
                  children: [
                    SizedBox(width: 250), // k
                    Container(
                      width: 250, // m
                      height: 130, // d
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: const Text(
                        'І покажем, що ми, браття,\nкозацького роду.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
