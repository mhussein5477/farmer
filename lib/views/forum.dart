import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmer/widgets/cards.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Forum extends StatefulWidget {
  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  final message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Forum"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: _height * 0.45,
                child:  StreamBuilder(
                    stream: getitems(context),
                    builder: (BuildContext context, snapshot) {
                      if(!snapshot.hasData) return Padding( padding:EdgeInsets.only(top: 20, left: 20 , right: 20 , bottom: 20), child: CircularProgressIndicator(),);
                      return new ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (BuildContext context, int index) =>
                              buildCard(context, snapshot.data.documents[index]));
                    }
                ),
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                height: 61,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35.0),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 5,
                                color: Colors.grey)
                          ],
                        ),
                        child: Row(
                          children: [
                            IconButton(
                                icon: Icon(Icons.person , color: Colors.green,), onPressed: () {}),
                            Expanded(
                              child: TextField(
                                controller: message,
                                decoration: InputDecoration(
                                    hintText: "Type Something...",
                                    hintStyle: TextStyle( color:     Colors.green),
                                    border: InputBorder.none),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                      child: InkWell(
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                        onTap: () async{
                          var  uid =  (await FirebaseAuth.instance.currentUser()).uid;
                          Firestore.instance.collection('messages').add({
                          "message" :  message.text ,
                          "uid" : uid
                          });

                        },
                      ),
                    )
                  ],
                ),
              ) ,

            ],
          ),
        ),
      ),
    );
  }
  Stream<QuerySnapshot>  getitems(BuildContext context) async* {

    yield* Firestore.instance.collection('messages').snapshots();
  }

}
