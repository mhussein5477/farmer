import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:farmer/views/home_view.dart';
import 'package:farmer/widgets/provider_widget.dart';
import 'home_view.dart';



class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeView(),


  ];
  bool typecheck = false ;
  String accounttype = " ";

  @override
  void initState() {
    checktype().then((value){
      print('Async done');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        title: Text(accounttype , style: TextStyle(
            fontSize: 22, color: Colors.white, ),),centerTitle: true,
        actions: <Widget>[

          Visibility(
            visible: typecheck,
            child: IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              onPressed: () {
          },

            ) ,
          )


        ],
      ),

      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.green[400], //This will change the drawer background to blue.
          //other styles
        ),
        child: Drawer(


          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child:  FutureBuilder(
                            future: Provider.of(context).auth.getCurrentUser(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return displayUserInformation(context, snapshot);
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                decoration: BoxDecoration(
                  color: Colors.green[400],
                ),
              ),



              Padding(padding: EdgeInsets.only(top: 10),),
              Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 14, top: 50),
                child: Container(
                  color: Colors.white,
                  child: ListTile(

                      title: Text('LOGOUT'),
                      leading: Icon(Icons.exit_to_app, size: 23, color: Colors.green,),
                      onTap: ()   {
                        Navigator.of(context).pushReplacementNamed('/firstview');
                      },),
                ),
              ),


            ],
          ),

        ),
      ),


      body: _children[_currentIndex],

    );
  }

  void onTabTapped(int index) {

    setState(() {
      _currentIndex = index;
    });
  }

  Widget displayUserInformation(context, snapshot) {
    final authData = snapshot.data;

          return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Icon(Icons.account_circle, color: Colors.white, size: 60,),
                ),
                Padding(padding: const EdgeInsets.only(top: 5.0),),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${authData.displayName}",
                    style: TextStyle(fontSize: 15 , color: Colors.white),
                  ),
                ),





    ]
    );
  }


 checktype() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseUser user = await auth.currentUser();
final userid = user.uid;
    Firestore.instance.collection('users').where('uid', isEqualTo: userid).getDocuments().then((docs){
      if(docs.documents[0].exists){
        if(docs.documents[0].data['type'] == 'admin'){
          setState(() {
            typecheck = true;
            accounttype = "Admin";
          });
        }else{
          setState(() {
            typecheck = false;
            accounttype = "Produce Tracker";
          });
        }
      }
    });
  }


}

