import 'package:databse_cruid/database/database.dart';
import 'package:databse_cruid/pages/lab7.dart';
import 'package:databse_cruid/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class databaseDemo extends StatefulWidget {
  const databaseDemo({super.key});

  @override
  State<databaseDemo> createState() => _databaseDemoState();
}

class _databaseDemoState extends State<databaseDemo> {
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
                  builder: (context) => practicelab7(map: null,),
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
        backgroundColor: Colors.pinkAccent,
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
                                        builder: (context) => practicelab7(map:null),
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
