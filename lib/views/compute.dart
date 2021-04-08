import 'package:flutter/material.dart';


class Compute extends StatefulWidget {
  @override
  _ComputeState createState() => _ComputeState();
}

class _ComputeState extends State<Compute> {
  int weight  ;
 int  price ;
  int  totalweightprice = 0 ;


  final myController = TextEditingController();
  final myController1 = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Compute"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 38, right: 38 , bottom: 8),
                child: TextField(
                  controller: myController,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    setState(() =>   weight = value as int);
                  } ,
                  keyboardType: TextInputType.number ,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: "NET WEIGHT IN KG",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 38, right: 38 , bottom: 8),
                child: TextField(
                  controller: myController1,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    setState(() =>   price = value as int);
                  } ,
                  keyboardType: TextInputType.number ,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: "PRICE PER KG",
                  ),
                ),
              ),

              RaisedButton(
                  child: Text("Compute"),
                  onPressed: (){
                    var intweight = int.parse(myController.text);
                    var intprice = int.parse(myController1.text);
                    var totalcompute = intprice * intweight;

                    print(totalcompute);

                    setState(() {
                      totalweightprice=  totalcompute ;
                    });



                  }
              ),

              Padding(
                padding: const EdgeInsets.only(top:35.0),
                child: Text( totalweightprice > -1  ? ' The total produce is : $totalweightprice' : '0' , style: TextStyle(fontSize: 17),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
