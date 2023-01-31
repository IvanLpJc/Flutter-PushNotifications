import 'package:flutter/material.dart';

import '../widgets/animated_string_text.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  // String title = 'dalkjfeofngviarñg';
  // String content = 'dalkjfeofngviarñg';

  @override
  void initState() {
    super.initState();
    // Con esto esperamos a que el widget esté dibujado para hacer algo
    //  WidgetsBinding.instance.addPostFrameCallback((_) => changeTitle());
  }

//  changeTitle() => setState(() => text = '');

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments ?? 'No data';

    return Scaffold(
      appBar: AppBar(
        title: const AnimatedStringText(
          'Message',
          duration: Duration(seconds: 5),
          curve: Curves.easeIn,
        ),
      ),
      body: Center(
        child: AnimatedStringText(
          '$args',
          duration: const Duration(seconds: 5),
          curve: Curves.easeIn,
        ),
      ),
    );
  }
}
