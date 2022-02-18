import 'package:budgetapp/icons/db_icons.dart';
import 'package:budgetapp/icons/diamond.dart';
import 'package:flutter/material.dart';

class DiamondButton extends StatelessWidget {
  const DiamondButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("VIP"),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 200,
              width: 410,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/c.png',
                          height: 100,
                          width: 100,
                        ),
                        Text(
                          "Upgrade professional",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '\u{20B9}${130.00}/month',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              height: 564,
              width: 410,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.block_flipped,
                          size: 50,
                          color: Colors.blue,
                        ),
                      ),
                      Flexible(
                        child: Container(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, right: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Remove all Ads",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Remove and enjoy using this app without annoying ads.",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.color_lens_outlined,
                          size: 50,
                          color: Colors.blue,
                        ),
                      ),
                      Flexible(
                        child: Container(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, right: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Switch Colors",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "You can select different display colors for the App.",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Excel.excel,
                          size: 50,
                          color: Colors.blue,
                        ),
                      ),
                      Flexible(
                        child: Container(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, right: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Excel Export",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "You can export the data to an Excel file.",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.wb_sunny_rounded,
                          size: 50,
                          color: Colors.blue,
                        ),
                      ),
                      Flexible(
                        child: Container(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, right: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dark Theme",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "You can set a dark theme",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.find_in_page,
                          size: 50,
                          color: Colors.blue,
                        ),
                      ),
                      Flexible(
                        child: Container(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, right: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Search",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "You can search all data.",
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 130.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 350,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Pay")),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
