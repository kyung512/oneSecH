import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _IsButtonClicked =
          await secureStorage.getBool('ff_IsButtonClicked') ?? _IsButtonClicked;
    });
    await _safeInitAsync(() async {
      _ButtonNumber =
          await secureStorage.getInt('ff_ButtonNumber') ?? _ButtonNumber;
    });
    await _safeInitAsync(() async {
      _hobbyName = await secureStorage.getString('ff_hobbyName') ?? _hobbyName;
    });
    await _safeInitAsync(() async {
      _IsNavClicked =
          await secureStorage.getBool('ff_IsNavClicked') ?? _IsNavClicked;
    });
    await _safeInitAsync(() async {
      _NavButtonNumber =
          await secureStorage.getInt('ff_NavButtonNumber') ?? _NavButtonNumber;
    });
    await _safeInitAsync(() async {
      _HobbyTime = await secureStorage.read(key: 'ff_HobbyTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (await secureStorage.getInt('ff_HobbyTime'))!)
          : _HobbyTime;
    });
    await _safeInitAsync(() async {
      _videoTime = await secureStorage.read(key: 'ff_videoTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (await secureStorage.getInt('ff_videoTime'))!)
          : _videoTime;
    });
    await _safeInitAsync(() async {
      _IsVideoCap = await secureStorage.getBool('ff_IsVideoCap') ?? _IsVideoCap;
    });
    await _safeInitAsync(() async {
      _VideoPreview =
          await secureStorage.getString('ff_VideoPreview') ?? _VideoPreview;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _IsButtonClicked = false;
  bool get IsButtonClicked => _IsButtonClicked;
  set IsButtonClicked(bool _value) {
    _IsButtonClicked = _value;
    secureStorage.setBool('ff_IsButtonClicked', _value);
  }

  void deleteIsButtonClicked() {
    secureStorage.delete(key: 'ff_IsButtonClicked');
  }

  int _ButtonNumber = 0;
  int get ButtonNumber => _ButtonNumber;
  set ButtonNumber(int _value) {
    _ButtonNumber = _value;
    secureStorage.setInt('ff_ButtonNumber', _value);
  }

  void deleteButtonNumber() {
    secureStorage.delete(key: 'ff_ButtonNumber');
  }

  String _hobbyName = '';
  String get hobbyName => _hobbyName;
  set hobbyName(String _value) {
    _hobbyName = _value;
    secureStorage.setString('ff_hobbyName', _value);
  }

  void deleteHobbyName() {
    secureStorage.delete(key: 'ff_hobbyName');
  }

  bool _IsNavClicked = false;
  bool get IsNavClicked => _IsNavClicked;
  set IsNavClicked(bool _value) {
    _IsNavClicked = _value;
    secureStorage.setBool('ff_IsNavClicked', _value);
  }

  void deleteIsNavClicked() {
    secureStorage.delete(key: 'ff_IsNavClicked');
  }

  int _NavButtonNumber = 0;
  int get NavButtonNumber => _NavButtonNumber;
  set NavButtonNumber(int _value) {
    _NavButtonNumber = _value;
    secureStorage.setInt('ff_NavButtonNumber', _value);
  }

  void deleteNavButtonNumber() {
    secureStorage.delete(key: 'ff_NavButtonNumber');
  }

  DateTime? _HobbyTime;
  DateTime? get HobbyTime => _HobbyTime;
  set HobbyTime(DateTime? _value) {
    _HobbyTime = _value;
    _value != null
        ? secureStorage.setInt('ff_HobbyTime', _value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_HobbyTime');
  }

  void deleteHobbyTime() {
    secureStorage.delete(key: 'ff_HobbyTime');
  }

  DateTime? _videoTime;
  DateTime? get videoTime => _videoTime;
  set videoTime(DateTime? _value) {
    _videoTime = _value;
    _value != null
        ? secureStorage.setInt('ff_videoTime', _value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_videoTime');
  }

  void deleteVideoTime() {
    secureStorage.delete(key: 'ff_videoTime');
  }

  bool _IsVideoCap = false;
  bool get IsVideoCap => _IsVideoCap;
  set IsVideoCap(bool _value) {
    _IsVideoCap = _value;
    secureStorage.setBool('ff_IsVideoCap', _value);
  }

  void deleteIsVideoCap() {
    secureStorage.delete(key: 'ff_IsVideoCap');
  }

  String _VideoPreview = '';
  String get VideoPreview => _VideoPreview;
  set VideoPreview(String _value) {
    _VideoPreview = _value;
    secureStorage.setString('ff_VideoPreview', _value);
  }

  void deleteVideoPreview() {
    secureStorage.delete(key: 'ff_VideoPreview');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
