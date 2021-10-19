import 'package:flutter/material.dart';
import 'package:tumble/screens/create_tumble.dart';
import 'package:tumble/models/tumbles.dart';
import 'package:intl/intl.dart';

final String transactionDate = DateFormat("MM-dd-yy").format(DateTime.now());

/// This is the main application widget.
class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff272727),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image(image: AssetImage('assets/images/SmallLogo.png')),
              ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.person,
                  color: Color(0xff1F1F1F),
                ),
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(4),
                    primary: Color(0xffECDBBA)),
              ),
            ],
          )),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Card(
            color: Color(0xff1F1F1F),
            child: userTumbles.isEmpty
                ? Center(
                    child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "...",
                      style: TextStyle(
                          fontSize: 96,
                          color: Color(0xffECDBBA).withOpacity(0.2),
                          fontWeight: FontWeight.w600),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\nSeems like nothing can\ntrip you now huh.',
                          style: TextStyle(
                            color: Color(0xffECDBBA).withOpacity(0.2),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ))
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: userTumbles.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xffECDBBA).withOpacity(0.06)),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              leading: CircleAvatar(
                                backgroundColor: Color(0xffECDBBA),
                                radius: 20.0,
                                child: Icon(Icons.person,
                                    color: Color(0xffC84B31)),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'John',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xffECDBBA)),
                                      ),
                                      Text(
                                        ' @johndoe',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xffECDBBA)
                                                .withOpacity(0.2)),
                                      ),
                                      Text(
                                        " " + transactionDate,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xffECDBBA)
                                                .withOpacity(0.2)),
                                      ),
                                    ]),
                              ),
                              subtitle: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 3),
                                  child: Text(userTumbles[index].tumble,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffECDBBA)),
                                      textAlign: TextAlign.left),
                                ),
                              ),
                            )

                            // ignore: prefer_const_literals_to_create_immutables
                            ),
                      );
                    }),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        color: Color(0xff272727),
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              SizedBox(width: 30),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.mail),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateTumble()),
          );
        },
        child: Icon(Icons.add, color: Color(0xffECDBBA)),
        backgroundColor: Color(0xffC84B31),
        elevation: 3,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      backgroundColor: Color(0xff1F1F1F),
      extendBody: true,
    );
  }
}
