import 'package:flutter/material.dart';

class AutoScrolledText extends StatefulWidget {
  const AutoScrolledText({super.key, required this.text, this.style});

  final String text;
  final TextStyle? style;

  @override
  State<AutoScrolledText> createState() => _AutoScrolledTextState();
}

class _AutoScrolledTextState extends State<AutoScrolledText>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: false);

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        _scrollController.jumpTo(
            _scrollController.position.maxScrollExtent * _animation.value);
      });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: Text(
        widget.text,
        style: widget.style,
      ),
    );
  }
}
