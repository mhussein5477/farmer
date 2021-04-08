
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer/views/compute.dart';
import 'package:farmer/views/forum.dart';
import 'package:farmer/views/previous.dart';
import 'package:farmer/views/record.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            new Center(
                child: new Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:20.0, left: 2, right: 2),
                      child: Container(
                        child: RaisedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Records()),);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: Colors.green ,
                          padding: EdgeInsets.only(top: 20.0, bottom: 30, left: 60, right: 60 ),
                          child: Column(
                            children: [
                             Icon(Icons.pending_actions_rounded , size: 60, color: Colors.white,),
                              Padding(
                                padding: const EdgeInsets.only(top:8.0),
                                child: Text("Record", style: TextStyle(color: Colors.white, fontSize: 18),),
                              ),
                            ],
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:17.0, left: 2, right: 2),
                      child: Container(
                        child: RaisedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Previous()),);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: Colors.green ,
                          padding: EdgeInsets.only(top: 20.0, bottom: 30, left: 35, right: 35 ),
                          child: Column(
                            children: [
                              Icon(Icons.analytics_outlined , size: 60, color: Colors.white,),
                              Padding(
                                padding: const EdgeInsets.only(top:8.0),
                                child: Text("Previous Data", style: TextStyle(color: Colors.white, fontSize: 18),),
                              ),
                            ],
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:17.0, left: 2, right: 2),
                      child: Container(
                        child: RaisedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Compute()),);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: Colors.green ,
                          padding: EdgeInsets.only(top: 20.0, bottom: 30, left: 55, right: 55 ),
                          child: Column(
                            children: [
                              Icon(Icons.engineering_outlined , size: 60, color: Colors.white,),
                              Padding(
                                padding: const EdgeInsets.only(top:8.0),
                                child: Text("Compute", style: TextStyle(color: Colors.white, fontSize: 18),),
                              ),
                            ],
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:17.0, left: 2, right: 2),
                      child: Container(
                        child: RaisedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Forum()),);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: Colors.green ,
                          padding: EdgeInsets.only(top: 20.0, bottom: 30, left: 60, right: 60 ),
                          child: Column(
                            children: [
                              Icon(Icons.message , size: 60, color: Colors.white,),
                              Padding(
                                padding: const EdgeInsets.only(top:8.0),
                                child: Text("Forum", style: TextStyle(color: Colors.white, fontSize: 18),),
                              ),
                            ],
                          ),

                        ),
                      ),
                    ),
                  ],
                )
            )
          ]
      )
    );
  }





}