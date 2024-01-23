import 'package:flutter/material.dart';
import 'package:flutter_app_base/page/fragment/bottom/f_board.dart';
import 'package:flutter_app_base/page/fragment/bottom/f_chat.dart';
import 'package:flutter_app_base/page/fragment/bottom/f_club.dart';
import 'package:flutter_app_base/page/fragment/bottom/home/f_home.dart';
import 'package:flutter_app_base/page/fragment/bottom/f_profile.dart';

class BottomItem {
  final String label;
  final Widget icon;
  final Widget fragment;

  BottomItem({
    required this.label,
    required this.icon,
    required this.fragment,
  });
}

List<BottomItem> bottomItemList = [
  BottomItem(
    label: '홈',
    icon: const Icon(Icons.home),
    fragment: const HomeFragment(),
  ),
  BottomItem(
    label: '클럽',
    icon: const Icon(Icons.sports_tennis_outlined),
    fragment: const ClubFragment(),
  ),
  BottomItem(
    label: '채팅',
    icon: const Icon(Icons.chat_bubble_outline),
    fragment: const ChatFragment(),
  ),
  BottomItem(
    label: '게시판',
    icon: const Icon(Icons.article_outlined),
    fragment: const BoardFragment(),
  ),
  BottomItem(
    label: '프로필',
    icon: const Icon(Icons.account_circle_outlined),
    fragment: const ProfileFragment(),
  ),
];

List<Widget> get bottomFragmentList =>
    bottomItemList.map((e) => e.fragment).toList();
List<BottomNavigationBarItem> get bottomBarItemList => bottomItemList
    .map((e) => BottomNavigationBarItem(
          icon: e.icon,
          label: e.label,
        ))
    .toList();
