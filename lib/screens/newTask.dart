import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

IconData icon = Icons.menu;
MaterialColor back = Colors.amber;

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  DateTime? _date = DateTime.now();
  String today = "Today";
  String time = "22:00";
  TimeOfDay timeOfDay = TimeOfDay.now();
  String taskName = " ";
  String money = " ";
  TextEditingController moneyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.check), onPressed: () {}),
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
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        Flexible(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 230.0),
                                  child: Container(
                                    width: 100.0,
                                    child: TextField(
                                      autocorrect: true,
                                      onChanged: (String? value) {
                                        money = value ?? money;
                                      },
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.white),
                                      textAlign: TextAlign.right,
                                      enableInteractiveSelection: false,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "0",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
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
                                  GestureDetector(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.date_range),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Date"),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(today),
                                      ],
                                    ),
                                    onTap: () async {
                                      DateTime? date = await showDatePicker(
                                          context: context,
                                          initialDate: _date == null
                                              ? DateTime.now()
                                              : _date!,
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2050));
                                      if (date != null) _date = date;
                                      setState(() {});
                                      var dateString =
                                          DateFormat('EEEE, d MMM, yyyy ')
                                              .format(date!);
                                      today = dateString.toString();
                                    },
                                  ),
                                ],
                              ),
                              Divider(),
                              GestureDetector(
                                child: Column(children: [
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.alarm),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Time"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(time),
                                    ],
                                  ),
                                ]),
                                onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (pickedTime != null) {
                                    timeOfDay = pickedTime;
                                    setState(
                                        () {}); //it is helping to make the icon invisible
                                    var timeString = pickedTime.format(
                                        context); //this is used to change the format of the date. (EEEE) means days of the week. (d) means date. (MMM) months and (yyyy) Years.
                                    time = timeString.toString();
                                  }
                                },
                              ),
                              Divider(),
                              Column(children: [
                                Row(
                                  children: <Widget>[
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
                                        onChanged: (String? value) {
                                          taskName = value ?? taskName;
                                        },
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
