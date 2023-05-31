import 'package:flutter/material.dart';

class FlexibleEx extends StatelessWidget {
  const FlexibleEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('GeeksforGeeks'),
            backgroundColor: Colors.greenAccent[400],
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
              tooltip: 'Menu',
            ) //IconButton
            ), //AppBar
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ), //BoxDecoration
                      ), //Container
                    ), //Flexible
                    SizedBox(
                      width: 20,
                    ), //SizedBox
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ) //BoxDecoration
                          ), //Container
                    ) //Flexible
                  ], //<Widget>[]
                  mainAxisAlignment: MainAxisAlignment.center,
                ), //Row
              ), //Flexible
              SizedBox(
                height: 20,
              ), //SizedBox
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  width: 380,
                  height: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue), //BoxDecoration
                ), //Container
              ), //Flexible
              SizedBox(
                height: 20,
              ), //SizedBox
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Container(
                        width: 180,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.cyan,
                        ), //BoxDecoration
                      ), //Container
                    ), //Flexible
                    SizedBox(
                      width: 20,
                    ), //SizedBox
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Container(
                          width: 180,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.cyan,
                          ) //BoxDecoration
                          ), //Container
                    ) //Flexible
                  ], //<Widget>[]
                  mainAxisAlignment: MainAxisAlignment.center,
                ), //Row
              ), //Flexible
            ], //<Widget>[]
          ), //Column
        ) //Container
        );
  }
}
