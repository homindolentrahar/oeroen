import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oeroen/common/constant/collections.dart';

extension CollectionExt on FirebaseFirestore {
  CollectionReference usersCollection() =>
      collection(Collections.usersCollection);

  CollectionReference adminsCollection() =>
      collection(Collections.adminsCollection);

  CollectionReference wargaCollection() =>
      collection(Collections.wargaCollection);

  CollectionReference iuranCollection() =>
      collection(Collections.iuranCollection);

  CollectionReference desaCollection() =>
      collection(Collections.desaCollection);

  DocumentReference wargaDoc(String? id) =>
      collection(Collections.wargaCollection).doc(id);
}
