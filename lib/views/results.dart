import 'package:farmer/widgets/card2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  final String date ;
  const Results({Key key, this.date}) : super(key: key);
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(widget.date),
        ),
        body:  Container(
          child: StreamBuilder(
              stream: getitems(context , widget.date),
              builder: (BuildContext context, snapshot) {
                if(!snapshot.hasData) return Padding( padding:EdgeInsets.only(top: 20, left: 20 , right: 20 , bottom: 20), child: Text(" "),);
                return new ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index) =>
                        buildCard(context, snapshot.data.documents[index]));
              }
          ),
        ),
      ),
    );
  }

  Stream<QuerySnapshot>  getitems(BuildContext context , date) async* {
    var  uid =  (await FirebaseAuth.instance.currentUser()).uid;

    yield* Firestore.instance.collection('records').where("date" , isEqualTo: date).snapshots();
  }
}