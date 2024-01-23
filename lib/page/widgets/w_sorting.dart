import 'package:flutter/material.dart';

class SortingWidget extends StatefulWidget {
  const SortingWidget({super.key});

  @override
  State<SortingWidget> createState() => _SortingWidgetState();
}

class _SortingWidgetState extends State<SortingWidget> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              debugPrint('마감 포함 $isTapped');
              setState(() {
                isTapped = !isTapped;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: Colors.grey.shade400,
                // ),
                color:
                    isTapped ? const Color.fromARGB(255, 243, 215, 248) : null,
                border: isTapped
                    ? Border.all(
                        color: Colors.purple.shade300,
                      )
                    : Border.all(
                        color: Colors.grey.shade400,
                      ),

                borderRadius: BorderRadius.circular(45),
              ),
              //width: 60,
              height: 35,
              alignment: Alignment.center,
              child: Text(
                '마감 포함',
                style: isTapped
                    ? TextStyle(
                        color: Colors.purple.shade500,
                      )
                    : null,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              debugPrint('쏘팅 팝업 호출');
            },
            child: Row(
              children: [
                const Text('날짜 임박 순'),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
