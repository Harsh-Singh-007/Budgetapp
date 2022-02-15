import 'package:budgetapp/dataModel/budget.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BudgetDatabase {
  static final BudgetDatabase instance = BudgetDatabase._init();

  static Database? _database;

  BudgetDatabase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB('budget.db');
      return _database!;
    }
  }

  Future<Database> _initDB(String filePath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idtype = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final integervalue = 'INTEGER NOT NULL';
    final integerdate = 'INTEGER NOT NULL';
    final integertime = 'INTEGER NOT NULL';
    final textremark = 'TEXT';
    final texticon = 'TEXT NOT NULL';
    await db.execute('''CREATE TABLE $tableBudget('
        ${BudgetsFields.id} $idtype,
        ${BudgetsFields.value} $integervalue,
        ${BudgetsFields.date} $integerdate,
        ${BudgetsFields.time} $integertime,
        ${BudgetsFields.remark} $textremark,
        ${BudgetsFields.icon} $texticon,')''');
  }

  /*Future<Budget> create(Budget budget) async {
    final db = await instance.database;
    final id = await db.insert(
      tableBudget,
    );
  }
*/
  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
