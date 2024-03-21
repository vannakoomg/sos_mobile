import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class CustomOffOnSetting extends StatefulWidget {
  final String tilte;
  final String description;

  final bool value;
  final Function onChanged;
  const CustomOffOnSetting(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.tilte,
      required this.description});

  @override
  State<CustomOffOnSetting> createState() => _CustomOffOnSettingState();
}

class _CustomOffOnSettingState extends State<CustomOffOnSetting> {
  bool isDone = false;
  @override
  void initState() {
    setState(() {
      isDone = widget.value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Future.delayed(const Duration(milliseconds: 250), () {
          setState(() {
            isDone = !isDone;
          });
        });
        widget.onChanged(!widget.value);
      },
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.tilte,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
                Text(
                  widget.description,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.all(3),
            height: 30,
            width: 55,
            decoration: BoxDecoration(
              color:
                  widget.value == true ? AppColor.secondnaryColor : Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  curve: Curves.easeInCirc,
                  top: 1,
                  left: widget.value == false ? 0 : 27,
                  duration: const Duration(milliseconds: 250),
                  child: AnimatedRotation(
                    turns: widget.value == true && isDone == false ? 0.5 : 0,
                    duration: Duration(milliseconds: isDone == true ? 0 : 250),
                    child: Container(
                      height: 22,
                      width: 22,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          isDone == false ? Icons.close_rounded : Icons.done,
                          size: 16,
                          color: isDone == false
                              ? Colors.grey
                              : AppColor.secondnaryColor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
