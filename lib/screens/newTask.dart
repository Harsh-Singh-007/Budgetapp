import 'package:flutter/material.dart';

IconData icon = Icons.menu;
MaterialColor back = Colors.amber;

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                color: Colors.blue,
                height: 170,
                width: 410,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context, false),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => buildSheet(),
                                );
                              },
                              icon: CircleAvatar(
                                radius: 100,
                                backgroundColor: back,
                                child: Icon(
                                  icon,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 310.0, top: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                "0",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "0=",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: const <Widget>[
                                      Icon(Icons.date_range),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Date"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Today"),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(),
                              Column(children: [
                                Row(
                                  children: const <Widget>[
                                    Icon(Icons.alarm),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Time"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("22:00"),
                                  ],
                                ),
                              ]),
                              Divider(),
                              Column(children: [
                                Row(
                                  children: const <Widget>[
                                    Icon(
                                      Icons.edit,
                                      size: 22,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Remark"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: "Write a note",
                                          hintStyle: TextStyle(fontSize: 14),
                                        ),
                                        minLines: 1,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSheet() => Container(
        child: ListView(
          children: <Widget>[
            buildButtons(),
            ListTile(
              leading: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.amber[600],
                child: Icon(
                  Icons.restaurant,
                  color: Colors.white,
                ),
              ),
              title: Text("Food"),
              onTap: () => _selection(Icons.restaurant, Colors.amber),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.greenAccent[700],
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  )),
              title: Text("Clothes"),
              onTap: () => _selection(Icons.person, Colors.green),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.pinkAccent,
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  )),
              title: Text("Shopping"),
              onTap: () => _selection(Icons.shopping_bag_outlined, Colors.pink),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.greenAccent[700],
                  child: Icon(
                    Icons.directions_bus_filled_outlined,
                    color: Colors.white,
                  )),
              title: Text("Transportation"),
              onTap: () => _selection(
                  Icons.directions_bus_filled_outlined, Colors.green),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.amber[600],
                child: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
              ),
              title: Text("Home"),
              onTap: () => _selection(Icons.home_outlined, Colors.amber),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.greenAccent[700],
                  child: Icon(
                    Icons.airplanemode_active,
                    color: Colors.white,
                  )),
              title: Text("Travel"),
              onTap: () => _selection(Icons.airplanemode_active, Colors.green),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.deepPurpleAccent,
                  child: Icon(
                    Icons.wine_bar_outlined,
                    color: Colors.white,
                  )),
              title: Text("Wine"),
              onTap: () =>
                  _selection(Icons.wine_bar_outlined, Colors.deepPurple),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.lightBlue,
                  child: Icon(
                    Icons.electrical_services_outlined,
                    color: Colors.white,
                  )),
              title: Text("Bills"),
              onTap: () => _selection(
                  Icons.electrical_services_outlined, Colors.lightBlue),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.lightBlue,
                  child: Icon(
                    Icons.medical_services_outlined,
                    color: Colors.white,
                  )),
              title: Text("Health"),
              onTap: () =>
                  _selection(Icons.medical_services_outlined, Colors.lightBlue),
            ),
          ],
        ),
      );

  void _selection(IconData iconData, MaterialColor materialColor) {
    Navigator.pop(context);
    setState(() {
      icon = iconData;
      back = materialColor;
    });
  }

  Widget buildButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Expenses",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                "Income",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ))
        ],
      );
}
