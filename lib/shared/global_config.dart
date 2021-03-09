import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;

FirebaseFirestore getFirestoreInstance() {
  return _firestoreInstance;
}

void setFirestoreInstance(FirebaseFirestore firestoreInstance) {
  _firestoreInstance = firestoreInstance;
}
