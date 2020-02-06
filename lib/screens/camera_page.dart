import 'package:facebook_messenger_clone/screens/messenger_home.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController _controller;
  Future<void> _controllerInitializer;

  List<CameraDescription> cameras;
  final PageController _bottomPageController =
      PageController(viewportFraction: 0.2);

  Future<void> getCamera() async {
    cameras = await availableCameras();
  }

  @override
  void initState() {
    super.initState();

    getCamera().then((camera) {
      setState(() {
        _controller = CameraController(cameras[0], ResolutionPreset.high);
        _controllerInitializer = _controller.initialize();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: FutureBuilder(
              future: _controllerInitializer,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Positioned.fill(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: Icon(Icons.close),
                  iconSize: 30.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MessengerHome(),
                      ),
                    );
                  },
                ),
                actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(
                      Icons.flash_off,
                      size: 30.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(
                      Icons.do_not_disturb_off,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
              body: Container(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: 50.0,
                      left: 20.0,
                      right: 20.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                              border: Border.all(
                                width: 5.0,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                            child: Container(
                              height: 30.0,
                              width: 30.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 50.0,
                      right: 50.0,
                      bottom: 10.0,
                      height: 20.0,
                      child: Center(
                        child: PageView.builder(
                          controller: _bottomPageController,
                          itemBuilder: (context, index) {
                            return Text(
                              "Item $index",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            );
                          },
                          itemCount: 5,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5.0,
                      left: MediaQuery.of(context).size.width * 0.94 / 2,
                      width: 10.0,
                      height: 10.0,
                      child: Icon(
                        Icons.arrow_drop_up,
                        color: Colors.white,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          child: Icon(
                            Icons.cached,
                            size: 25.0,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          height: 30.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: ClipRRect(
                            child: Image(
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxBJBltcAZ8Od0ukXORiPUCF80B0KH5Hs8DSKc9Zg-7gY5wG0m&s"),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
