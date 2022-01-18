import 'package:hive_flutter/adapters.dart';
import 'package:money_manager/models/transaction/transaction_model.dart';

// ignore: constant_identifier_names
const TRANSACTION_DB_NAME = 'transaction-db';

abstract class TransactionDbFunction {
  Future<void> addTransaction(TransactionModel obj);
  Future<List<TransactionModel>> getAllTransaction();
}

class TransactionDB implements TransactionDbFunction {
  // create Internal constructor
  TransactionDB._internal();

  // assigning internal costructor
  static TransactionDB instance = TransactionDB._internal();

  factory TransactionDB() {
    return instance;
  }

  @override
  Future<void> addTransaction(TransactionModel obj) async {
    final _db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await _db.put(obj.id, obj);
  }

  @override
  Future<List<TransactionModel>> getAllTransaction() async {
    final _db = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    return _db.values.toList();
  }
}
