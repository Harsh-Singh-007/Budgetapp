import 'package:budgetapp/dataModel/budget.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BudgetDatabase {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDB();
    return _database!;
  }

  static initDB() async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, "budget.db");
    var taskDb = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int t) async {
        await db.execute(
            'CREATE TABLE BUDGET (Id INTEGER PRIMARY KEY, value INTEGER, remark TEXT, date INTEGER, time TEXT, icon TEXT)'
        );
      },
    );
    _database = taskDb;
    return taskDb;
  }

  static Future<int?> insetTask(Map<String, dynamic> taskData) async {
    var dbClient = await database;
    int id = await dbClient.insert("BUDGET", taskData);
    if (id != null) {
      return (id);
    }
    return (null);
  }

  static Future<List<Budget>?> getAllTask() async {
    var dbClient = await database;
    List<Map<String, dynamic>> taskListFromDB = await dbClient.query("BUDGET");
    for (var map in taskListFromDB) {
      print(map);
    }
  }
}
