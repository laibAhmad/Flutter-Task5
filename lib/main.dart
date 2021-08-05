import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

bool selected = false;
int counter = 40;
// toggle() {}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Task 1'),
      ),
      body: Column(
        children: <Widget>[
          //image row
          Container(
            height: size.height / 3.7,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://i.dawn.com/large/2015/12/567d1ca45aabe.jpg'),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),

          //text row
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Shangrila Resort',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Skardu, Pakistan',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selected == false ? selected = true : selected = false;
                      selected == false
                          ? counter = counter - 1
                          : counter = counter + 1;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        selected == false ? Icons.star_border : Icons.star,
                        color: Colors.red,
                      ),
                      Text(
                        counter.toString(),
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),

          //button row
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            title: Text('Simple Dialog'),
                            children: [
                              SimpleDialogOption(
                                onPressed: () => Navigator.pop(context, ''),
                                child: Text('Call button pressed.'),
                              ),
                            ],
                          );
                        });
                  },
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.call,
                        color: Colors.blue,
                      ),
                      Text(
                        '\nCALL',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Alert Dialog'),
                          content: Text('Route button pressed.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.near_me,
                        color: Colors.blue,
                      ),
                      Text(
                        '\nROUTE',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    'Bottom Sheet',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('Share button pressed'),
                                  ElevatedButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.share,
                        color: Colors.blue,
                      ),
                      Text(
                        '\nSHARE',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),

          //description row
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: size.width - 50,
                  child: Text(
                    'After crossing the old wooden bridge built over the River Indus, one reaches Shangrila, a paradise on earth for tourists. It is a famous tourist spot in Skardu, which is about 25 minutes away by drive. Restaurant in Shangrila rest house is highlight of this place, which is built in the structure of an aircraft.',
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
