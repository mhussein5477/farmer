
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



Widget buildCard(BuildContext context, DocumentSnapshot record) {


  return new Container(
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.5,
      child: FlatButton(
        onPressed: (){


        },
        child: Padding(
          padding: const EdgeInsets.only(top : 26.0 , bottom: 26, left: 5),
          child: Column(
            children: <Widget>[

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Container(
                      width: 250,
                      child: Text(
                        record['name'],
                        style:TextStyle(fontSize: 17 ,  color: Colors.black) ,),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Container(
                      width: 250,
                      child: Text(
                        record['weight'],
                        style:TextStyle(fontSize: 17 ,  color: Colors.black) ,),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Container(
                      width: 250,
                      child: Text(
                        record['date'],
                        style:TextStyle(fontSize: 17 ,  color: Colors.black) ,),
                    ),
                  ),
                ],
              ),



            ],
          ),
        ),
      ),
    ),
  );
}






