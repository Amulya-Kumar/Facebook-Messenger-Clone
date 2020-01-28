import 'package:facebook_messenger_clone/screens/poeple_list.dart';
import 'package:facebook_messenger_clone/screens/stories_list.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class PeoplePage extends StatefulWidget {
  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BubbleTabIndicator(
                indicatorHeight: 30.0,
                indicatorColor: Colors.white24,
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
              ),
              tabs: <Widget>[
                Tab(
                  text: "STORIES",
                ),
                Tab(
                  text: "ACTIVE",
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              StoryList(),
              PeopleList(),
            ],
          ),
        )
      ],
    );
  }
}
