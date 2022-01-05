import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final animatedTextExample = animatedTextExamples();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          key: ValueKey(animatedTextExample.label),
          child: animatedTextExample.child,
        ),
      ],
    );
  }
}

class AnimatedTextExample {
  final String label;
  final Color? color;
  final Widget child;

  const AnimatedTextExample({
    required this.label,
    required this.color,
    required this.child,
  });
}

AnimatedTextExample animatedTextExamples({VoidCallback? onTap}) =>
    AnimatedTextExample(
      label: 'Typewriter',
      color: Colors.green,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 30.0,
          color: Colors.green
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText('Hello there... Karibu Nyumbani...'),
            TypewriterAnimatedText('A little introduction about myself', cursor: '|'),
            TypewriterAnimatedText('I am the one and only Amos Ahindukha...',
               cursor: '<|>'),
            TypewriterAnimatedText('an experienced, passionate '
               'and resilient software developer',
               cursor: '<|>'),
            TypewriterAnimatedText('Most important, I am a mentor, a great leader and loyal follower.',
               cursor: '💡'),
          ],
          onTap: onTap,
        ),
      ),
    );
