import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DBProvider {



  static Future<Database> initDB() async {
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'MusicCountDown.db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        db.execute("CREATE TABLE IF NOT EXISTS Music (id text, name text, secound int, mins text, pic text, desc text)");
        db.execute("CREATE TABLE IF NOT EXISTS MusicAlbum (parent text, audio text, desc text)");
        db.execute("insert into Music (id, name, secound, mins, pic, desc) values ('e1','刺激',60, '1 mins', '' ,'版權宣告')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e1','audio/e1.mp3' ,'Paintball Theme by Bird Creek YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e1','audio/e2.mp3' ,'Fire Breather by Silent Partner YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e1','audio/e3.mp3' ,'Ride of the Valkyries by Wagner YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e1','audio/e4.mp3' ,'Marvins Dance by Silent Partner YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e1','audio/e5.mp3' ,'Fight or Flight by Ethan Meixsell YouTube音樂庫')");

        db.execute("insert into Music (id, name, secound, mins, pic, desc) values ('h1','歡樂',60, '1 mins', '' ,'版權宣告')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h1','audio/h1.mp3' ,'Underdog by The 126ers YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h1','audio/h2.mp3' ,'Last Call by Silent Partner YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h1','audio/h3.mp3' ,'My Sad Old Heart by The 126ers YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h1','audio/h4.mp3' ,'Lovable Clown Sit Com by Sir Cubworth YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h1','audio/h5.mp3' ,'Entire by Quincas Moreira YouTube音樂庫')");

        db.execute("insert into Music (id, name, secound, mins, pic, desc) values ('p1','放鬆',60, '1 mins', 'image/peace.jpg' ,'版權宣告')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p1','audio/p1.mp3' ,'The Low Seas by The 126ers YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p1','audio/p2.mp3' ,'Easy Day by Kevin MacLeod YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p1','audio/p3.mp3' ,'Cry by Vibe Tracks YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p1','audio/p4.mp3' ,'The Bluest Star by The 126ers YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p1','audio/p5.mp3' ,'Blue Danube by Strauss YouTube音樂庫')");

        db.execute("insert into Music (id, name, secound, mins, pic, desc) values ('e3','刺激',180, '3 mins', '' ,'版權宣告')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e3','audio/e1.mp3' ,'Paintball Theme by Bird Creek YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e3','audio/e2.mp3' ,'Fire Breather by Silent Partner YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e3','audio/e3.mp3' ,'Ride of the Valkyries by Wagner YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e3','audio/e4.mp3' ,'Marvins Dance by Silent Partner YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e3','audio/e5.mp3' ,'Fight or Flight by Ethan Meixsell YouTube音樂庫')");

        db.execute("insert into Music (id, name, secound, mins, pic, desc) values ('h3','歡樂',180, '3 mins', '' ,'版權宣告')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h3','audio/h1.mp3' ,'Underdog by The 126ers YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h3','audio/h2.mp3' ,'Last Call by Silent Partner YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h3','audio/h3.mp3' ,'My Sad Old Heart by The 126ers YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h3','audio/h4.mp3' ,'Lovable Clown Sit Com by Sir Cubworth YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h3','audio/h5.mp3' ,'Entire by Quincas Moreira YouTube音樂庫')");

        db.execute("insert into Music (id, name, secound, mins, pic, desc) values ('p3','放鬆',180, '3 mins', 'image/peace.jpg'  ,'版權宣告')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p3','audio/p1.mp3' ,'The Low Seas by The 126ers YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p3','audio/p2.mp3' ,'Easy Day by Kevin MacLeod YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p3','audio/p3.mp3' ,'Cry by Vibe Tracks YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p3','audio/p4.mp3' ,'The Bluest Star by The 126ers YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p3','audio/p5.mp3' ,'Blue Danube by Strauss YouTube音樂庫')");


        db.execute("insert into Music (id, name, secound, mins, pic, desc) values ('e5','刺激',300, '5 mins', '' ,'版權宣告')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e5','audio/e1.mp3' ,'Paintball Theme by Bird Creek YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e5','audio/e2.mp3' ,'Fire Breather by Silent Partner YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e5','audio/e3.mp3' ,'Ride of the Valkyries by Wagner YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e5','audio/e4.mp3' ,'Marvins Dance by Silent Partner YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e5','audio/e5.mp3' ,'Fight or Flight by Ethan Meixsell YouTube音樂庫')");

        db.execute("insert into Music (id, name, secound, mins, pic, desc) values ('h5','歡樂',300, '5 mins', '' ,'版權宣告')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h5','audio/h1.mp3' ,'Underdog by The 126ers YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h5','audio/h2.mp3' ,'Last Call by Silent Partner YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h3','audio/h3.mp3' ,'My Sad Old Heart by The 126ers YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h5','audio/h4.mp3' ,'Lovable Clown Sit Com by Sir Cubworth YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h5','audio/h5.mp3' ,'Entire by Quincas Moreira YouTube音樂庫')");

        db.execute("insert into Music (id, name, secound, mins, pic, desc) values ('p5','放鬆',300, '5 mins', 'image/peace.jpg'  ,'版權宣告')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p5','audio/p1.mp3' ,'The Low Seas by The 126ers YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p5','audio/p2.mp3' ,'Easy Day by Kevin MacLeod YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p5','audio/p3.mp3' ,'Cry by Vibe Tracks YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p5','audio/p4.mp3' ,'The Bluest Star by The 126ers YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p5','audio/p5.mp3' ,'Blue Danube by Strauss YouTube音樂庫')");


        db.execute("insert into Music (id, name, secound, mins, pic, desc) values ('e10','刺激',600, '10 mins', '' ,'版權宣告')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e10','audio/e1.mp3' ,'Paintball Theme by Bird Creek YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e10','audio/e2.mp3' ,'Fire Breather by Silent Partner YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e10','audio/e3.mp3' ,'Ride of the Valkyries by Wagner YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e10','audio/e4.mp3' ,'Marvins Dance by Silent Partner YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('e10','audio/e5.mp3' ,'Fight or Flight by Ethan Meixsell YouTube音樂庫')");

        db.execute("insert into Music (id, name, secound, mins, pic, desc) values ('h10','歡樂',600, '10 mins', '' ,'版權宣告')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h10','audio/h1.mp3' ,'Underdog by The 126ers YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h10','audio/h2.mp3' ,'Last Call by Silent Partner YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h10','audio/h2.mp3' ,'Last Call by Silent Partner YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h10','audio/h3.mp3' ,'My Sad Old Heart by The 126ers YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h10','audio/h4.mp3' ,'Lovable Clown Sit Com by Sir Cubworth YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('h10','audio/h5.mp3' ,'Entire by Quincas Moreira YouTube音樂庫')");

        db.execute("insert into Music (id, name, secound, mins, pic, desc) values ('p10','放鬆',600, '10 mins', '' ,'版權宣告')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p10','audio/p1.mp3' ,'The Low Seas by The 126ers YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p10','audio/p2.mp3' ,'Easy Day by Kevin MacLeod YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p10','audio/p3.mp3' ,'Cry by Vibe Tracks YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p10','audio/p4.mp3' ,'The Bluest Star by The 126ers YouTube音樂庫')");
        db.execute("insert into MusicAlbum (parent, audio, desc) values ('p10','audio/p5.mp3' ,'Blue Danube by Strauss YouTube音樂庫')");
      }, onUpgrade: ( db,  oldVersion,  newVersion) async {
    },
      version: 1,
    );
    return database;

  }




}