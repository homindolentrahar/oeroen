import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oeroen/common/constant/collections.dart';

extension CollectionExt on FirebaseFirestore {
  CollectionReference wargaCollection() =>
      collection(Collections.WARGA_COLLECTION);

  CollectionReference iuranCollection() =>
      collection(Collections.IURAN_COLLECTION);

  CollectionReference desaCollection() =>
      collection(Collections.DESA_COLLECTION);

  DocumentReference wargaDoc(String? id) =>
      collection(Collections.WARGA_COLLECTION).doc(id);
}
