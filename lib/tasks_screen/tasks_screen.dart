import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: Container(
        child: // <1> Use StreamBuilder
            StreamBuilder<QuerySnapshot>(
          // <2> Pass `Stream<QuerySnapshot>` to stream
          stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              // <3> Retrieve `List<DocumentSnapshot>` from snapshot
              final List<DocumentSnapshot> documents = snapshot.data.docs;
              return ListView(
                children: documents
                    .map(
                      (DocumentSnapshot doc) => Card(
                        child: ListTile(
                          title: Text(doc['name']),
                          subtitle: Text(doc['dateCreated'].toString()),
                        ),
                      ),
                    )
                    .toList(),
              );
            } else if (snapshot.hasError) {
              return Text("It's Error!");
            } else {
              return Text('Waiting');
            }
          },
        ),
      ),
    );
  }
}
