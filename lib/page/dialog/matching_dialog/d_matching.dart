import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class MatchingDialog extends StatefulWidget {
  const MatchingDialog({
    super.key,
  });

  @override
  State<MatchingDialog> createState() => _MatchingDialogState();
}

class _MatchingDialogState extends State<MatchingDialog>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];
  @override
  void initState() {
    _tabController = TabController(
      length: 6,
      vsync: this,
      initialIndex: 0,
    );

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey.shade400,
              ),
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade400,
            ),
          ),
        ),
        TabBar(
          controller: _tabController,
          isScrollable: true,
          labelPadding: const EdgeInsets.only(
            top: 10,
            left: 25,
          ),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          tabAlignment: TabAlignment.start,
          labelStyle: const TextStyle(
              fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
          indicatorSize: TabBarIndicatorSize.label,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 2.0,
            ),
          ),
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
          ),
          tabs: const [
            Tab(text: '날짜'),
            Tab(text: '시간'),
            Tab(text: '위치'),
            Tab(text: '유형'),
            Tab(text: '실력'),
            Tab(text: '구력'),
          ],
        ),
        SizedBox(
          //padding: EdgeInsets.only(bottom: 0),
          //decoration: BoxDecoration(border: Border.all(width: 1)),
          height: 340,
          width: double.infinity,
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              //CalendarWidget(),
              CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.single,
                  firstDate: DateTime.now(),
                  centerAlignModePicker: true,
                  disableModePicker: true,
                ),
                value: _singleDatePickerValueWithDefaultValue,
                onValueChanged: (date) {
                  setState(() {
                    _singleDatePickerValueWithDefaultValue = date;
                  });
                },
              ),
              const Center(
                child: Text('시간'),
              ),
              const Center(
                child: Text('위치'),
              ),
              const Center(
                child: Text('유형'),
              ),
              const Center(
                child: Text('실력'),
              ),
              const Center(
                child: Text('구력'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            //top: 5,
            bottom: 40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        setState(() {
                          _singleDatePickerValueWithDefaultValue = [];
                        });
                      });
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 16.0), // 버튼 내부 패딩 지정
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // 모서리 반지름을 조정합니다
                        ),
                      ),
                      side: MaterialStateProperty.all(
                        BorderSide(
                          color: Colors.grey.shade400, // border 색상을 회색으로 설정
                        ),
                      ),
                    ),
                    child: const Text(
                      '초기화',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(
                          context, _singleDatePickerValueWithDefaultValue);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.purple,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // 모서리 반지름을 조정합니다
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 16.0), // 버튼 내부 패딩 지정
                      ),
                    ),
                    child: const Text(
                      '적용하기',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
