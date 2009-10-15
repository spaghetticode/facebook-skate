class AddData < ActiveRecord::Migration
  def self.up
    execute %q{INSERT INTO items VALUES(1,'viti e bulloni','a testa svasata, per cacciavite a croce',7,1,'bolts.jpg','2009-09-13 09:38:42','2009-09-13 21:22:00',3,'stamina')}
    execute %q{INSERT INTO items VALUES(2,'riser pads','alzano la tavola di 5 mm',7,2,'riser_pads.jpg','2009-09-13 09:39:11','2009-09-13 21:22:00',5,'stamina')}
    execute %q{INSERT INTO items VALUES(3,'distanziali','in acciaio, usandoli tuoi cuscinetti dureranno di più',8,2,'spacer.jpg','2009-09-13 09:39:46','2009-09-13 21:09:12',3,'dexterity')}
    execute %q{INSERT INTO items VALUES(4,'skateboard giocattolo','100% plastica',15,1,'old_deck.jpg','2009-09-13 09:40:32','2009-09-13 21:08:38',5,'dexterity')}
    execute %q{INSERT INTO items VALUES(5,'kingpin','set 2 kingpin in acciaio temperato',10,1,'kingpins.jpg','2009-09-13 09:40:57','2009-09-13 21:08:51',3,'dexterity')}
    execute %q{INSERT INTO items VALUES(6,'truck no logo','set 2 sterzi pesanti',30,2,'truck.jpg','2009-09-13 09:41:24','2009-09-13 21:09:23',7,'dexterity')}
    execute %q{INSERT INTO items VALUES(7,'gommini truck','gommini morbidi di ricambio',10,3,'gommini.jpg','2009-09-13 09:41:47','2009-09-13 21:09:47',4,'dexterity')}
    execute %q{INSERT INTO items VALUES(8,'tavola no logo','tavola di marca sconosciuta',35,3,'deck.jpg','2009-09-13 09:42:14','2009-09-13 21:09:54',10,'dexterity')}
    execute %q{INSERT INTO items VALUES(9,'ruote no logo','4 ruote bianche',20,2,'blank_wheels.jpg','2009-09-13 09:42:41','2009-09-13 21:22:00',7,'stamina')}
    execute %q{INSERT INTO items VALUES(10,'cuscinetti a sfera','ABEC 5, ottima qualità',20,4,'bearings.jpg','2009-09-13 09:43:19','2009-09-13 21:22:00',15,'stamina')}
    execute %q{INSERT INTO items VALUES(11,'truck Indy','classici color oro, Paris Hilton ne porta uno nella borsetta',80,4,'indy_gold.jpg','2009-09-13 09:44:05','2009-09-13 21:22:00',15,'stamina')}
    execute %q{INSERT INTO items VALUES(12,'scarpe Vans','scarpe rigide',55,4,'vans.jpg','2009-09-13 09:45:11','2009-09-13 21:22:00',20,'stamina')}
    execute %q{INSERT INTO items VALUES(13,'ruote Spitfire','route di ottima fattura, set da 4',35,3,'wheels.jpg','2009-09-13 09:45:39','2009-09-13 21:10:05',10,'dexterity')}
    execute %q{INSERT INTO items VALUES(14,'scarpe Old Skool','scarpe morbide e grippose',45,4,'oldskool.jpg','2009-09-13 09:46:12','2009-09-13 21:10:58',20,'dexterity')}
    
    execute %q{INSERT INTO messages VALUES(1,'Da buon concrete lover e pool rider oggi hai scelto di allenarti qui.','bowls.jpg','training','2009-09-13 12:25:43','2009-09-13 12:54:30')}
    execute %q{INSERT INTO messages VALUES(2,'Questo è uno dei tuoi posti preferiti per allenarti.','pyramid.jpg','training','2009-09-13 12:30:12','2009-09-13 12:34:20')}
    execute %q{INSERT INTO messages VALUES(3,'Fare street in mezzo al traffico è uno spasso.','street.jpg','training','2009-09-13 12:35:29','2009-09-13 12:54:38')}
    execute %q{INSERT INTO messages VALUES(4,'Stufo dei soliti posti oggi ti sei allenato sugli handrail.','handrail.jpg','training','2009-09-13 12:39:35','2009-09-13 12:39:35')}
    execute %q{INSERT INTO messages VALUES(5,'Mi raccomando metti le protezioni!','vert.jpg','training','2009-09-13 12:43:08','2009-09-13 12:43:41')}
    execute %q{INSERT INTO messages VALUES(6,'Downhill a paletta divertimento assicurato!','downhill.jpg','training','2009-09-13 12:46:33','2009-09-13 12:46:40')}

    execute %q{INSERT INTO events VALUES(1,'Sei proprio un tipo fortunato!','Oggi è il tuo giorno fortunato: hai trovato 10&euro; per terra.','10euro.jpg','current_user.update_attribute(
        :money,
        current_user.money+10
      )','2009-09-12 12:43:00','2009-09-12 13:19:40')}    
    execute %q{INSERT INTO events VALUES(2,'Che animo nobile! Sei squattrinato ma offri lo stesso da bere agli amici.','Ti sei fermato al bar e hai offerto da bere ai tuoi amici. Hai speso 10&euro;.','beers.jpg','if current_user.money >= 10
        current_user.update_attribute(
          :money,
          current_user.money-10
        )
      end','2009-09-12 13:13:16','2009-09-13 10:00:39')}     
    execute %q{INSERT INTO events VALUES(3,'I video anni 80 sono spettacolari!','Oggi piove quindi decidi di restare in casa a guardare un video di skate. Guadagni 10 punti energia.','vhs.jpg','current_user.update_attribute(
        :stamina, current_user.stamina+10
      )','2009-09-12 13:29:05','2009-09-13 09:50:45')}     
    execute %q{INSERT INTO events VALUES(4,'5 euro per una vite... ma siamo matti?!?','Skeitando per strada ti si è rotto il kingpin. Hai speso 5&euro; per comprarne uno nuovo.','kingpin.jpg','if current_user.money >= 5
        current_user.update_attribute(
          :money,
          current_user.money-5
        )
      end','2009-09-12 13:39:19','2009-09-13 10:01:21')}     
    execute %q{INSERT INTO events VALUES(5,'Le magliette Thrasher spaccano!!!','Sei passato in negozio e ti hanno regalato una maglietta nuova. Ora ti senti carico, guadagni 10 punti energia.','thrasher.jpg','current_user.update_attribute(
        :stamina,
        current_user.stamina+10
      )','2009-09-12 14:10:24','2009-09-13 09:53:00')}      
    execute %q{INSERT INTO events VALUES(6,'Poteva andarti peggio. Stai più attento quando fai flip dai gap.','Ti sei distorto la caviglia. Devi stare fermo una settimana, perdi 10 punti di esperienza e 10 punti energia.','ambulance.jpg','if current_user.experience >= 10 and current_user.stamina >= 10 
        current_user.update_attributes(
          :experience => current_user.experience-10,
          :stamina => current_user.stamina-10
        )
      end
      ','2009-09-12 14:36:41','2009-09-13 09:54:26')}
    execute %q{INSERT INTO events VALUES(7,'Guarda cosa ti tocca fare per tirare su un po'' di soldi...','Dai lezioni di skate ai bambini del quartiere, le mamme ti pagano 10&euro; all''ora per tenerli buoni.','baby.jpg','current_user.update_attribute(
        :money,
        current_user.money+10
      )','2009-09-12 15:02:51','2009-09-12 15:08:45')}
    execute %q{  INSERT INTO events VALUES(8,'Che posto fanstastico! Sicuro che non è in Italia.','Hai skeitato nel nuovo skatepark comunale. Guadagni 10 punti di esperienza e destrezza.','skatepark.jpg','current_user.update_attributes(
        :experience => current_user.experience+10,
        :dexterity => current_user.dexterity+10
      )
      current_user.try_to_update','2009-09-12 15:29:28','2009-09-14 21:10:46')}
  end

  def self.down
  end
end
