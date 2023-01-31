import 'package:flutter/material.dart';
import 'package:push_notifications/widgets/animated_string_text.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  String text = 'dalkjfeofngviarñg';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => changeTitle());
  }

  changeTitle() => setState(() => text = 'This is the title');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedStringText(
          text,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        ),
      ),
    );
  }
}
