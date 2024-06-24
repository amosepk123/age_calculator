import 'package:flutter/material.dart';

class Age_calci extends StatefulWidget {
  const Age_calci({super.key});

  @override
  State<Age_calci> createState() => _Age_calciState();
}

class _Age_calciState extends State<Age_calci> {
  int age=0;
  int? selectedYear;
  void _showPicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(1800),
      initialDate: DateTime(2024),
      lastDate: DateTime.now(),
    ).then((DateTime? dt) {
      if (dt != null) {
        setState(() {
          selectedYear = dt.year;
          age = DateTime.now().year - selectedYear! -1;
         // calCulate_age();

        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.calculate, size: 45,),
          title: Text("Age Calculator", style: TextStyle(fontSize: 30, color: Colors.white),),
        ),
        body: Column(
          children: [
            Divider(color: Colors.grey,),
        Container(
          height: 450,
          width: 400,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(25),
            color: Colors.blueGrey,
          ),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: ElevatedButton(onPressed: (){
                    _showPicker();
                  },
                      child: Text("Select yr DOB"))),
              SizedBox(height: 15),
              Text(selectedYear == null ? 'No year selected' : 'Your age is $age', style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),

        ),

          ],
        ),
      ),
    );
  }
}
