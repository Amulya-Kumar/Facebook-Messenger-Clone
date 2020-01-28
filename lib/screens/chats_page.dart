import 'package:facebook_messenger_clone/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ChatsPage extends StatefulWidget {
  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            height: 50.0,
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 4.0),
            child: GestureDetector(
              onTap: () {
                showSearch(context: context, delegate: SearchData());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Icon(Icons.search),
                    ),
                    Text(
                      "Search",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 90.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dummyData == null ? 1 : dummyData.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: Icon(Icons.add, size: 35.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Your Story',
                          softWrap: true,
                          style: TextStyle(fontSize: 12.0, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                );
              }
              index -= 1;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.lightBlue,
                          width: 3,
                        ),
                        color: Colors.grey,
                      ),
                      width: 70.0,
                      height: 70.0,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: ClipOval(
                          child: Image.network(dummyData[index].avatarUrl),
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              dummyData[index].name,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
              itemCount: dummyData.length,
              itemBuilder: (context, index) => Column(
                children: <Widget>[
                  Divider(
                    height: 10.0,
                  ),
                  Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.15,
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Theme.of(context).primaryColor,
                        backgroundColor: Colors.grey,
                        backgroundImage:
                            NetworkImage(dummyData[index].avatarUrl),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            dummyData[index].name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            dummyData[index].time,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.0),
                          ),
                        ],
                      ),
                      subtitle: Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          dummyData[index].message,
                          style: TextStyle(color: Colors.grey, fontSize: 15.0),
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      Container(
                        height: 35.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueAccent,
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.camera_alt),
                            iconSize: 20.0,
                          ),
                        ),
                      ),
                      Container(
                        height: 35.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white24,
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.call),
                            iconSize: 20.0,
                          ),
                        ),
                      ),
                      Container(
                        height: 35.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white24,
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.videocam),
                            iconSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      Container(
                        height: 35.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white24,
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.menu),
                            iconSize: 20.0,
                          ),
                        ),
                      ),
                      Container(
                        height: 35.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white24,
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.notifications),
                            iconSize: 20.0,
                          ),
                        ),
                      ),
                      Container(
                        height: 35.0,
                        width: 35.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete),
                            iconSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class SearchData extends SearchDelegate<Widget> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorDark,
      child: IconButton(
        color: Colors.white,
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        },
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Card();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? dummyData : dummyData;
    return Column(
      children: <Widget>[
        Container(
          color: Theme.of(context).primaryColorDark,
          height: 130.0,
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Align(
                  child: Text(
                    "People",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  alignment: Alignment.topLeft,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: suggestionList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            width: 70.0,
                            height: 70.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: ClipOval(
                                child: Image.network(
                                    suggestionList[index].avatarUrl),
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    dummyData[index].name,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Theme.of(context).primaryColorDark,
          height: 130.0,
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Align(
                  child: Text(
                    "Businesses",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  alignment: Alignment.topLeft,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: suggestionList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            width: 70.0,
                            height: 70.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: ClipOval(
                                child: Image.network(
                                    suggestionList[index].avatarUrl),
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    dummyData[index].name,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).primaryColorDark,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 8.0),
                  child: Align(
                    child: Text(
                      "Suggested",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Theme.of(context).primaryColor,
                        backgroundColor: Colors.grey,
                        backgroundImage:
                            NetworkImage(suggestionList[index].avatarUrl),
                      ),
                      title: Text(suggestionList[index].name),
                    ),
                    itemCount: suggestionList.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
