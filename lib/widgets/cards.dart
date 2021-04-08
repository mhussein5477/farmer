
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



Widget buildCard(BuildContext context, DocumentSnapshot message) {


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
                        message['message'],
                        style:TextStyle(fontSize: 17 ,  color: Colors.black) ,),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left:188.0),
                child: Container(
                  height: 30,
                  child: StreamBuilder(
                      stream: Firestore.instance.collection('users').where('uid' , isEqualTo : message['uid']).snapshots(),
                      builder: (BuildContext context, snapshot) {
                        if(!snapshot.hasData) return Text(" ");
                        return new ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (BuildContext context, int index) =>
                                name(context, snapshot.data.documents[index]));}),
                ),
              ),





            ],
          ),
        ),
      ),
    ),
  );
}
Widget name(BuildContext context , DocumentSnapshot name){
  return  Padding(
    padding: const EdgeInsets.only(top : 10.0,  left: 10, right: 10),
    child:Text(name['name'], style: TextStyle(color: Colors.grey),),
  );
}





