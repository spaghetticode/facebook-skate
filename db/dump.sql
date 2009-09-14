BEGIN TRANSACTION;
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
INSERT INTO "schema_migrations" VALUES('20090908212934');
INSERT INTO "schema_migrations" VALUES('20090910112651');
INSERT INTO "schema_migrations" VALUES('20090910112848');
INSERT INTO "schema_migrations" VALUES('20090910121130');
INSERT INTO "schema_migrations" VALUES('20090910121255');
INSERT INTO "schema_migrations" VALUES('20090910132516');
INSERT INTO "schema_migrations" VALUES('20090911135952');
INSERT INTO "schema_migrations" VALUES('20090911224618');
INSERT INTO "schema_migrations" VALUES('20090912084450');
INSERT INTO "schema_migrations" VALUES('20090912121849');
INSERT INTO "schema_migrations" VALUES('20090912123720');
INSERT INTO "schema_migrations" VALUES('20090912131823');
INSERT INTO "schema_migrations" VALUES('20090912191541');
INSERT INTO "schema_migrations" VALUES('20090913090409');
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "facebook_id" integer(20) NOT NULL, "session_key" varchar(255), "created_at" datetime, "updated_at" datetime, "rank_id" integer, "experience" integer DEFAULT 0, "money" integer DEFAULT 0, "trained_on" date, "stamina" integer DEFAULT 0, "dexterity" integer DEFAULT 0);
INSERT INTO "users" VALUES(1,1536717821,NULL,'2009-09-11 18:46:30','2009-09-12 19:28:44',3,232,177,'2009-09-12',0,0);
INSERT INTO "users" VALUES(2,1732513836,NULL,'2009-09-11 18:46:45','2009-09-12 07:23:59',1,20,0,NULL,0,0);
INSERT INTO "users" VALUES(3,100000207486578,NULL,'2009-09-11 20:18:38','2009-09-12 07:31:00',1,8,0,NULL,0,0);
INSERT INTO "users" VALUES(4,653163912,NULL,'2009-09-11 20:37:35','2009-09-12 07:29:20',1,38,0,NULL,0,0);
INSERT INTO "users" VALUES(5,1462084019,NULL,'2009-09-11 21:13:09','2009-09-12 08:04:11',1,10,0,NULL,0,0);
INSERT INTO "users" VALUES(6,1159327627,NULL,'2009-09-11 22:24:23','2009-09-11 22:25:35',1,4,0,NULL,0,0);
INSERT INTO "users" VALUES(7,577192872,NULL,'2009-09-11 22:27:10','2009-09-11 22:28:22',1,4,0,NULL,0,0);
INSERT INTO "users" VALUES(8,1526945457,NULL,'2009-09-11 22:33:17','2009-09-11 22:36:59',1,5,0,NULL,0,0);
INSERT INTO "users" VALUES(9,1248033768,NULL,'2009-09-12 07:31:13','2009-09-12 11:24:24',1,208,29,NULL,0,0);
INSERT INTO "users" VALUES(10,1023378369,NULL,'2009-09-12 07:57:41','2009-09-12 07:57:57',1,2,0,NULL,0,0);
INSERT INTO "users" VALUES(11,1041697580,NULL,'2009-09-12 08:05:09','2009-09-12 10:00:27',1,177,29,NULL,0,0);
INSERT INTO "users" VALUES(12,1541329043,NULL,'2009-09-12 15:21:22','2009-09-12 15:24:07',1,121,197,NULL,0,0);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('ranks',10);
INSERT INTO "sqlite_sequence" VALUES('tricks',12);
INSERT INTO "sqlite_sequence" VALUES('users',12);
INSERT INTO "sqlite_sequence" VALUES('matches',52);
INSERT INTO "sqlite_sequence" VALUES('events',8);
INSERT INTO "sqlite_sequence" VALUES('items',14);
CREATE TABLE "ranks" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "level" integer, "next_rank_id" integer, "min_experience" integer, "created_at" datetime, "updated_at" datetime);
INSERT INTO "ranks" VALUES(1,'1',1,2,0,'2009-09-11 18:46:24','2009-09-11 18:46:24');
INSERT INTO "ranks" VALUES(2,'2',2,3,100,'2009-09-11 18:46:24','2009-09-11 18:46:24');
INSERT INTO "ranks" VALUES(3,'3',3,4,200,'2009-09-11 18:46:24','2009-09-11 18:46:24');
INSERT INTO "ranks" VALUES(4,'4',4,5,300,'2009-09-11 18:46:24','2009-09-11 18:46:24');
INSERT INTO "ranks" VALUES(5,'5',5,6,400,'2009-09-11 18:46:24','2009-09-11 18:46:24');
INSERT INTO "ranks" VALUES(6,'6',6,7,500,'2009-09-11 18:46:24','2009-09-11 18:46:24');
INSERT INTO "ranks" VALUES(7,'7',7,8,600,'2009-09-11 18:46:24','2009-09-11 18:46:24');
INSERT INTO "ranks" VALUES(8,'8',8,9,700,'2009-09-11 18:46:24','2009-09-11 18:46:24');
INSERT INTO "ranks" VALUES(9,'9',9,10,800,'2009-09-11 18:46:24','2009-09-11 18:46:24');
INSERT INTO "ranks" VALUES(10,'10',10,NULL,900,'2009-09-11 18:46:24','2009-09-11 18:46:24');
CREATE TABLE "tricks" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "rank_id" integer, "difficulty" integer, "created_at" datetime, "updated_at" datetime);
INSERT INTO "tricks" VALUES(1,'tip tap',1,1,'2009-09-11 18:46:24','2009-09-11 18:46:24');
INSERT INTO "tricks" VALUES(2,'ollie',1,1,'2009-09-11 18:46:24','2009-09-11 18:46:24');
INSERT INTO "tricks" VALUES(3,'manual',1,1,'2009-09-11 18:46:24','2009-09-11 18:46:24');
INSERT INTO "tricks" VALUES(4,'frontside ollie',2,2,'2009-09-11 18:46:24','2009-09-11 18:46:24');
INSERT INTO "tricks" VALUES(5,'backside ollie',2,2,'2009-09-11 18:46:24','2009-09-11 18:46:24');
INSERT INTO "tricks" VALUES(6,'varial',2,2,'2009-09-11 18:46:24','2009-09-11 18:46:24');
INSERT INTO "tricks" VALUES(7,'flip',3,3,'2009-09-11 18:46:24','2009-09-11 18:46:24');
INSERT INTO "tricks" VALUES(8,'nollie',3,3,'2009-09-11 18:46:24','2009-09-11 18:46:24');
INSERT INTO "tricks" VALUES(9,'heel flip',3,3,'2009-09-11 18:46:24','2009-09-11 18:46:24');
INSERT INTO "tricks" VALUES(10,'backside flip',4,4,'2009-09-11 18:46:25','2009-09-11 18:46:25');
INSERT INTO "tricks" VALUES(11,'360 flip',4,4,'2009-09-11 18:46:25','2009-09-11 18:46:25');
INSERT INTO "tricks" VALUES(12,'frontside flip',4,4,'2009-09-11 18:46:25','2009-09-11 18:46:25');
CREATE TABLE "matches" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "contender_id" integer, "victory" boolean DEFAULT 'f', "closed" boolean DEFAULT 'f', "created_at" datetime, "updated_at" datetime);
INSERT INTO "matches" VALUES(1,1,2,'f','f','2009-09-11 18:46:46','2009-09-11 18:46:46');
INSERT INTO "matches" VALUES(2,1,2,'f','f','2009-09-11 18:48:11','2009-09-11 18:48:11');
INSERT INTO "matches" VALUES(3,1,2,'f','f','2009-09-11 19:13:00','2009-09-11 19:13:00');
INSERT INTO "matches" VALUES(4,1,2,'f','f','2009-09-11 19:18:08','2009-09-11 19:18:08');
INSERT INTO "matches" VALUES(5,1,2,'f','f','2009-09-11 19:24:44','2009-09-11 19:24:44');
INSERT INTO "matches" VALUES(6,1,2,'f','f','2009-09-11 19:39:25','2009-09-11 19:39:25');
INSERT INTO "matches" VALUES(7,1,2,'f','f','2009-09-11 19:46:34','2009-09-11 19:46:34');
INSERT INTO "matches" VALUES(8,1,2,'t','t','2009-09-11 19:49:15','2009-09-11 19:56:38');
INSERT INTO "matches" VALUES(9,1,2,'t','t','2009-09-11 19:57:23','2009-09-11 20:10:40');
INSERT INTO "matches" VALUES(10,1,2,'t','t','2009-09-11 20:10:57','2009-09-11 20:14:53');
INSERT INTO "matches" VALUES(11,1,2,'t','t','2009-09-11 20:15:38','2009-09-11 20:17:51');
INSERT INTO "matches" VALUES(12,1,3,'f','t','2009-09-11 20:18:38','2009-09-11 20:23:56');
INSERT INTO "matches" VALUES(13,1,2,'t','t','2009-09-11 20:25:17','2009-09-11 20:29:21');
INSERT INTO "matches" VALUES(14,1,2,'f','t','2009-09-11 20:30:12','2009-09-11 20:34:31');
INSERT INTO "matches" VALUES(15,1,2,'f','t','2009-09-11 20:35:11','2009-09-11 20:35:52');
INSERT INTO "matches" VALUES(16,1,2,'f','t','2009-09-11 20:36:14','2009-09-11 20:37:07');
INSERT INTO "matches" VALUES(17,1,4,'f','t','2009-09-11 20:37:35','2009-09-11 20:38:15');
INSERT INTO "matches" VALUES(18,1,2,'t','t','2009-09-11 20:38:54','2009-09-11 20:40:35');
INSERT INTO "matches" VALUES(19,1,4,'t','t','2009-09-11 21:02:56','2009-09-11 21:05:33');
INSERT INTO "matches" VALUES(20,1,2,'f','t','2009-09-11 21:05:57','2009-09-11 21:07:24');
INSERT INTO "matches" VALUES(21,1,2,'t','t','2009-09-11 21:07:53','2009-09-11 21:08:40');
INSERT INTO "matches" VALUES(22,1,4,'f','t','2009-09-11 21:09:32','2009-09-11 21:11:51');
INSERT INTO "matches" VALUES(23,1,5,'t','t','2009-09-11 21:13:09','2009-09-11 21:14:18');
INSERT INTO "matches" VALUES(24,1,4,'f','t','2009-09-11 21:53:25','2009-09-11 21:55:18');
INSERT INTO "matches" VALUES(25,1,4,'f','t','2009-09-11 21:57:23','2009-09-11 21:58:40');
INSERT INTO "matches" VALUES(26,1,2,'f','t','2009-09-11 21:59:25','2009-09-11 21:59:55');
INSERT INTO "matches" VALUES(27,1,2,'t','t','2009-09-11 22:00:09','2009-09-11 22:17:14');
INSERT INTO "matches" VALUES(28,1,2,'f','t','2009-09-11 22:17:41','2009-09-11 22:23:48');
INSERT INTO "matches" VALUES(29,1,6,'f','t','2009-09-11 22:24:23','2009-09-11 22:25:35');
INSERT INTO "matches" VALUES(30,1,4,'f','t','2009-09-11 22:25:50','2009-09-11 22:27:00');
INSERT INTO "matches" VALUES(31,1,7,'t','t','2009-09-11 22:27:10','2009-09-11 22:28:22');
INSERT INTO "matches" VALUES(32,1,8,'t','t','2009-09-11 22:33:17','2009-09-11 22:36:59');
INSERT INTO "matches" VALUES(33,1,4,'t','t','2009-09-11 22:49:09','2009-09-11 22:56:12');
INSERT INTO "matches" VALUES(34,1,2,'f','t','2009-09-12 07:16:39','2009-09-12 07:23:59');
INSERT INTO "matches" VALUES(35,1,4,'f','t','2009-09-12 07:24:14','2009-09-12 07:29:20');
INSERT INTO "matches" VALUES(36,1,3,'f','t','2009-09-12 07:29:35','2009-09-12 07:31:00');
INSERT INTO "matches" VALUES(37,1,9,'t','t','2009-09-12 07:31:13','2009-09-12 07:44:15');
INSERT INTO "matches" VALUES(38,1,9,'t','t','2009-09-12 07:44:37','2009-09-12 07:50:07');
INSERT INTO "matches" VALUES(39,1,9,'t','t','2009-09-12 07:52:49','2009-09-12 07:55:44');
INSERT INTO "matches" VALUES(40,1,10,'t','t','2009-09-12 07:57:41','2009-09-12 07:57:57');
INSERT INTO "matches" VALUES(41,1,9,'t','t','2009-09-12 07:58:19','2009-09-12 07:59:27');
INSERT INTO "matches" VALUES(42,1,5,'t','t','2009-09-12 08:01:30','2009-09-12 08:04:11');
INSERT INTO "matches" VALUES(43,1,11,'f','t','2009-09-12 08:05:09','2009-09-12 08:14:16');
INSERT INTO "matches" VALUES(44,1,9,'f','t','2009-09-12 08:14:29','2009-09-12 08:18:26');
INSERT INTO "matches" VALUES(45,1,11,'f','t','2009-09-12 08:20:08','2009-09-12 08:23:48');
INSERT INTO "matches" VALUES(46,1,9,'f','t','2009-09-12 08:23:58','2009-09-12 08:27:11');
INSERT INTO "matches" VALUES(47,1,9,'f','t','2009-09-12 08:27:56','2009-09-12 08:29:43');
INSERT INTO "matches" VALUES(48,1,9,'t','t','2009-09-12 08:29:54','2009-09-12 08:34:30');
INSERT INTO "matches" VALUES(49,1,11,'t','t','2009-09-12 09:59:18','2009-09-12 10:00:27');
INSERT INTO "matches" VALUES(50,1,10,'f','f','2009-09-12 10:05:44','2009-09-12 10:05:44');
INSERT INTO "matches" VALUES(51,1,9,'t','t','2009-09-12 11:20:07','2009-09-12 11:24:24');
INSERT INTO "matches" VALUES(52,1,12,'f','t','2009-09-12 15:21:22','2009-09-12 15:24:07');
CREATE TABLE "actions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "message" text, "image" varchar(255), "executable" text, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "events" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "caption" varchar(255), "message" text, "image" varchar(255), "executable" text, "created_at" datetime, "updated_at" datetime);
INSERT INTO "events" VALUES(1,'Sei proprio un tipo fortunato!','Oggi è il tuo giorno fortunato: hai trovato 10&euro; per terra.','10euro.jpg','current_user.update_attribute(
  :money,
  current_user.money+10
)','2009-09-12 12:43:00','2009-09-12 13:19:40');
INSERT INTO "events" VALUES(2,'Che animo nobile! Sei squattrinato ma offri da bere agli amici.','Ti sei fermato al bar e hai offerto da bere ai tuoi amici. Hai speso 10&euro;.','beers.jpg','if current_user.money >= 10
  current_user.update_attribute(
    :money,
    current_user.money-10
  )
end','2009-09-12 13:13:16','2009-09-12 13:30:41');
INSERT INTO "events" VALUES(3,'I video anni 80 sono spettacolari!','Oggi piove quindi decidi di restare in casa a guardare un video di skate.','vhs.jpg','','2009-09-12 13:29:05','2009-09-12 15:18:57');
INSERT INTO "events" VALUES(4,'5 euro per una vite... ma siamo matti?!?','Skeitando per strada si è rotto il kingpin. Hai speso 5&euro; per comprarne uno nuovo.','kingpin.jpg','if current_user.money >= 5
  current_user.update_attribute(
    :money,
    current_user.money-5
  )
end','2009-09-12 13:39:19','2009-09-12 13:42:08');
INSERT INTO "events" VALUES(5,'Le magliette Thrasher spaccano!!!','Sei andato a trovare il Soda in negozio che ti ha regalato una maglietta nuova.','thrasher.jpg','','2009-09-12 14:10:24','2009-09-12 14:10:24');
INSERT INTO "events" VALUES(6,'Poteva andarti peggio. Stai più attento quando fai flip dai gap.','Ti sei distorto la caviglia. Devi stare fermo una settimana, perdi 20 punti di esperienza.','ambulance.jpg','if current_user.experience >= 20
  current_user.update_attribute(
    :experience,
    current_user.experience-20
  )
end
','2009-09-12 14:36:41','2009-09-12 14:48:19');
INSERT INTO "events" VALUES(7,'Guarda cosa ti tocca fare per tirare su un po'' di soldi...','Dai lezioni di skate ai bambini del quartiere, le mamme ti pagano 10&euro; all''ora per tenerli buoni.','baby.jpg','current_user.update_attribute(
  :money,
  current_user.money+10
)','2009-09-12 15:02:51','2009-09-12 15:08:45');
INSERT INTO "events" VALUES(8,'Che posto fanstastico! Sicuro che non è in Italia.','Hai skeitato nel nuovo skatepark comunale. Guadagni 20 punti di esperienza.','skatepark.jpg','current_user.update_attribute(
  :experience,
  current_user.experience+20
)
current_user.try_to_update','2009-09-12 15:29:28','2009-09-12 19:35:48');
CREATE TABLE "items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" varchar(255), "price" integer, "rank_id" integer, "image" varchar(255), "created_at" datetime, "updated_at" datetime);
INSERT INTO "items" VALUES(1,'viti e bulloni','a testa svasata, per cacciavite a croce',7,1,'bolts.jpg','2009-09-13 09:38:42','2009-09-13 09:38:42');
INSERT INTO "items" VALUES(2,'riser pads','alzano la tavola di 5 mm',7,1,'riser_pads.jpg','2009-09-13 09:39:11','2009-09-13 09:39:17');
INSERT INTO "items" VALUES(3,'distanziali','in acciaio, i cuscinetti durano di più',8,1,'spacer.jpg','2009-09-13 09:39:46','2009-09-13 09:39:51');
INSERT INTO "items" VALUES(4,'skateboard giocattolo','100% plastica',15,1,'old_deck.jpg','2009-09-13 09:40:32','2009-09-13 09:40:32');
INSERT INTO "items" VALUES(5,'kingpin','set 2 kingpin in acciaio temperato',10,1,'kingpins.jpg','2009-09-13 09:40:57','2009-09-13 09:40:57');
INSERT INTO "items" VALUES(6,'truck no brand','set 2 sterzi pesanti',30,1,'truck.jpg','2009-09-13 09:41:24','2009-09-13 09:41:24');
INSERT INTO "items" VALUES(7,'gommini truck','gommini morbidi di ricambio',10,1,'gommini.jpg','2009-09-13 09:41:47','2009-09-13 09:41:47');
INSERT INTO "items" VALUES(8,'tavola no logo','tavola di marca sconosciuta',35,1,'deck.jpg','2009-09-13 09:42:14','2009-09-13 09:42:14');
INSERT INTO "items" VALUES(9,'ruote no logo','4 ruote bianche',20,1,'blank_wheels.jpg','2009-09-13 09:42:41','2009-09-13 09:42:49');
INSERT INTO "items" VALUES(10,'cuscinetti a sfera','ABEC 5, ottima qualità',20,1,'bearings.jpg','2009-09-13 09:43:19','2009-09-13 09:43:26');
INSERT INTO "items" VALUES(11,'truck Indy','classici color oro, Paris Hilton ne porta uno nella borsetta',80,1,'indy_gold.jpg','2009-09-13 09:44:05','2009-09-13 09:44:40');
INSERT INTO "items" VALUES(12,'scarpe Vans','scarpe rigide',55,1,'vans.jpg','2009-09-13 09:45:11','2009-09-13 09:45:11');
INSERT INTO "items" VALUES(13,'ruote Spitfire','route di ottima fattura, set da 4',35,1,'wheels.jpg','2009-09-13 09:45:39','2009-09-13 09:46:49');
INSERT INTO "items" VALUES(14,'scarpe Old Skool','scarpe morbide e grippose',45,1,'oldskool.jpg','2009-09-13 09:46:12','2009-09-13 09:46:40');
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
COMMIT;
