INSERT INTO usertype (usertype_id, usertype) VALUES ('REGISTERED', 'REGISTERED'); 
INSERT INTO usertype (usertype_id, usertype) VALUES ('RELIABLE', 'RELIABLE'); 
INSERT INTO usertype (usertype_id, usertype) VALUES ('SUSPICIOUS', 'SUSPICIOUS'); 
INSERT INTO usertype (usertype_id, usertype) VALUES ('OWING', 'OWING');

INSERT INTO wallet (wallet_id, amount)
            VALUES ('HU-11111111', 12000.22);

INSERT INTO wallet (wallet_id, amount)
            VALUES ('HU-11111112', 99000.11);

INSERT INTO wallet (wallet_id, amount)
            VALUES ('UK-11111111', 99011.44);

INSERT INTO wallet (wallet_id, amount)
            VALUES ('US-11111111', 11111.55);

INSERT INTO wallet (wallet_id, amount)
            VALUES ('HU-11111111', 12000.22);

INSERT INTO wallet (wallet_id, amount)
            VALUES ('HU-11111112', 99000.11);

INSERT INTO wallet (wallet_id, amount)
            VALUES ('UK-11111111', 99011.44);

INSERT INTO wallet (wallet_id, amount)
            VALUES ('US-11111111', 11111.55);

INSERT INTO appuser (appuser_id, username, first_name, last_name, appuser_wallet_id, password, appuser_usertype_id)
            VALUES ('2017-03-12-0000001', 'testUser11','Kis','Zoltán','HU-11111111','H@#1', 'REGISTERED');
INSERT INTO appuser (appuser_id, username, first_name, last_name, appuser_wallet_id, password, appuser_usertype_id)
            VALUES ('2017-03-12-0000002', 'testUser22','Nagy','Béla','HU-11111112','H@#2', 'REGISTERED');
INSERT INTO appuser (appuser_id, username, first_name, last_name, appuser_wallet_id, password, appuser_usertype_id)
            VALUES ('2017-03-12-0000003', 'testUser33','Arthur','King','UK-11111111','H@#3', 'REGISTERED');
INSERT INTO appuser (appuser_id, username, first_name, last_name, appuser_wallet_id, password, appuser_usertype_id)
            VALUES ('2017-03-12-0000004', 'testUser44','Nicolas','Big','US-11111111','H@#4', 'REGISTERED');

