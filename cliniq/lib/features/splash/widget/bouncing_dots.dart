import 'package:cliniq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BouncingDots extends StatefulWidget {
  const BouncingDots({super.key});

  @override
  State<BouncingDots> createState() => _BouncingDotsState();
}

class _BouncingDotsState extends State<BouncingDots> 
  with TickerProviderStateMixin {
    late List<AnimationController> _controllers;
    late List<Animation> _animations;

    @override
    void initState() {
      super.initState();

      _controllers = List.generate(3, (i) {
        return AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
      });

      _animations = _controllers.map((controller) {
        return Tween<double>(begin: 0, end: -12).animate(
          CurvedAnimation(parent: controller, curve: Curves.easeInOut),
        );
      }).toList();

      // stagger each dot's start
      Future.delayed(const Duration(milliseconds: 0), () => _startLoop(_controllers[0]));
      Future.delayed(const Duration(milliseconds: 200), () => _startLoop(_controllers[1]));
      Future.delayed(const Duration(milliseconds: 400), () => _startLoop(_controllers[2]));
    }

    void _startLoop(AnimationController controller) {
      controller.repeat(reverse: true);
    }

    @override
    void dispose() {
      for (final c in _controllers) {
        c.dispose();
      }
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) {
        return AnimatedBuilder(
          animation: _animations[i],
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _animations[i].value),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: i == 2 ? 10 : 10,
                height: i == 2 ? 10 : 10,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              );
          },
        );
      } ),
    );
  }
}