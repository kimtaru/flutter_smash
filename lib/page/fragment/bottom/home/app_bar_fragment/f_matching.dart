import 'package:flutter/material.dart';
import 'package:flutter_app_base/page/widgets/w_filter.dart';
import 'package:flutter_app_base/page/widgets/w_list.dart';
import 'package:flutter_app_base/page/widgets/w_sorting.dart';

class MatchingFragment extends StatefulWidget {
  const MatchingFragment({super.key});

  @override
  State<MatchingFragment> createState() => _MatchingFragmentState();
}

class _MatchingFragmentState extends State<MatchingFragment> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FilterWidget(),
        SizedBox(
          height: 20,
        ),
        SortingWidget(),
        SizedBox(
          height: 20,
        ),
        ListWidget(),
      ],
    );
  }
}
