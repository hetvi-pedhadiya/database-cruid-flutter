 import 'package:databse_cruid/database/database.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:project1flutter/database/myDatabase.dart';
// import 'package:project1flutter/databaseDemo.dart';

class practicelab7 extends StatefulWidget {
  Map<String, dynamic>? map;
  practicelab7({this.map});
  // practicelab7(Map<String, dynamic>? map){
  //   this.map=map;
  // }


  @override
  State<practicelab7> createState() => _practicelab7State();
}

class _practicelab7State extends State<practicelab7> {
  String output="";
  var name = TextEditingController();
  GlobalKey<FormState> key1 = GlobalKey();

  @override
  void initState() {
    super.initState();
    if (widget.map != null) {
      name.text = widget.map!['UserName'].toString();
    }
    // else{
    //   name.text='';
    // }
  }

  Widget customText({required String name}) {
    return (Text(
      name,
      // style: TextStyle(color: Colors.purple.shade700, fontSize: 30),
      // style: GoogleFonts.allura(
      //   fontSize: 30,
      //   fontWeight: FontWeight.w700,
      // ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple.shade100,
          title: Text(
            "Lab-7 & Form of Database demo",
            style: TextStyle(color: Colors.orange.shade700, fontSize: 25),
          ),
        ),
        body: Column(
          children: [
            customText(
              name: "Fill the form",
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: key1,
              child: TextFormField(
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter the name";
                  }
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown),
                      borderRadius: BorderRadius.circular(10)),
                  labelText: "Enter name",
                ),
                controller: name,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  print(name.text);
                },
                child: customText(name: "Print in Terminal")),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                setState(() {
                  output=name.text;
                });
              },
              child: Container(
                decoration: BoxDecoration(color: Colors.deepPurple.shade500,borderRadius: BorderRadius.circular(10),),
                height: 50,
                width: 80,
                child: Center(
                  child: Text(
                    "Click",
                    style: TextStyle(color: Colors.orange.shade200,fontSize: 25),
                  ),
                ),
              ),
            ),
            Container(child: Text(output,style: TextStyle(fontSize: 25,),),),
            SizedBox(height: 20,),
            InkWell(
              onTap: () async {
                if(key1.currentState!.validate()){
                  if(widget.map!=null){
                    await updateUser().then((value) {
                      print("==============================YEss========================================================");
                      Navigator.of(context).pop(true);
                    });
                  }else {
                    await addUser().then((value) {
                      Navigator.of(context).pop(true);
                    });
                  }
                }
              },
              child: Container(
                decoration: BoxDecoration(color: Colors.deepPurple.shade500,borderRadius: BorderRadius.circular(10),),
                height: 60,
                width: 180,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Add to database",
                      style: TextStyle(color: Colors.orange.shade200,fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )));
  }

  Future<void> addUser() async {
    Map<String, dynamic> map={};
    map['UserName']=name.text.toString();
    int id=await MyDatabase().addData(map);
  }

  Future<void> updateUser() async {
    Map<String, dynamic> map={};
    map['UserName']=name.text.toString();
    map['UserId']=widget.map!['UserId'];
    int id=await MyDatabase().updateData(map);
  }
}
