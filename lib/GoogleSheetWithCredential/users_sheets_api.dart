import 'package:flutter/material.dart';
import 'package:flutter_explore/GoogleSheetWithCredential/Models/user.dart';
import 'package:gsheets/gsheets.dart';

class UserSheetsAPI {
  //Email     :  googlespreadsheet@sigma-outcome-395318.iam.gserviceaccount.com
  //Unique ID : 103788653171768839641
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "sigma-outcome-395318",
  "private_key_id": "598c1f97f764b57ce577dd56ecc917af4f8a4864",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQD0VbYJce1AZQZw\nBpQnCHdOz4JdUZH5BoxMFVgqvbuNdwwEusyKCxzM95zuE5QpYbviYwsw5kw2A0DX\nJZn/DrcTmL80orrCa5QXgUQc6iwYY4JzutRgY2SZoAi7z2Goix8WOLziXuz3ndB5\npWCd/Lhl7Ev7XUBBmbsH0v4I0r2nZ1bBA6KYrnem35yeJPy1b7K2wBJ7j12a8TfQ\nN1GEQRyCDBW+ND5nnH47MfuETgvQ5AaXByl4cvkLSLgh9aXxKsNQy8tNuO8FZeB4\n06Gowhu8Iu4uDFxHNZiNfjMkNcqAR7/9qK+oiwKpuXkXP+dT5p6CNdRLx36WY4Bq\n5KSvzPgxAgMBAAECggEARjOyP/h54HymYt2hB64JCZ3ZqRJczJ4zBVFEqdMl5jmE\nPH+ncSpMNiAW+NirQ1CPeTZX6s7gqsw4fxiQrJX/yCOlHGx9GItsW2yKs3wc+0zs\nGHBfwOoN543xtHSbbJ+8aNgYfTok/+haE/mOTxZjrPU9x5U9dxvCfzcCQmq6jzQ0\nH5JcLvGx7a+/rH1IhnfHf+rdMDpcMr12gMqs5znqM0shrs3o0S/GgXReC6Pl2Gpo\nsBH3vxYUoJoMG3yjPUfZPF2qbw2XmfYccFUIpuYs07JJpY8Rgxjj5RY5vXLSdJoo\nzWNzWeDsuw928m05DJqbRS89zWX4f5jQGholdpabeQKBgQD9iDJvb+NnJ6lv5iq7\nzSlUxhv/Sv47jpVVGNXld+w5HcLfT3Qf2+Nivqy9nIPbdOI9EYQcWhjj6a2cN6A+\nxPz9QaA5qyhFDHqk5xtX0IF22GFSXA0xSzuXSA9p6Wb5EIWlpmHCHw+pEepKgCuq\nV6bOO9cLB/2+YvapOYOV7s6hzwKBgQD2tpg2KOdUsxGOvNveJ30vCk3PqRUAeuS/\nF9ZDstYGQsvSwKd9XzQ0IbEbbXW26/NqX/rbEsxXcKPT3dDWtbHABR/kql5TPX9j\nnXI7YVYn13NxyR90siYDXX6ubJYZhtymKVJIlJlcNBk4166Gbf4Rexz4rTWXHyZ5\nq/p5JBNF/wKBgCEWakai2pG22mURK9iQoOlAZZz+w4kwRYryj8+/w+N8X9dW/je+\nMcHMUqz4RTkZ2wDPTWeJ1p+/+nldxRsMCFxg+TEthjbktwjYZHgkbRD+kkz2WH5r\nbB6FOAXBgT/WCSsiOLXl6dxNyz7n1UsI32sg4iK9az8ymTBioiqqHOt/AoGAfokm\nRljyVPnG3ou0xRtB1HeXcxOIhweA/RWvumcl6G4n9f8DqITE1JwXJzcb8ebQoNV7\nZxMcJRjLneWdsBHeidrXAcPzvwPCq4fcR+JjeunA9zItZP/eCUnRqIpe7dbCoqJ8\n5mb4xVafPQ06IQ6XCcY4FL9Zxhme9Takr682B2cCgYBnsuKF5J7q1YHUV81t6FK/\ngN9K+xlvV9aZeD4jpyuDuXN83L5k/LUMlSm8Tcxiv5KcXspKX2btrnr9LWjXJ/4R\nDQqDnjHP9z2UtlZdODMtzpEE58/Up6oDiSP/Q+K7s0K4f9CPZddBTCI2zygLz3uD\ngERtICQtGgWqdXq1QpFApg==\n-----END PRIVATE KEY-----\n",
  "client_email": "googlespreadsheet@sigma-outcome-395318.iam.gserviceaccount.com",
  "client_id": "103788653171768839641",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/googlespreadsheet%40sigma-outcome-395318.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

''';
  static const _spreadSheetID = "1UJXvD2eYs0nTL0w2S56XaFOLdPpdEs0JgUjebqekb9U";
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final spreadSheet = await _gsheets.spreadsheet(_spreadSheetID);
      _userSheet = await _getWorkSheet(spreadSheet, title: "Users");
      final firstRow = UserFields.getFields();
      _userSheet?.values.insertRow(1, firstRow);
      // starting row 1 => Header Row
    } catch (e) {
      debugPrint("UserSheetInitError : $e");
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      // create new work sheet if not created
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      // if already have sheet then return object of worksheet
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future<int> getRowCount() async {
    if (_userSheet == null) return 0;
    final lastRow = await _userSheet?.values.lastRow();
    return int.tryParse(lastRow?.first ?? "0") ?? 0;
  }

  static Future<User?> getById(int id) async {
    if (_userSheet == null) return null;
    final json = await _userSheet?.values.map.rowByKey(id, fromColumn: 2);
    debugPrint('json => $json');
    return json != null ? User.fromJson(json) : null;
  }

  static Future<List<User>> getAll() async {
    if (_userSheet == null) return <User>[];
    final users = await _userSheet?.values.map.allRows();

    return users != null
        ? users.map((_) => User.fromJson(_)).toList()
        : <User>[];
  }

  static Future<bool> insert(
    List<Map<String, dynamic>> rowList,
  ) async {
    if (_userSheet == null) return false;
    return await _userSheet?.values.map.appendRows(rowList) ?? false;
  }

  static Future<bool> update({
    required int id,
    required Map<String, dynamic> user,
  }) async {
    if (_userSheet == null) return false;
    return await _userSheet?.values.map.insertRowByKey(id, user) ?? false;
  }

  static Future<bool> updateCell({
    required int id,
    required String key,
    required dynamic value,
  }) async {
    if (_userSheet == null) return false;
    return await _userSheet?.values.insertValueByKeys(
          value,
          columnKey: key,
          rowKey: id,
        ) ??
        false;
  }

  static Future<bool> deleteByID(int id) async {
    if (_userSheet == null) return false;
    final index = await _userSheet?.values.rowIndexOf(id) ?? -1;
    if (index == -1) return false;
    return await _userSheet?.deleteRow(index) ?? false;
  }
}

class UserFormAPI2 {
  //Email     :  googlespreadsheet@sigma-outcome-395318.iam.gserviceaccount.com
  //Unique ID : 103788653171768839641
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "sigma-outcome-395318",
  "private_key_id": "598c1f97f764b57ce577dd56ecc917af4f8a4864",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQD0VbYJce1AZQZw\nBpQnCHdOz4JdUZH5BoxMFVgqvbuNdwwEusyKCxzM95zuE5QpYbviYwsw5kw2A0DX\nJZn/DrcTmL80orrCa5QXgUQc6iwYY4JzutRgY2SZoAi7z2Goix8WOLziXuz3ndB5\npWCd/Lhl7Ev7XUBBmbsH0v4I0r2nZ1bBA6KYrnem35yeJPy1b7K2wBJ7j12a8TfQ\nN1GEQRyCDBW+ND5nnH47MfuETgvQ5AaXByl4cvkLSLgh9aXxKsNQy8tNuO8FZeB4\n06Gowhu8Iu4uDFxHNZiNfjMkNcqAR7/9qK+oiwKpuXkXP+dT5p6CNdRLx36WY4Bq\n5KSvzPgxAgMBAAECggEARjOyP/h54HymYt2hB64JCZ3ZqRJczJ4zBVFEqdMl5jmE\nPH+ncSpMNiAW+NirQ1CPeTZX6s7gqsw4fxiQrJX/yCOlHGx9GItsW2yKs3wc+0zs\nGHBfwOoN543xtHSbbJ+8aNgYfTok/+haE/mOTxZjrPU9x5U9dxvCfzcCQmq6jzQ0\nH5JcLvGx7a+/rH1IhnfHf+rdMDpcMr12gMqs5znqM0shrs3o0S/GgXReC6Pl2Gpo\nsBH3vxYUoJoMG3yjPUfZPF2qbw2XmfYccFUIpuYs07JJpY8Rgxjj5RY5vXLSdJoo\nzWNzWeDsuw928m05DJqbRS89zWX4f5jQGholdpabeQKBgQD9iDJvb+NnJ6lv5iq7\nzSlUxhv/Sv47jpVVGNXld+w5HcLfT3Qf2+Nivqy9nIPbdOI9EYQcWhjj6a2cN6A+\nxPz9QaA5qyhFDHqk5xtX0IF22GFSXA0xSzuXSA9p6Wb5EIWlpmHCHw+pEepKgCuq\nV6bOO9cLB/2+YvapOYOV7s6hzwKBgQD2tpg2KOdUsxGOvNveJ30vCk3PqRUAeuS/\nF9ZDstYGQsvSwKd9XzQ0IbEbbXW26/NqX/rbEsxXcKPT3dDWtbHABR/kql5TPX9j\nnXI7YVYn13NxyR90siYDXX6ubJYZhtymKVJIlJlcNBk4166Gbf4Rexz4rTWXHyZ5\nq/p5JBNF/wKBgCEWakai2pG22mURK9iQoOlAZZz+w4kwRYryj8+/w+N8X9dW/je+\nMcHMUqz4RTkZ2wDPTWeJ1p+/+nldxRsMCFxg+TEthjbktwjYZHgkbRD+kkz2WH5r\nbB6FOAXBgT/WCSsiOLXl6dxNyz7n1UsI32sg4iK9az8ymTBioiqqHOt/AoGAfokm\nRljyVPnG3ou0xRtB1HeXcxOIhweA/RWvumcl6G4n9f8DqITE1JwXJzcb8ebQoNV7\nZxMcJRjLneWdsBHeidrXAcPzvwPCq4fcR+JjeunA9zItZP/eCUnRqIpe7dbCoqJ8\n5mb4xVafPQ06IQ6XCcY4FL9Zxhme9Takr682B2cCgYBnsuKF5J7q1YHUV81t6FK/\ngN9K+xlvV9aZeD4jpyuDuXN83L5k/LUMlSm8Tcxiv5KcXspKX2btrnr9LWjXJ/4R\nDQqDnjHP9z2UtlZdODMtzpEE58/Up6oDiSP/Q+K7s0K4f9CPZddBTCI2zygLz3uD\ngERtICQtGgWqdXq1QpFApg==\n-----END PRIVATE KEY-----\n",
  "client_email": "googlespreadsheet@sigma-outcome-395318.iam.gserviceaccount.com",
  "client_id": "103788653171768839641",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/googlespreadsheet%40sigma-outcome-395318.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

''';
  static const _spreadSheetID = "1UJXvD2eYs0nTL0w2S56XaFOLdPpdEs0JgUjebqekb9U";
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    final spreadSheet = await _gsheets.spreadsheet(_spreadSheetID);
    _userSheet = await _getWorkSheet(spreadSheet, title: "Mother-Board");
    _userSheet?.values.insertRow(1, ['Name', 'Price', 'Year', 'Warrenty']);
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      // create new work sheet if not created
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      // if already have sheet then return object of worksheet
      return spreadsheet.worksheetByTitle(title)!;
    }
  }
}
