import 'package:accountproject/CommonFiles/colorPicker.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:swipedetector/swipedetector.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({
    Key key,
    this.controller,
  }) : super(key: key);
  final ScrollController controller;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AccountScreen>{
  bool feedValue = true;
  bool copyValue = false;
  bool savedValue = false;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    var imageBlock = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 110,
              width: 110,
              decoration: new BoxDecoration(
                  color: Colors.blueGrey[200],
                  image: new DecorationImage(
                      image: ExactAssetImage("assets/ProfileImage/user_profile.jpg"),
                      fit: BoxFit.fill
                  ),
                  borderRadius: new BorderRadius.all(Radius.circular(75.0)),
                  boxShadow: [
                    BoxShadow(
                        color: shadow,
                        blurRadius: 20.0
                    )
                  ]
              ),
            ),
          ],
        ),

        SizedBox(height: 25.0,),

        Text('Samantha Smith',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: whiteBack,fontFamily: "SFProText-Medium",letterSpacing: 0.0)),
        Text('@imsamanthasmith',style: TextStyle(fontSize: 15.0,color: greyShade,fontFamily: "SFProText-Medium",letterSpacing: 0.0)),

        SizedBox(height: 40.0,),

        Padding(
          padding: EdgeInsets.only(left: deviceWidth*0.15,right: deviceWidth*0.15),
          child: new Row(
            children: <Widget>[
              new Container(
                width: deviceWidth*0.2,
                child: Column(
                  children: <Widget>[
                    Text('1.2m',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: whiteBack,fontFamily: "SFProText-Medium",letterSpacing: 0.0)),
                    SizedBox(height: 3.0,),
                    Text('Liked',style: TextStyle(fontSize: 15.0,color: greyShade,fontFamily: "SFProText-Medium",letterSpacing: 0.0)),
                  ],
                ),
              ),
              Spacer(),
              new Container(
                width: deviceWidth*0.2,
                child: Column(
                  children: <Widget>[
                    Text('12.8k',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: whiteBack,fontFamily: "SFProText-Medium",letterSpacing: 0.0)),
                    SizedBox(height: 3.0,),
                    Text('Followers',style: TextStyle(fontSize: 15.0,color: greyShade,fontFamily: "SFProText-Medium",letterSpacing: 0.0)),
                  ],
                ),
              ),
              Spacer(),
              new Container(
                width: deviceWidth*0.2,
                child: Column(
                  children: <Widget>[
                    Text('1.9k',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: whiteBack,fontFamily: "SFProText-Medium",letterSpacing: 0.0)),
                    SizedBox(height: 3.0,),
                    Text('Following',style: TextStyle(fontSize: 15.0,color: greyShade,fontFamily: "SFProText-Medium",letterSpacing: 0.0)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );

    var tabBarBlock = new Column(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                setState(() {
                  feedValue = true;
                  copyValue = false;
                  savedValue = false;
                });
              },
              child: new Image.asset('assets/TabImages/feed.png',width: 18.0,height: 18.0,color: feedValue == true ?Colors.red : whiteBack,)
            ),
            GestureDetector(
                onTap: (){
                  setState(() {
                    feedValue = false;
                    copyValue = true;
                    savedValue = false;
                  });
                },
                child: new Image.asset('assets/TabImages/copy.png',width: 18.0,height: 18.0,color: copyValue == true ?Colors.red : whiteBack,)
            ),
            GestureDetector(
                onTap: (){
                  setState(() {
                    feedValue = false;
                    copyValue = false;
                    savedValue = true;
                  });
                },
                child: new Image.asset('assets/TabImages/saved.png',width: 18.0,height: 18.0,color: savedValue == true ?Colors.red : whiteBack,)
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new SingleChildScrollView(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Stack(
              children: <Widget>[
                new Container(
                  color: background,
                  child:new Column(
                    children: <Widget>[
                      SizedBox(height: deviceHeight*0.08,),

                      imageBlock,

                      SizedBox(height: deviceHeight*0.08,),

                      Padding(
                        padding: EdgeInsets.only(left: 5.0,right: 5.0),
                        child: Material(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                          ),
                          color: tabBar,
                          child: StickyHeader(
                            controller: widget.controller, // Optional
                            header: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                ),
                                color: tabBar,
                              ),
                              height: deviceHeight*0.073,
                              padding: EdgeInsets.only(top: deviceHeight*0.025,bottom: deviceHeight*0.025),
                              alignment: Alignment.centerLeft,
                              child: tabBarBlock,
                            ),
                            content: feedValue == true
                            ? SwipeDetector(
                              onSwipeLeft: (){
                                setState(() {
                                  feedValue = false;
                                  copyValue = true;
                                  savedValue = false;
                                });
                              },
                              child: Container(
                                color: background,
                                height: deviceHeight*1.13,
                                child: new GridView.builder(
                                    physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                    itemCount: 30,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                                    itemBuilder: (BuildContext context, int index) {
                                      return new Container(
                                        margin: EdgeInsets.all(2.0),
                                        decoration: new BoxDecoration(
                                            image: new DecorationImage(
                                                image: ExactAssetImage("assets/GroupImages/layer$index.png"),
                                                fit: BoxFit.fill
                                            ),
                                            borderRadius: new BorderRadius.all(Radius.circular(3.0)),
                                        ),
                                      );
                                    }
                                ),
                              ),
                            )
                            : copyValue == true
                              ? SwipeDetector(
                                onSwipeLeft: (){
                                  setState(() {
                                    feedValue = false;
                                    copyValue = false;
                                    savedValue = true;
                                  });
                                },
                                onSwipeRight: (){
                                  setState(() {
                                    feedValue = true;
                                    copyValue = false;
                                    savedValue = false;
                                  });
                                },
                                child: Container(
                                  color: background,
                                  height: deviceHeight*1.13,
                                  child: new GridView.builder(
                                      itemCount: 15,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                                      itemBuilder: (BuildContext context, int index) {
                                        return new Container(
                                          margin: EdgeInsets.all(2.0),
                                          decoration: new BoxDecoration(
                                            image: new DecorationImage(
                                                image: ExactAssetImage("assets/GroupImages/layer$index.png"),
                                                fit: BoxFit.fill
                                            ),
                                            borderRadius: new BorderRadius.all(Radius.circular(3.0)),
                                          ),
                                        );
                                      }
                                  ),
                                ),
                              )
                              : SwipeDetector(
                                onSwipeRight: (){
                                  setState(() {
                                    feedValue = false;
                                    copyValue = true;
                                    savedValue = false;
                                  });
                                },
                                child: Container(
                                  color: background,
                                  height: deviceHeight*1.13,
                                  child: new GridView.builder(
                                      itemCount: 10,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                                      itemBuilder: (BuildContext context, int index) {
                                        return new Container(
                                          margin: EdgeInsets.all(2.0),
                                          decoration: new BoxDecoration(
                                            image: new DecorationImage(
                                                image: ExactAssetImage("assets/GroupImages/layer$index.png"),
                                                fit: BoxFit.fill
                                            ),
                                            borderRadius: new BorderRadius.all(Radius.circular(3.0)),
                                          ),
                                        );
                                      }
                                  ),
                                ),
                              ),
                          ),
                        ),
                      ),

                      SizedBox(height: deviceHeight*0.08,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}