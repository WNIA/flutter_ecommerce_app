import 'package:autism_project_demo_2/helper/authenticate.dart';
import 'package:autism_project_demo_2/pages/chatroom_list_page.dart';
import 'package:autism_project_demo_2/pages/conversation_page.dart';
import 'package:autism_project_demo_2/pages/play_list_page.dart';
import 'package:autism_project_demo_2/pages/search_page.dart';
import 'package:autism_project_demo_2/pages/video_player_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routeList() {
  return {
    Authenticate.routeName: (context) => Authenticate(),
    ChatRoomsDisplayScreen.routeName: (context) => ChatRoomsDisplayScreen(),
    SearchScreen.routeName: (context) => SearchScreen(),
    ConversationScreen.routeName: (context) => ConversationScreen(),
    PlayListScreen.routeName: (context) => PlayListScreen(),
    VideoPlayerScreen.routeName: (context) => VideoPlayerScreen(),
  };
}
