import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mighty_job/common/controller/theme_controller.dart';
import 'package:mighty_job/util/dimensions.dart';
import 'package:mighty_job/util/images.dart';

class FancyDayNightSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const FancyDayNightSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<FancyDayNightSwitch> createState() => _FancyDayNightSwitchState();
}

class _FancyDayNightSwitchState extends State<FancyDayNightSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack);

    if (widget.value) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(FancyDayNightSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: GestureDetector(onTap: () => themeController.toggleTheme(),
            child: AnimatedBuilder(animation: _animation,
              builder: (context, _) {
                return Container(width: 70, height: 35,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                      color: widget.value ? Colors.grey : Colors.blue,
                    image: DecorationImage(image: AssetImage(Images.ray), fit: BoxFit.fitWidth)),
                  child: Stack(fit: StackFit.expand, children: [

                    Stack(fit: StackFit.expand, children: [
                      Transform.translate(offset: Offset(0, -35 * _animation.value), // moves up
                        child: Image.asset(Images.cloud)),
                          Transform.translate(offset: Offset(0, 35 * (1 - _animation.value)), // moves down
                            child: Image.asset(Images.star)),
                        ]),

                      Align(alignment: Alignment.lerp(Alignment.centerLeft, Alignment.centerRight, _animation.value)!,
                        child: Padding(padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: SizedBox(width: 40, height: 40,
                            child: Center(child: Image.asset(widget.value ? Images.moon : Images.sun)))),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      }
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
