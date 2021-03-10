import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;

FirebaseFirestore getFirestoreInstance() {
  return _firestoreInstance;
}

void setFirestoreInstance(FirebaseFirestore firestoreInstance) {
  _firestoreInstance = firestoreInstance;
}

Future<void> resetFirestoreData() async {
  await _firestoreInstance.collection('tasks').get().then((snapshot) async {
    for (DocumentSnapshot documentSnapshot in snapshot.docs) {
      await documentSnapshot.reference.delete();
    }
  });
}
