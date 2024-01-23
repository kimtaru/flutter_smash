import 'package:flutter/material.dart';
import 'package:flutter_app_base/page/fragment/bottom/home/app_bar_fragment/f_matching.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {
      _selectedTabIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: _selectedTabIndex != 1,
        child: SizedBox(
          width: 100,
          height: 50,
          child: FloatingActionButton(
            onPressed: () {
              debugPrint('플로팅 액션');
            },
            backgroundColor: Colors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 0,
            child: const Text(
              '+ 글쓰기',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
              left: 0,
            ),
            child: Row(
              children: [
                TabBar(
                  controller: _tabController,
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
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics:
                  const NeverScrollableScrollPhysics(), // 스와이프로 화면 전환 안되게 해줌
              children: const [
                //Placeholder(),
                MatchingFragment(),
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
