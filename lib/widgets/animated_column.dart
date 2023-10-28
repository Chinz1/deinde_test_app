import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedColumn extends StatefulWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry padding;
  const AnimatedColumn({Key? key, required this.children, required this.padding}) : super(key: key);

  @override
  State<AnimatedColumn> createState() => _AnimatedColumnState();
}

class _AnimatedColumnState extends State<AnimatedColumn>  with TickerProviderStateMixin{
  AnimationController? animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 4000), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation =
    Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: const Interval(0.0, 1.0,
            curve: Curves.fastOutSlowIn),
      ),
    );
    animationController?.forward();
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding: widget.padding,
              child: ListView(
                children: widget.children,
              ),
            ),
          ),
        );
      },
    );
  }
}
