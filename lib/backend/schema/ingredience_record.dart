import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class IngredienceRecord extends FirestoreRecord {
  IngredienceRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "iid" field.
  String? _iid;
  String get iid => _iid ?? '';
  bool hasIid() => _iid != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _iid = snapshotData['iid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ingredience');

  static Stream<IngredienceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IngredienceRecord.fromSnapshot(s));

  static Future<IngredienceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IngredienceRecord.fromSnapshot(s));

  static IngredienceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IngredienceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IngredienceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IngredienceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IngredienceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IngredienceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIngredienceRecordData({
  String? name,
  String? photoUrl,
  String? iid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'photo_url': photoUrl,
      'iid': iid,
    }.withoutNulls,
  );

  return firestoreData;
}

class IngredienceRecordDocumentEquality implements Equality<IngredienceRecord> {
  const IngredienceRecordDocumentEquality();

  @override
  bool equals(IngredienceRecord? e1, IngredienceRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.iid == e2?.iid;
  }

  @override
  int hash(IngredienceRecord? e) =>
      const ListEquality().hash([e?.name, e?.photoUrl, e?.iid]);

  @override
  bool isValidKey(Object? o) => o is IngredienceRecord;
}
