// import 'package:animate_do/animate_do.dart';
// import 'package:databse_cruid/database/database.dart';
// import 'package:databse_cruid/pages/api_call.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LogInPage extends StatefulWidget {
//   Map<String, dynamic>? map;
//    LogInPage({this.map});
//
//   @override
//   State<LogInPage> createState() => _LogInPageState();
// }
//
// class _LogInPageState extends State<LogInPage> {
//   String output="";
//   bool isRememberMe=true;
//   TextEditingController lastname = TextEditingController();
//   TextEditingController firstname = TextEditingController();
//   TextEditingController BirthDate = TextEditingController();
//   GlobalKey<FormState> validationkey = GlobalKey();
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.map != null) {
//       lastname.text = widget.map!['firstname'].toString();
//       firstname.text = widget.map!['lastname'].toString();
//       BirthDate.text = widget.map!['BirthDate'].toString();
//     }
//
//     Widget customText({required String firstname,required lastname,required BirthDate}) {
//       return (Text(firstname),Text(lastname),Text(BirthDate));
//     }
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           child: Container(
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   height: 400,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage('background.png'),
//                           fit: BoxFit.fill
//                       )
//                   ),
//                   child: Stack(
//                     children: <Widget>[
//                       Positioned(
//                         left: 30,
//                         width: 80,
//                         height: 200,
//                         child: FadeInUp(duration: Duration(seconds: 1), child: Container(
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage('light-1.png')
//                               )
//                           ),
//                         )),
//                       ),
//                       Positioned(
//                         left: 140,
//                         width: 80,
//                         height: 150,
//                         child: FadeInUp(duration: Duration(milliseconds: 1200), child: Container(
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage('light-1.png')
//                               )
//                           ),
//                         )),
//                       ),
//                       Positioned(
//                         right: 40,
//                         top: 40,
//                         width: 80,
//                         height: 150,
//                         child: FadeInUp(duration: Duration(milliseconds: 1300), child: Container(
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage('clock.png')
//                               )
//                           ),
//                         )),
//                       ),
//                       Positioned(
//                         child: FadeInUp(duration: Duration(milliseconds: 1600), child: Container(
//                           margin: EdgeInsets.only(top: 50),
//                           child: Center(
//                             child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
//                           ),
//                         )),
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(30.0),
//                   child: Column(
//                     children: <Widget>[
//                       FadeInUp(duration: Duration(milliseconds: 1800), child: Container(
//                         padding: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Color.fromRGBO(143, 148, 251, 1)),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Color.fromRGBO(143, 148, 251, .2),
//                                   blurRadius: 20.0,
//                                   offset: Offset(0, 10)
//                               )
//                             ]
//                         ),
//                         child: Column(
//                           children: <Widget>[
//                             Container(
//                               padding: EdgeInsets.all(8.0),
//                               decoration: BoxDecoration(
//                                   border: Border(bottom: BorderSide(color:  Color.fromRGBO(143, 148, 251, 1)))
//                               ),
//                               child: TextFormField(
//                                 key: validationkey,
//                                 validator: (value){
//                                   if(value!.isEmpty || value == null){
//                                     return 'Enter Name';
//                                   }
//
//                                 },
//                                 controller: firstname,
//                                 decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     hintText: " Enter Name",
//                                     hintStyle: TextStyle(color: Colors.grey[700])
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.all(8.0),
//                               child: TextFormField(
//                                 validator: (value){
//                                   if(value!.isEmpty || value == null){
//                                     return 'Enter lastname';
//                                   }
//                                   return null;
//                                 },
//                                 controller: lastname,
//
//                                 obscureText: true,
//                                 decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     hintText: "Enter last Name",
//                                     hintStyle: TextStyle(color: Colors.grey[700])
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.all(8.0),
//                               child: TextFormField(
//                                 validator: (value){
//                                   if(value!.isEmpty || value == null){
//                                     return 'Enter BirthDate';
//                                   }
//                                   return null;
//                                 },
//                                 controller: BirthDate,
//
//                                 obscureText: true,
//                                 decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     hintText: "Enter BirthDate",
//                                     hintStyle: TextStyle(color: Colors.grey[700])
//                                 ),
//                               ),
//                             ),
//
//                           ],
//                         ),
//                       )),
//
//
//                       SizedBox(height: 30,),
//                       FadeInUp(duration: Duration(milliseconds: 1900), child: Container(
//                         height: 50,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             gradient: LinearGradient(
//                                 colors: [
//                                   Color.fromRGBO(143, 148, 251, 1),
//                                   Color.fromRGBO(143, 148, 251, .6),
//                                 ]
//                             )
//                         ),
//
//
//
//                         InkWell(
//                           onTap: () async {
//                             if(validationkey.currentState!.validate()){
//                               if(widget.map!=null){
//                                 await updateUser().then((value) {
//                                   print("==============================YEss========================================================");
//                                   Navigator.of(context).pop(true);
//                                 });
//                               }else {
//                                 await addUser().then((value) {
//                                   Navigator.of(context).pop(true);
//                                 });
//                               }
//                             }
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(color: Colors.deepPurple.shade500,borderRadius: BorderRadius.circular(10),),
//                             height: 60,
//                             width: 180,
//                             child: Center(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   "Add to database",
//                                   style: TextStyle(color: Colors.orange.shade200,fontSize: 20),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       )),
//                       SizedBox(height: 70,),
//                       FadeInUp(duration: Duration(milliseconds: 2000), child:  Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),
//                     ],
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         )
//     );
//   }
//
//     Future<void> addUser() async {
//       Map<String, dynamic> map={};
//       map['firstname']=firstname.text.toString();
//       map['lastname']=lastname.text.toString();
//       map['BirthDate']=BirthDate.text.toString();
//       int id=await Apicall().addData(map);
//     }
//
//     Future<void> updateUser() async {
//       Map<String, dynamic> map={};
//       map['UserName']=name.text.toString();
//       map['UserId']=widget.map!['UserId'];
//       int id=await MyDatabase().updateData(map);
//     }
//
//
// }
