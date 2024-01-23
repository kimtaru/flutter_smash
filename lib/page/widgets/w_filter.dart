import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  Text get saparatorLine => Text(
        'ㅣ',
        style: TextStyle(
          color: Colors.grey.shade400,
        ),
      );

  TextStyle get filterTextStyle => TextStyle(
        color: Colors.grey.shade600,
      );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('call Dialog');
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 15,
          right: 15,
        ),
        child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.grey.shade600,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '전체 날짜',
                        style: filterTextStyle,
                      ),
                      saparatorLine,
                      Text(
                        '전체 시간',
                        style: filterTextStyle,
                      ),
                      saparatorLine,
                      Text(
                        '전체 지역',
                        style: filterTextStyle,
                      ),
                      Text(
                        '...',
                        style: filterTextStyle,
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
