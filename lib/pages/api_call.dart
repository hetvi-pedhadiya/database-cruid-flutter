// import 'package:databse_cruid/database/database.dart';
// import 'package:flutter/material.dart';
// class UserListPage extends StatefulWidget {
//   @override
//   State<UserListPage> createState() => _UserListPageState();
// }
//
// class _UserListPageState extends State<UserListPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title: Text("List Page"), backgroundColor: Colors.grey.shade300),
//         body:
//         FutureBuilder(
//           future: MyDatabase().copyPasteAssetFileToRoot(), builder: (context, snapshot_copy) {
//           if (snapshot_copy.hasData ) {
//             return FutureBuilder(future: MyDatabase().getDetail(), builder: (context, snapshot_getAll) {
//               if(snapshot_getAll.hasData){
//                 return ListView.builder(itemCount:snapshot_getAll.data!.length,itemBuilder: (context, index) {
//                   return Padding(
//                       padding: const EdgeInsets.all(3.0),
//                       child: Card(child:Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 12,right: 7),
//                             child: Text(snapshot_getAll.data![index]['UserId'].toString(),),),
//
//                           Padding(
//                             padding: const EdgeInsets.only(left: 5,right: 7),
//                             child: Text(snapshot_getAll.data![index]['UserName'].toString(),)),
//
//                         ],
//                       ), )
//                     //
//
//                   );
//                 },);
//               }
//               else{
//                 return Center(child: CircularProgressIndicator());
//               }},);
//           }
//           if(snapshot_copy.data == null){
//             return Text("null data received");
//           }
//           else{
//             return Text("Copying");
//           }
//           // return Text("null");
//         },
//         )
//     );
//   }
// }
//
//


import 'package:databse_cruid/database/database.dart';
import 'package:databse_cruid/pages/lab7.dart';
import 'package:databse_cruid/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Apicall extends StatefulWidget {
  const Apicall({super.key});

  @override
  State<Apicall> createState() => _databaseDemoState();
}

class _databaseDemoState extends State<Apicall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Database demo",
          style: TextStyle(
              color: Colors.yellow.shade500,
              fontSize: 25,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                  builder: (context) => practicelab7(map:null),
                ))
                    .then((value) {
                  if (value == true) {
                    setState(() {});
                  }
                });
              },
              icon: Icon(
                Icons.add,
                color: Colors.yellow.shade500,
                size: 30,
                weight: 10,
              ))
        ],
        backgroundColor: Colors.cyan,
      ),
      body: FutureBuilder(
        future: MyDatabase().copyPasteAssetFileToRoot(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder(
              future: MyDatabase().getDetail(),
              builder: (context, snapshotlist) {
                if (snapshotlist.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(child: Icon(Icons.person)),
                        title: Text(
                          snapshotlist.data![index]['UserName'],
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: Wrap(
                          children: [
                            IconButton(
                                onPressed: () {
                                  showCupertinoDialog(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoAlertDialog(
                                        title: Text("Alert"),
                                        content: Text(
                                            "Are you sure want to delete?"),
                                        actions: [
                                          TextButton(
                                              onPressed: () async {
                                                await MyDatabase().delete(
                                                    snapshotlist.data![index]
                                                    ['UserId']);
                                                Navigator.pop(context);
                                                setState(() {});
                                              },
                                              child: Text("Ok")),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Cancel")),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => practicelab7(map:snapshotlist.data![index]),
                                      )).then((value) => {
                                    if (value == true) {setState(() {})}
                                  });
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.green.shade700,
                                ))
                          ],
                        ),
                      );
                    },
                    itemCount: snapshotlist.data!.length,
                  );
                  // return (Text(snapshotlist.data.toString()));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

