import 'package:budgetapp/dataModel/budget.dart';
import 'package:budgetapp/dataModel/budget_database.dart';
import 'package:budgetapp/icons/diamond.dart';
import 'package:budgetapp/pagesBottomAppBar/diamond.dart';
import 'package:budgetapp/pagesBottomAppBar/menu.dart';
import 'package:budgetapp/pagesBottomAppBar/pie.dart';
import 'package:budgetapp/screens/startup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'icons/db_icons.dart';
import 'screens/newTask.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BudgetDatabase.initDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Startup(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Budget>> taskList = BudgetDatabase.getAllTask();
  int cal = 0;
  int expense = 0;
  int income = 0;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/n.jpg'),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 30.0),
                child: Text(
                  "VIP",
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildMenuItem(
                      text: "Remove All Ads", icon: Icons.block_flipped),
                  buildMenuItem(
                      text: "Switch Colors", icon: Icons.color_lens_outlined),
                  buildMenuItem(
                    text: "Excel Export",
                    icon: Excel.excel,
                  ),
                  buildMenuItem(
                      text: "Dark Theme", icon: Icons.wb_sunny_rounded),
                  buildMenuItem(text: "Search", icon: Icons.find_in_page),
                  Divider(
                    color: Colors.grey,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Builder(builder: (context) {
        return SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Container(
                        color: Colors.blue,
                        height: 170,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.date_range,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: Container(
                                      child: Text(
                                        "2022-02",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: Container(
                                      child: Text(
                                        "Balance",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  child: Text(
                                    '$cal',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Container(
                                      child: Text(
                                        "Expenses: ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '$expense',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Container(
                                      child: Text(
                                        "Income: ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '$income',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              color: Colors.white,
                              height: 80,
                              width: 410,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, right: 230.0),
                                    child: Text(
                                      "Budget Setting",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  LinearPercentIndicator(
                                    width: 400,
                                    animation: true,
                                    percent: 60 / 100,
                                    animationDuration: 1000,
                                    progressColor: Colors.blue,
                                    backgroundColor: Colors.grey[200],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 40,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const NewTask(); //name of stateful widget in new_task_screen. Then only it will work.
                },
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 2,
        child: Container(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Builder(builder: (context) {
                  return IconButton(
                    icon: Icon(Icons.menu_rounded),
                    color: Colors.grey[400],
                    iconSize: 45,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },

                    /*onPressed: () {
                          scaffoldKey.currentState?.openDrawer();
                        }*/ //() => Scaffold.of(context).openDrawer(),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: IconButton(
                    icon: Icon(Icons.widgets_rounded),
                    color: Colors.grey[400],
                    iconSize: 45,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const MenuList();
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: IconButton(
                    icon: Icon(Icons.pie_chart),
                    color: Colors.grey[400],
                    iconSize: 40,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const PieChart();
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: IconButton(
                    icon: Icon(Diamond.logo),
                    color: Colors.grey[400],
                    iconSize: 45,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const DiamondButton();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem({required String text, required IconData icon}) {
    final color = Colors.grey[600];

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 15),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const DiamondButton(); //name of stateful widget in new_task_screen. Then only it will work.
            },
          ),
        );
      },
    );
  }
}
