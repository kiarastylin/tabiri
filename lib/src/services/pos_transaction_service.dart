import 'package:flutter/foundation.dart';
import 'package:zanmutm_pos_client/src/api/api.dart';
import 'package:zanmutm_pos_client/src/config/app_exceptions.dart';
import 'package:zanmutm_pos_client/src/db/db.dart';
import 'package:zanmutm_pos_client/src/models/pos_transaction.dart';
import 'package:zanmutm_pos_client/src/utils/helpers.dart';

class PosTransactionService {
  final String table = 'pos_transactions';
  final String api = '/pos-transactions';

  Future<int> save(PosTransaction txn) async {
    try {
      var resp = await Api().dio.post(api, data: txn.toJson());
      return resp.statusCode ?? 400;
    } on NoInternetConnectionException {
      int dbResp = await storeToDb(txn);
      return dbResp == 1 ? 200 : 400;
    } on DeadlineExceededException {
      int dbResp = await storeToDb(txn);
      return dbResp == 1 ? 200 : 400;
    } catch (e) {
      debugPrint(e.toString());
      throw ValidationException(e.toString());
    }
  }

  Future<int> saveAll(List<PosTransaction> posTxns) async {
    var db = await DbProvider().database;
    int result = 0;
    await db.transaction((txn) async {
      for (var item in posTxns) {
        Map<String, dynamic> data = {
          ...item.toJson(),
          'isPrinted': item.isPrinted ? 1 : 0,
        };
        result = await txn.insert(table, data);
      }
    });
    return result;
  }

  Future<int> storeToDb(PosTransaction txn) async {
    var db = await DbProvider().database;
    var data = {
      ...txn.toJson(),
      'isPrinted': txn.isPrinted ? 1 : 0,
    };
    var result = await db.insert(table, data);
    return result;
  }

  Future<bool> sync(String taxCollectorUuid) async {
    var db = await DbProvider().database;
    List<Map<String, dynamic>> dbTransactions = await db.query(table, where: "taxCollectorUuid=?", whereArgs: [taxCollectorUuid]);
    for (var txn in dbTransactions) {
      var resp = await Api().dio.post(api, data: {
        ...txn,
        'id': null,
        'uuid': null,
        'transactionDate':
            dateTimeFormat.format(DateTime.parse(txn['transactionDate']))
      });
      if (resp.statusCode == 200 || resp.statusCode == 201) {
        await db.delete(table, where: 'id=?', whereArgs: [txn['id']]);
      }
    }
    var existing = await db.query(table);
    return existing.isEmpty;
  }

  Future<List<PosTransaction>> getUnCompiled(String taxCollectorUuid) async {
    var resp = await Api().dio.get('$api/un-compiled/$taxCollectorUuid');
    return (resp.data['data'] as List<dynamic>)
        .map((e) => PosTransaction.fromJson(e))
        .toList();
  }

  Future<int?> compile(String taxCollectorUuid) async {
    var resp = await Api()
        .dio
        .post('$api/compile-transactions/$taxCollectorUuid', data: {});
    return resp.statusCode;
  }
}
