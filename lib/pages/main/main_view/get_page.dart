import 'package:flutter/material.dart';
import 'package:moti/pages/history_and_favourite/history_and_favourite_page.dart';
import 'package:moti/pages/home/home_page.dart';
import 'package:moti/pages/home/home_screen.dart';
import 'package:moti/pages/profile/profile_page.dart';

getPage(int page) {
  switch (page) {
    case 0:
      return const HomeScreen();
    case 1:
      return const HistoryAndFavouritePage();
    case 2:
      return const ProfilePage();
  }
}