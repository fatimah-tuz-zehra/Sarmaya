import 'package:flutter/material.dart';

import '../EP Profile/Navbar.dart';


class lotto extends StatefulWidget {
  const lotto({Key? key}) : super(key: key);

  @override
  State<lotto> createState() => _lottoState();
}

class _lottoState extends State<lotto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black45, Colors.deepOrange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),), ),
            title: Text("Lotto Tickets"),
            centerTitle: true,
            titleTextStyle: TextStyle(fontSize: 27, fontWeight: FontWeight.w600, color: Colors.white),
            elevation: 1,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: ()
              {
                Navigator.pop(context);
              },)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 200,
                      width: 400,
                      color: Colors.white60,
                      child: Padding(
                        padding:
                        const EdgeInsets.only(top: 8, left: 25, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Text(
                                  "Prize Bond",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                            Center(
                                child: Text(
                                  "Sarmaya",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Amount",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                Spacer(),
                                Text(
                                  "Date",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "50 Rs",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  "10/04/2023",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Text(
                                  "Prize Amount",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                Spacer(),
                                Text(
                                  "last Date",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "10000 Rs",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  "17/05/2023",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ],
                            ),
                            // Container(
                            //     height: 40,
                            //     width: 300,
                            //     child: Image.asset("images/qr.jpg")),
                            Center(
                                child: Text(
                                  "Ticket No: 353500",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: -5,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            color: Color(0xffF5591F), shape: BoxShape.circle),
                      )),
                  Positioned(
                      right: -5,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            color: Color(0xffF5591F), shape: BoxShape.circle),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialogForAppllied();
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      color: Colors.deepOrange,
                      child: Center(
                          child: Text(
                            "Buy Tickets",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 200,
                      width: 400,
                      color: Colors.white60,
                      child: Padding(
                        padding:
                        const EdgeInsets.only(top: 8, left: 25, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Text(
                                  "Prize Bond",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                            Center(
                                child: Text(
                                  "Sarmaya",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Amount",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                Spacer(),
                                Text(
                                  "Date",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "100 Rs",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  "15/05/2023",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Text(
                                  "Prize Amount",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                Spacer(),
                                Text(
                                  "last Date",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "100000 Rs",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  "01/06/2023",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ],
                            ),
                            // Container(
                            //     height: 40,
                            //     width: 300,
                            //     child: Image.asset("images/qr.jpg")),
                            Center(
                                child: Text(
                                  "Ticket No: 353501",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: -5,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            color: Color(0xffF5591F), shape: BoxShape.circle),
                      )),
                  Positioned(
                      right: -5,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            color: Color(0xffF5591F), shape: BoxShape.circle),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialogForAppllied();
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      color: Colors.deepOrange,
                      child: Center(
                          child: Text(
                            "Buy Tickets",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 200,
                      width: 400,
                      color: Colors.white60,
                      child: Padding(
                        padding:
                        const EdgeInsets.only(top: 8, left: 25, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Text(
                                  "Prize Bond",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                            Center(
                                child: Text(
                                  "Sarmaya",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Amount",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                Spacer(),
                                Text(
                                  "Date",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "150 Rs",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  "20/05/2023",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Text(
                                  "Prize Amount",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                Spacer(),
                                Text(
                                  "last Date",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "150000 Rs",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  "15/06/2023",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ],
                            ),
                            // Container(
                            //     height: 40,
                            //     width: 300,
                            //     child: Image.asset("images/qr.jpg")),
                            Center(
                                child: Text(
                                  "Ticket No: 353502",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: -5,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            color: Color(0xffF5591F), shape: BoxShape.circle),
                      )),
                  Positioned(
                      right: -5,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            color: Color(0xffF5591F), shape: BoxShape.circle),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialogForAppllied();
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      color: Colors.deepOrange,
                      child: Center(
                          child: Text(
                            "Buy Tickets",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  showDialogForAppllied() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 290,
            child: Column(
              children: [
                Image.asset("assets/cng1.png"),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "your application is submitted",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    child: const Text(
                      "Thankyou for choosing us, in 10 days you will recive a"
                          " confirmation of your request. Remember to be attentive to your email"
                          " where you will recive all information.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
