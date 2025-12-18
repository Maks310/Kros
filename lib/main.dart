import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: MainLayout(),
        ),
      ),
    );
  }
}

/// Основний макет (ЛР6)
class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1600,
      height: 750,
      child: Column(
        children: [
          // Верхній ряд
          SizedBox(
            height: 150,
            child: Row(
              children: [
                const SizedBox(width: 250),

                PoemBlock(
                  text:
                      'Ще не вмерла Україна, і слава, і воля,\nще нам, браття молодії, усміхнеться',
                  color: Colors.yellow,
                  width: 300,
                  height: 280,
                ),

                const SizedBox(width: 6),
                const Spacer(),

                PoemBlock(
                  text:
                      'Згинуть наші вороженьки, як роса на сонці,\nзапануєм і ми, браття, у своїй сторонці.',
                  color: Colors.lightBlue,
                  width: 300,
                  height: 280,
                ),
              ],
            ),
          ),

          const SizedBox(height: 100),

          // Нижній ряд
          Row(
            children: const [
              SizedBox(width: 250),
              PoemBlock(
                text: 'І покажем, що ми, браття,\nкозацького роду.',
                color: Colors.white,
                width: 250,
                height: 130,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// ВЛАСНИЙ ВІДЖЕТ (StatelessWidget)
class PoemBlock extends StatelessWidget {
  final String text;
  final Color color;
  final double width;
  final double height;

  const PoemBlock({
    super.key,
    required this.text,
    required this.color,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black26,
          ),
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
