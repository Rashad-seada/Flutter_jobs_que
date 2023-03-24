// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  RecentJobDao? _recentJobDaoInstance;

  SuggestedJobDao? _suggestedJobDaoInstance;

  FavoriteJobDao? _favoriteJobDaoInstance;

  EducationDao? _educationDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RecentJob` (`id` INTEGER, `name` TEXT, `image` TEXT, `jobTimeType` TEXT, `jobType` TEXT, `jobLevel` TEXT, `jobDescription` TEXT, `jobSkill` TEXT, `compName` TEXT, `compEmail` TEXT, `compWebsite` TEXT, `aboutComp` TEXT, `location` TEXT, `salary` TEXT, `favorites` INTEGER, `expired` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `SuggestedJob` (`id` INTEGER, `name` TEXT, `image` TEXT, `jobTimeType` TEXT, `jobType` TEXT, `jobLevel` TEXT, `jobDescription` TEXT, `jobSkill` TEXT, `compName` TEXT, `compEmail` TEXT, `compWebsite` TEXT, `aboutComp` TEXT, `location` TEXT, `salary` TEXT, `favorites` INTEGER, `expired` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `FavoriteJob` (`id` INTEGER, `userId` INTEGER, `like` INTEGER, `jobId` INTEGER, `image` TEXT, `name` TEXT, `location` TEXT, `createdAt` TEXT, `updatedAt` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Education` (`id` INTEGER, `universty` TEXT, `title` TEXT, `start` TEXT, `end` TEXT, `userId` TEXT, `profileId` INTEGER, `updatedAt` TEXT, `createdAt` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  RecentJobDao get recentJobDao {
    return _recentJobDaoInstance ??= _$RecentJobDao(database, changeListener);
  }

  @override
  SuggestedJobDao get suggestedJobDao {
    return _suggestedJobDaoInstance ??=
        _$SuggestedJobDao(database, changeListener);
  }

  @override
  FavoriteJobDao get favoriteJobDao {
    return _favoriteJobDaoInstance ??=
        _$FavoriteJobDao(database, changeListener);
  }

  @override
  EducationDao get educationDao {
    return _educationDaoInstance ??= _$EducationDao(database, changeListener);
  }
}

class _$RecentJobDao extends RecentJobDao {
  _$RecentJobDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _recentJobInsertionAdapter = InsertionAdapter(
            database,
            'RecentJob',
            (RecentJob item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'jobTimeType': item.jobTimeType,
                  'jobType': item.jobType,
                  'jobLevel': item.jobLevel,
                  'jobDescription': item.jobDescription,
                  'jobSkill': item.jobSkill,
                  'compName': item.compName,
                  'compEmail': item.compEmail,
                  'compWebsite': item.compWebsite,
                  'aboutComp': item.aboutComp,
                  'location': item.location,
                  'salary': item.salary,
                  'favorites': item.favorites,
                  'expired': item.expired
                },
            changeListener),
        _recentJobUpdateAdapter = UpdateAdapter(
            database,
            'RecentJob',
            ['id'],
            (RecentJob item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'jobTimeType': item.jobTimeType,
                  'jobType': item.jobType,
                  'jobLevel': item.jobLevel,
                  'jobDescription': item.jobDescription,
                  'jobSkill': item.jobSkill,
                  'compName': item.compName,
                  'compEmail': item.compEmail,
                  'compWebsite': item.compWebsite,
                  'aboutComp': item.aboutComp,
                  'location': item.location,
                  'salary': item.salary,
                  'favorites': item.favorites,
                  'expired': item.expired
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RecentJob> _recentJobInsertionAdapter;

  final UpdateAdapter<RecentJob> _recentJobUpdateAdapter;

  @override
  Future<List<RecentJob>> getAllJobs() async {
    return _queryAdapter.queryList('SELECT * FROM RecentJob',
        mapper: (Map<String, Object?> row) => RecentJob(
            id: row['id'] as int?,
            name: row['name'] as String?,
            image: row['image'] as String?,
            jobTimeType: row['jobTimeType'] as String?,
            jobType: row['jobType'] as String?,
            jobLevel: row['jobLevel'] as String?,
            jobDescription: row['jobDescription'] as String?,
            jobSkill: row['jobSkill'] as String?,
            compName: row['compName'] as String?,
            compEmail: row['compEmail'] as String?,
            compWebsite: row['compWebsite'] as String?,
            aboutComp: row['aboutComp'] as String?,
            location: row['location'] as String?,
            salary: row['salary'] as String?,
            favorites: row['favorites'] as int?,
            expired: row['expired'] as int?));
  }

  @override
  Stream<RecentJob?> getJobById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM RecentJob WHERE id = ?1',
        mapper: (Map<String, Object?> row) => RecentJob(
            id: row['id'] as int?,
            name: row['name'] as String?,
            image: row['image'] as String?,
            jobTimeType: row['jobTimeType'] as String?,
            jobType: row['jobType'] as String?,
            jobLevel: row['jobLevel'] as String?,
            jobDescription: row['jobDescription'] as String?,
            jobSkill: row['jobSkill'] as String?,
            compName: row['compName'] as String?,
            compEmail: row['compEmail'] as String?,
            compWebsite: row['compWebsite'] as String?,
            aboutComp: row['aboutComp'] as String?,
            location: row['location'] as String?,
            salary: row['salary'] as String?,
            favorites: row['favorites'] as int?,
            expired: row['expired'] as int?),
        arguments: [id],
        queryableName: 'RecentJob',
        isView: false);
  }

  @override
  Future<void> deleteAllJobs() async {
    await _queryAdapter.queryNoReturn('DELETE FROM RecentJob');
  }

  @override
  Future<void> insertJob(RecentJob jobs) async {
    await _recentJobInsertionAdapter.insert(jobs, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateJob(RecentJob jobs) async {
    await _recentJobUpdateAdapter.update(jobs, OnConflictStrategy.abort);
  }
}

class _$SuggestedJobDao extends SuggestedJobDao {
  _$SuggestedJobDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _suggestedJobInsertionAdapter = InsertionAdapter(
            database,
            'SuggestedJob',
            (SuggestedJob item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'jobTimeType': item.jobTimeType,
                  'jobType': item.jobType,
                  'jobLevel': item.jobLevel,
                  'jobDescription': item.jobDescription,
                  'jobSkill': item.jobSkill,
                  'compName': item.compName,
                  'compEmail': item.compEmail,
                  'compWebsite': item.compWebsite,
                  'aboutComp': item.aboutComp,
                  'location': item.location,
                  'salary': item.salary,
                  'favorites': item.favorites,
                  'expired': item.expired
                },
            changeListener),
        _suggestedJobUpdateAdapter = UpdateAdapter(
            database,
            'SuggestedJob',
            ['id'],
            (SuggestedJob item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'jobTimeType': item.jobTimeType,
                  'jobType': item.jobType,
                  'jobLevel': item.jobLevel,
                  'jobDescription': item.jobDescription,
                  'jobSkill': item.jobSkill,
                  'compName': item.compName,
                  'compEmail': item.compEmail,
                  'compWebsite': item.compWebsite,
                  'aboutComp': item.aboutComp,
                  'location': item.location,
                  'salary': item.salary,
                  'favorites': item.favorites,
                  'expired': item.expired
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SuggestedJob> _suggestedJobInsertionAdapter;

  final UpdateAdapter<SuggestedJob> _suggestedJobUpdateAdapter;

  @override
  Future<List<SuggestedJob>> getAllJobs() async {
    return _queryAdapter.queryList('SELECT * FROM SuggestedJob',
        mapper: (Map<String, Object?> row) => SuggestedJob(
            id: row['id'] as int?,
            name: row['name'] as String?,
            image: row['image'] as String?,
            jobTimeType: row['jobTimeType'] as String?,
            jobType: row['jobType'] as String?,
            jobLevel: row['jobLevel'] as String?,
            jobDescription: row['jobDescription'] as String?,
            jobSkill: row['jobSkill'] as String?,
            compName: row['compName'] as String?,
            compEmail: row['compEmail'] as String?,
            compWebsite: row['compWebsite'] as String?,
            aboutComp: row['aboutComp'] as String?,
            location: row['location'] as String?,
            salary: row['salary'] as String?,
            favorites: row['favorites'] as int?,
            expired: row['expired'] as int?));
  }

  @override
  Stream<SuggestedJob?> getJobById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM SuggestedJob WHERE id = ?1',
        mapper: (Map<String, Object?> row) => SuggestedJob(
            id: row['id'] as int?,
            name: row['name'] as String?,
            image: row['image'] as String?,
            jobTimeType: row['jobTimeType'] as String?,
            jobType: row['jobType'] as String?,
            jobLevel: row['jobLevel'] as String?,
            jobDescription: row['jobDescription'] as String?,
            jobSkill: row['jobSkill'] as String?,
            compName: row['compName'] as String?,
            compEmail: row['compEmail'] as String?,
            compWebsite: row['compWebsite'] as String?,
            aboutComp: row['aboutComp'] as String?,
            location: row['location'] as String?,
            salary: row['salary'] as String?,
            favorites: row['favorites'] as int?,
            expired: row['expired'] as int?),
        arguments: [id],
        queryableName: 'SuggestedJob',
        isView: false);
  }

  @override
  Future<void> deleteAllJobs() async {
    await _queryAdapter.queryNoReturn('DELETE FROM SuggestedJob');
  }

  @override
  Future<void> insertJob(SuggestedJob job) async {
    await _suggestedJobInsertionAdapter.insert(job, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateJob(SuggestedJob job) async {
    await _suggestedJobUpdateAdapter.update(job, OnConflictStrategy.abort);
  }
}

class _$FavoriteJobDao extends FavoriteJobDao {
  _$FavoriteJobDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _favoriteJobInsertionAdapter = InsertionAdapter(
            database,
            'FavoriteJob',
            (FavoriteJob item) => <String, Object?>{
                  'id': item.id,
                  'userId': item.userId,
                  'like': item.like,
                  'jobId': item.jobId,
                  'image': item.image,
                  'name': item.name,
                  'location': item.location,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt
                },
            changeListener),
        _favoriteJobUpdateAdapter = UpdateAdapter(
            database,
            'FavoriteJob',
            ['id'],
            (FavoriteJob item) => <String, Object?>{
                  'id': item.id,
                  'userId': item.userId,
                  'like': item.like,
                  'jobId': item.jobId,
                  'image': item.image,
                  'name': item.name,
                  'location': item.location,
                  'createdAt': item.createdAt,
                  'updatedAt': item.updatedAt
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FavoriteJob> _favoriteJobInsertionAdapter;

  final UpdateAdapter<FavoriteJob> _favoriteJobUpdateAdapter;

  @override
  Future<List<FavoriteJob>> getAllJobs() async {
    return _queryAdapter.queryList('SELECT * FROM FavoriteJob',
        mapper: (Map<String, Object?> row) => FavoriteJob(
            id: row['id'] as int?,
            userId: row['userId'] as int?,
            like: row['like'] as int?,
            jobId: row['jobId'] as int?,
            image: row['image'] as String?,
            name: row['name'] as String?,
            location: row['location'] as String?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?));
  }

  @override
  Stream<FavoriteJob?> getJobById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM FavoriteJob WHERE id = ?1',
        mapper: (Map<String, Object?> row) => FavoriteJob(
            id: row['id'] as int?,
            userId: row['userId'] as int?,
            like: row['like'] as int?,
            jobId: row['jobId'] as int?,
            image: row['image'] as String?,
            name: row['name'] as String?,
            location: row['location'] as String?,
            createdAt: row['createdAt'] as String?,
            updatedAt: row['updatedAt'] as String?),
        arguments: [id],
        queryableName: 'FavoriteJob',
        isView: false);
  }

  @override
  Future<void> deleteAllJobs() async {
    await _queryAdapter.queryNoReturn('DELETE FROM RecentJob');
  }

  @override
  Future<void> insertJob(FavoriteJob jobs) async {
    await _favoriteJobInsertionAdapter.insert(jobs, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateJob(FavoriteJob jobs) async {
    await _favoriteJobUpdateAdapter.update(jobs, OnConflictStrategy.abort);
  }
}

class _$EducationDao extends EducationDao {
  _$EducationDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _educationInsertionAdapter = InsertionAdapter(
            database,
            'Education',
            (Education item) => <String, Object?>{
                  'id': item.id,
                  'universty': item.universty,
                  'title': item.title,
                  'start': item.start,
                  'end': item.end,
                  'userId': item.userId,
                  'profileId': item.profileId,
                  'updatedAt': item.updatedAt,
                  'createdAt': item.createdAt
                },
            changeListener),
        _educationUpdateAdapter = UpdateAdapter(
            database,
            'Education',
            ['id'],
            (Education item) => <String, Object?>{
                  'id': item.id,
                  'universty': item.universty,
                  'title': item.title,
                  'start': item.start,
                  'end': item.end,
                  'userId': item.userId,
                  'profileId': item.profileId,
                  'updatedAt': item.updatedAt,
                  'createdAt': item.createdAt
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Education> _educationInsertionAdapter;

  final UpdateAdapter<Education> _educationUpdateAdapter;

  @override
  Future<List<Education>> getAllEducation() async {
    return _queryAdapter.queryList('SELECT * FROM Education',
        mapper: (Map<String, Object?> row) => Education(
            universty: row['universty'] as String?,
            title: row['title'] as String?,
            start: row['start'] as String?,
            end: row['end'] as String?,
            userId: row['userId'] as String?,
            profileId: row['profileId'] as int?,
            updatedAt: row['updatedAt'] as String?,
            createdAt: row['createdAt'] as String?,
            id: row['id'] as int?));
  }

  @override
  Stream<Education?> getEducationById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Education WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Education(
            universty: row['universty'] as String?,
            title: row['title'] as String?,
            start: row['start'] as String?,
            end: row['end'] as String?,
            userId: row['userId'] as String?,
            profileId: row['profileId'] as int?,
            updatedAt: row['updatedAt'] as String?,
            createdAt: row['createdAt'] as String?,
            id: row['id'] as int?),
        arguments: [id],
        queryableName: 'Education',
        isView: false);
  }

  @override
  Future<void> deleteAllEducation() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Education');
  }

  @override
  Future<void> insertEducation(Education jobs) async {
    await _educationInsertionAdapter.insert(jobs, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateJob(Education jobs) async {
    await _educationUpdateAdapter.update(jobs, OnConflictStrategy.abort);
  }
}
