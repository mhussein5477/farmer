import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Records extends StatefulWidget {
  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> {

  String name, weight ;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();




  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String date= DateFormat('dd/MM/yyyy').format(selectedDate).toString();
    String time = selectedTime.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Add produce"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey ,
            child: Column(
              children: [


                Padding(
                  padding: const EdgeInsets.only(top: 28.0, left: 38, right: 38 , bottom: 8),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      setState(() =>   name = value.trim());
                    } ,
                    keyboardType: TextInputType.text ,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: "Produce Name",
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 38, right: 38 , bottom: 8),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      setState(() =>   weight = value.trim());
                    } ,
                    keyboardType: TextInputType.text ,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: "Weight",
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:18.0),
                  child: Text(DateFormat('dd/MM/yyyy').format(selectedDate).toString() ),
                ),

                RaisedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select Date', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  color: Colors.green,
                ),


                Padding(
                  padding: const EdgeInsets.only(top:35.0, bottom: 200),
                  child: RaisedButton(
                    color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 13.0, bottom: 13.0, left: 23.0, right: 23.0),
                      child: Text(
                        "Record",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    onPressed:
                    name == null ? null : () async{
                      var  uid =  (await FirebaseAuth.instance.currentUser()).uid;
                      final DocumentReference documentReference = await Firestore.instance.collection('records').add({
                        'recordsid': "" ,
                      });

                      final String itemId= documentReference.documentID;
                      Firestore.instance.collection('records').document(itemId).setData({
                        "name" :  name ,
                        "weight" : weight ,
                        "date": date ,
                        'itemId': itemId ,
                        "uid" : uid
                      });
                      Navigator.of(context).pop();

                      successfullysent(context, date);


                    },
                  ),
                ),

              ],
            ),
          ) ,
        ) ,
      ),
    );
  }
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future successfullysent(context, roadname){
    String name = roadname;
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            title: Text("Successfully added", style: TextStyle(color: Colors.black),),
            content: Text( name.toUpperCase() + " has been to Previous" , style: TextStyle(fontSize: 13),),
          );
        }
    );
  }
}
