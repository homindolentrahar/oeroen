import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oeroen/common/constant/collections.dart';

extension CollectionExt on FirebaseFirestore {
  CollectionReference usersCollection() =>
      collection(Collections.USER_COLLECTION);

  CollectionReference iuranCollection() =>
      collection(Collections.IURAN_COLLECTION);

  DocumentReference userDoc(String? id) =>
      collection(Collections.USER_COLLECTION).doc(id);
}
