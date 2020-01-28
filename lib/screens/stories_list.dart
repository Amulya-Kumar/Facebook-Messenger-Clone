import 'package:facebook_messenger_clone/models/chat_model.dart';
import 'package:flutter/material.dart';

class StoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(10.0),
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      children:
          List.generate(dummyData == null ? 1 : dummyData.length + 1, (index) {
        if (index == 0) {
          return Card(
            color: Colors.transparent,
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          dummyData[index].avatarUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                    height: 40.0,
                    width: 40.0,
                    child: Center(child: Icon(Icons.add, color: Colors.black87, size: 30.0,),),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text("Add to Story"),
                    ),
                  ),
                )
              ],
            ),
          );
        }
        index -= 1;
        return Card(
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        dummyData[index].avatarUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColorDark,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(dummyData[index].avatarUrl),
                ),
              ),
              Positioned(
                top: 10.0,
                left: 140.0,
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: Center(child: Text('2')),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(dummyData[index].name),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
