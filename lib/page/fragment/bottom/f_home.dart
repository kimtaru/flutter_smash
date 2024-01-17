import 'package:flutter/material.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
              left: 0,
            ),
            child: Row(
              children: [
                TabBar(
                  tabs: const [
                    Tab(text: '매칭'),
                    Tab(text: '예약'),
                    Tab(text: '양도'),
                  ],

                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.black,
                  automaticIndicatorColorAdjustment: false,
                  tabAlignment: TabAlignment.center,
                  //isScrollable: true,
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelStyle: TextStyle(
                    color: Colors.grey.shade800,
                  ),
                ),
                const Expanded(child: SizedBox()),
                const Icon(
                  Icons.info_outline,
                  size: 25,
                ),
              ],
            ),
          ),
          const Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Placeholder(),
                Center(
                  child: Text('예약'),
                ),
                Center(
                  child: Text('양도'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
