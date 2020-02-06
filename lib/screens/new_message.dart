import 'package:facebook_messenger_clone/models/chat_model.dart';
import 'package:facebook_messenger_clone/screens/messenger_home.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

bool _isSwitched = false;

class _NewMessageState extends State<NewMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MessengerHome(),
              ),
            );
          },
        ),
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Choose Friends",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          ),
        ),
        actions: <Widget>[
          Switch(
            value: _isSwitched,
            onChanged: (value) {
              setState(() {
                _isSwitched = value;
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          )
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
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
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    foregroundColor: Theme.of(context).primaryColor,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(dummyData[index].avatarUrl),
                  ),
                  title: Text(dummyData[index].name),
                  trailing: Visibility(
                    visible: !_isSwitched,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          dummyData[index].isSelected =
                              !dummyData[index].isSelected;
                        });
                      },
                      child: Container(
                        height: 25.0,
                        width: 25.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: dummyData[index].isSelected
                              ? Colors.white
                              : Colors.transparent,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: dummyData[index].isSelected
                            ? Icon(
                                Icons.check,
                                color: Colors.black,
                                size: 20.0,
                              )
                            : Icon(
                                Icons.check_box_outline_blank,
                                color: Colors.transparent,
                              ),
                      ),
                    ),
                  ),
                ),
                itemCount: dummyData.length,
              ),
            ),
          ],
        ),
      ),
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
                                ),
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
