import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  List<String> items = List.generate(10, (index) => '아이템 $index');

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        itemCount: 120,
        separatorBuilder: (context, index) {
          return SeparatorWidget(indexNumber: index);
        },
        itemBuilder: (context, index) {
          if (index == 0 || index % 20 == 0) {
            return const AdvertisementWidget();
          } else {
            return const TileWidget();
          }
        },
      ),
    );
  }
}

class SeparatorWidget extends StatelessWidget {
  const SeparatorWidget({
    super.key,
    required this.indexNumber,
  });

  final int indexNumber;

  @override
  Widget build(BuildContext context) {
    if (indexNumber == 0 || indexNumber % 20 == 0 || indexNumber % 20 == 19) {
      return const SizedBox(
        height: 5,
      );
    } else {
      return Divider(
        color: Colors.grey.shade300,
        height: 5,
      );
    }
  }
}

class TileWidget extends StatelessWidget {
  const TileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('리스트 상세 이동');
      },
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/court_img_sample.png',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '서울특별시 은평구',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    '그랜드슬램테니스장',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Text(
                        'D-0',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        '・',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        '1.22 (월) 19~22시',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      //1.22 (월) 19~22시
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '혼복',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        '・',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        '남2 여2',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        '・',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '2~5년',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.supervisor_account_outlined,
                            size: 18,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            '0/3',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.chat_outlined,
                            size: 15,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            '4',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdvertisementWidget extends StatelessWidget {
  const AdvertisementWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('광고배너 이동');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5),
        ),
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Flexible(
                      child: Text(
                        '테니스도 이젠 AI',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'xlab 스윙 분석이 궁금하다면, 지금 바로 예약하세요!',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: Icon(
                  Icons.sports_tennis_rounded,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
