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

/// Основний макет (відповідає ЛР №6)
class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1600,
      height: 750,
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Row(
              children: [
                const SizedBox(width: 250),

                InteractiveBlock(
                  text:
                      'Ще не вмерла Україна, і слава, і воля,\nще нам, браття молодії, усміхнеться',
                  baseColor: Colors.yellow,
                  width: 300,
                  height: 280,
                ),

                const SizedBox(width: 6),
                const Spacer(),

                InteractiveBlock(
                  text:
                      'Згинуть наші вороженьки, як роса на сонці,\nзапануєм і ми, браття, у своїй сторонці.',
                  baseColor: Colors.lightBlue,
                  width: 300,
                  height: 280,
                ),
              ],
            ),
          ),

          const SizedBox(height: 100),

          Row(
            children: const [
              SizedBox(width: 250),
              InteractiveBlock(
                text: 'І покажем, що ми, браття,\nкозацького роду.',
                baseColor: Colors.white,
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

/// ВЛАСНИЙ ВІДЖЕТ (StatefulWidget)
class InteractiveBlock extends StatefulWidget {
  final String text;
  final Color baseColor;
  final double width;
  final double height;

  const InteractiveBlock({
    super.key,
    required this.text,
    required this.baseColor,
    required this.width,
    required this.height,
  });

  @override
  State<InteractiveBlock> createState() => _InteractiveBlockState();
}

class _InteractiveBlockState extends State<InteractiveBlock> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _isPressed
              ? widget.baseColor.withOpacity(0.6)
              : widget.baseColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              blurRadius: 6,
              color: Colors.black26,
            ),
          ],
        ),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
