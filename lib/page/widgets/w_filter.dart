import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_base/controller/sample.dart';
import 'package:flutter_app_base/page/dialog/matching_dialog/d_matching.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final SampleController sampleState = Get.find();

  String conditionDate = '전체 날짜';

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
      onTap: () async {
        final selectedDate = await showModalBottomSheet<List<DateTime?>>(
          isScrollControlled: true,
          //barrierLabel: 'aa',
          context: context,
          //useSafeArea: true,
          builder: (context) {
            return const MatchingDialog();
          },
        );
        DateTime? dateTime =
            selectedDate?.isNotEmpty == true ? selectedDate![0] : null;
        DateFormat formatter = DateFormat('M월 d일(E)', 'ko');
        String dateStr =
            dateTime == null ? "전체 날짜" : formatter.format(dateTime);

        sampleState.setDateStr(dateStr);
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
                      Obx(
                        () => Text(
                          sampleState.dateStr.value,
                          style: filterTextStyle,
                        ),
                      ),
                      // Text(
                      //   conditionDate,
                      //   style: filterTextStyle,
                      // ),
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
