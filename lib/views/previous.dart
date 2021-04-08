import 'package:farmer/views/results.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Previous extends StatefulWidget {
  @override
  _PreviousState createState() => _PreviousState();
}

class _PreviousState extends State<Previous> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    String date= DateFormat('dd/MM/yyyy').format(selectedDate).toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Previous data records"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Padding(
              padding: const EdgeInsets.only(top:58.0),
              child: Text("Select a date to search for"),
            )),
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

                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 13.0, bottom: 13.0, left: 23.0, right: 23.0),
                  child: Text(
                    "Search",
                    style: TextStyle(

                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Results(
                      date: date ,

                    )),
                  );

                },
              ),
            ),
          ],
        ),
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
}
