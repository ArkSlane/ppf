import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DrinksRecord extends FirestoreRecord {
  DrinksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "drink_photo" field.
  String? _drinkPhoto;
  String get drinkPhoto => _drinkPhoto ?? '';
  bool hasDrinkPhoto() => _drinkPhoto != null;

  // "drink_name" field.
  String? _drinkName;
  String get drinkName => _drinkName ?? '';
  bool hasDrinkName() => _drinkName != null;

  // "drink_hearts" field.
  List<String>? _drinkHearts;
  List<String> get drinkHearts => _drinkHearts ?? const [];
  bool hasDrinkHearts() => _drinkHearts != null;

  // "drink_season" field.
  String? _drinkSeason;
  String get drinkSeason => _drinkSeason ?? '';
  bool hasDrinkSeason() => _drinkSeason != null;

  // "drink_glass" field.
  String? _drinkGlass;
  String get drinkGlass => _drinkGlass ?? '';
  bool hasDrinkGlass() => _drinkGlass != null;

  // "drink_percentage" field.
  String? _drinkPercentage;
  String get drinkPercentage => _drinkPercentage ?? '';
  bool hasDrinkPercentage() => _drinkPercentage != null;

  // "hearts_count" field.
  int? _heartsCount;
  int get heartsCount => _heartsCount ?? 0;
  bool hasHeartsCount() => _heartsCount != null;

  // "ingredience" field.
  List<String>? _ingredience;
  List<String> get ingredience => _ingredience ?? const [];
  bool hasIngredience() => _ingredience != null;

  void _initializeFields() {
    _drinkPhoto = snapshotData['drink_photo'] as String?;
    _drinkName = snapshotData['drink_name'] as String?;
    _drinkHearts = getDataList(snapshotData['drink_hearts']);
    _drinkSeason = snapshotData['drink_season'] as String?;
    _drinkGlass = snapshotData['drink_glass'] as String?;
    _drinkPercentage = snapshotData['drink_percentage'] as String?;
    _heartsCount = castToType<int>(snapshotData['hearts_count']);
    _ingredience = getDataList(snapshotData['ingredience']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('drinks');

  static Stream<DrinksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DrinksRecord.fromSnapshot(s));

  static Future<DrinksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DrinksRecord.fromSnapshot(s));

  static DrinksRecord fromSnapshot(DocumentSnapshot snapshot) => DrinksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DrinksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DrinksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DrinksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DrinksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDrinksRecordData({
  String? drinkPhoto,
  String? drinkName,
  String? drinkSeason,
  String? drinkGlass,
  String? drinkPercentage,
  int? heartsCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'drink_photo': drinkPhoto,
      'drink_name': drinkName,
      'drink_season': drinkSeason,
      'drink_glass': drinkGlass,
      'drink_percentage': drinkPercentage,
      'hearts_count': heartsCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class DrinksRecordDocumentEquality implements Equality<DrinksRecord> {
  const DrinksRecordDocumentEquality();

  @override
  bool equals(DrinksRecord? e1, DrinksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.drinkPhoto == e2?.drinkPhoto &&
        e1?.drinkName == e2?.drinkName &&
        listEquality.equals(e1?.drinkHearts, e2?.drinkHearts) &&
        e1?.drinkSeason == e2?.drinkSeason &&
        e1?.drinkGlass == e2?.drinkGlass &&
        e1?.drinkPercentage == e2?.drinkPercentage &&
        e1?.heartsCount == e2?.heartsCount &&
        listEquality.equals(e1?.ingredience, e2?.ingredience);
  }

  @override
  int hash(DrinksRecord? e) => const ListEquality().hash([
        e?.drinkPhoto,
        e?.drinkName,
        e?.drinkHearts,
        e?.drinkSeason,
        e?.drinkGlass,
        e?.drinkPercentage,
        e?.heartsCount,
        e?.ingredience
      ]);

  @override
  bool isValidKey(Object? o) => o is DrinksRecord;
}
