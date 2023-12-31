import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HobbyRecord extends FirestoreRecord {
  HobbyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "HobbyType" field.
  String? _hobbyType;
  String get hobbyType => _hobbyType ?? '';
  bool hasHobbyType() => _hobbyType != null;

  // "CreateTime" field.
  DateTime? _createTime;
  DateTime? get createTime => _createTime;
  bool hasCreateTime() => _createTime != null;

  // "DailyRememinderTime" field.
  DateTime? _dailyRememinderTime;
  DateTime? get dailyRememinderTime => _dailyRememinderTime;
  bool hasDailyRememinderTime() => _dailyRememinderTime != null;

  // "HobbyVideo" field.
  String? _hobbyVideo;
  String get hobbyVideo => _hobbyVideo ?? '';
  bool hasHobbyVideo() => _hobbyVideo != null;

  // "UserUID" field.
  DocumentReference? _userUID;
  DocumentReference? get userUID => _userUID;
  bool hasUserUID() => _userUID != null;

  // "UserName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "UserImage" field.
  String? _userImage;
  String get userImage => _userImage ?? '';
  bool hasUserImage() => _userImage != null;

  void _initializeFields() {
    _hobbyType = snapshotData['HobbyType'] as String?;
    _createTime = snapshotData['CreateTime'] as DateTime?;
    _dailyRememinderTime = snapshotData['DailyRememinderTime'] as DateTime?;
    _hobbyVideo = snapshotData['HobbyVideo'] as String?;
    _userUID = snapshotData['UserUID'] as DocumentReference?;
    _userName = snapshotData['UserName'] as String?;
    _userImage = snapshotData['UserImage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Hobby');

  static Stream<HobbyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HobbyRecord.fromSnapshot(s));

  static Future<HobbyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HobbyRecord.fromSnapshot(s));

  static HobbyRecord fromSnapshot(DocumentSnapshot snapshot) => HobbyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HobbyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HobbyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HobbyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HobbyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHobbyRecordData({
  String? hobbyType,
  DateTime? createTime,
  DateTime? dailyRememinderTime,
  String? hobbyVideo,
  DocumentReference? userUID,
  String? userName,
  String? userImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'HobbyType': hobbyType,
      'CreateTime': createTime,
      'DailyRememinderTime': dailyRememinderTime,
      'HobbyVideo': hobbyVideo,
      'UserUID': userUID,
      'UserName': userName,
      'UserImage': userImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class HobbyRecordDocumentEquality implements Equality<HobbyRecord> {
  const HobbyRecordDocumentEquality();

  @override
  bool equals(HobbyRecord? e1, HobbyRecord? e2) {
    return e1?.hobbyType == e2?.hobbyType &&
        e1?.createTime == e2?.createTime &&
        e1?.dailyRememinderTime == e2?.dailyRememinderTime &&
        e1?.hobbyVideo == e2?.hobbyVideo &&
        e1?.userUID == e2?.userUID &&
        e1?.userName == e2?.userName &&
        e1?.userImage == e2?.userImage;
  }

  @override
  int hash(HobbyRecord? e) => const ListEquality().hash([
        e?.hobbyType,
        e?.createTime,
        e?.dailyRememinderTime,
        e?.hobbyVideo,
        e?.userUID,
        e?.userName,
        e?.userImage
      ]);

  @override
  bool isValidKey(Object? o) => o is HobbyRecord;
}
