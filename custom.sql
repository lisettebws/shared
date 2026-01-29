-- SYSPREF CHANGES
-- Make passwords easier
UPDATE systempreferences SET value="3" WHERE variable = 'minPasswordLength';
UPDATE systempreferences SET value="" WHERE variable = 'RequireStrongPassword';
-- Turn on advanced editor
UPDATE systempreferences SET value="1" WHERE variable = 'EnableAdvancedCatalogingEditor';
-- Turn on ILL
UPDATE systempreferences SET value="1" WHERE variable = 'ILLModule';
--Turn on all logs
UPDATE systempreferences SET value="1" WHERE variable like '%Log';
--Turn on API
UPDATE systempreferences SET value="1" WHERE variable = 'RESTOAuth2ClientCredentials';
-- Turn on Transport cost matrix
UPDATE systempreferences SET value="1" WHERE variable = 'UseTransportCostMatrix';


-- PATRON CHANGES
-- Update Henry to have my email and be at CPL
UPDATE borrowers SET email="lisette@bywatersolutions.com", branchcode="CPL" WHERE borrowernumber="19";
-- Update koha/koha to have my email
UPDATE borrowers SET email="lisette@bywatersolutions.com" WHERE borrowernumber="51";
--Update edna to be at FPL
UPDATE borrowers SET email="lisette@bywatersolutions.com", branchcode="FPL" WHERE borrowernumber="5";
-- Update Jordan to be at FFL
UPDATE borrowers SET branchcode="FFL" WHERE borrowernumber="45";
--Update Henry's Borrower message preference to do emails
INSERT INTO borrower_message_preferences  (borrower_message_preference_id, message_attribute_id, borrowernumber) VALUES ('10', '1','19');
INSERT INTO borrower_message_preferences  (borrower_message_preference_id, message_attribute_id, days_in_advance, borrowernumber) VALUES ('11','2', '3','19');
INSERT INTO borrower_message_preferences  (borrower_message_preference_id, message_attribute_id, borrowernumber) VALUES ('12', '4', '19' );
INSERT INTO borrower_message_preferences  (borrower_message_preference_id, message_attribute_id, borrowernumber) VALUES ('13', '5', '19' );
INSERT INTO borrower_message_preferences  (borrower_message_preference_id, message_attribute_id, borrowernumber) VALUES ('14', '6', '19' );
INSERT INTO borrower_message_preferences  (borrower_message_preference_id, message_attribute_id, borrowernumber) VALUES ('15', '7', '19' );
INSERT INTO borrower_message_preferences  (borrower_message_preference_id, message_attribute_id, borrowernumber) VALUES ('16', '8', '19' );
INSERT INTO borrower_message_preferences  (borrower_message_preference_id, message_attribute_id, borrowernumber) VALUES ('17', '9', '19' );
INSERT INTO borrower_message_preferences  (borrower_message_preference_id, message_attribute_id, borrowernumber) VALUES ('18', '10', '19' );
INSERT INTO borrower_message_preferences  (borrower_message_preference_id, message_attribute_id, borrowernumber) VALUES ('19', '11', '19' );
INSERT INTO borrower_message_preferences  (borrower_message_preference_id, message_attribute_id, borrowernumber) VALUES ('20', '12', '19' );
INSERT INTO borrower_message_preferences  (borrower_message_preference_id, message_attribute_id, borrowernumber) VALUES ('21', '13', '19' );
INSERT INTO borrower_message_preferences  (borrower_message_preference_id, message_attribute_id, borrowernumber, wants_digest) VALUES ('22', '4', '5', '1' );
INSERT INTO borrower_message_preferences  (borrower_message_preference_id, message_attribute_id, borrowernumber, wants_digest) VALUES ('23', '9', '5', '1' );
INSERT INTO borrower_message_preferences  (borrower_message_preference_id, message_attribute_id, borrowernumber, days_in_advance, wants_digest) VALUES ('24', '2', '5', '2', '1' );
INSERT INTO borrower_message_preferences  (borrower_message_preference_id, message_attribute_id, borrowernumber, wants_digest) VALUES ('25', '1', '5', '1' );
INSERT INTO borrower_message_transport_preferences (borrower_message_preference_id, message_transport_type) VALUES ('10','email');
INSERT INTO borrower_message_transport_preferences (borrower_message_preference_id, message_transport_type) VALUES ('11','email');
INSERT INTO borrower_message_transport_preferences (borrower_message_preference_id, message_transport_type) VALUES ('12','email');
INSERT INTO borrower_message_transport_preferences (borrower_message_preference_id, message_transport_type) VALUES ('13','email');
INSERT INTO borrower_message_transport_preferences (borrower_message_preference_id, message_transport_type) VALUES ('14','email');
INSERT INTO borrower_message_transport_preferences (borrower_message_preference_id, message_transport_type) VALUES ('15','email');
INSERT INTO borrower_message_transport_preferences (borrower_message_preference_id, message_transport_type) VALUES ('16','email');
INSERT INTO borrower_message_transport_preferences (borrower_message_preference_id, message_transport_type) VALUES ('17','email');
INSERT INTO borrower_message_transport_preferences (borrower_message_preference_id, message_transport_type) VALUES ('18','email');
INSERT INTO borrower_message_transport_preferences (borrower_message_preference_id, message_transport_type) VALUES ('19','email');
INSERT INTO borrower_message_transport_preferences (borrower_message_preference_id, message_transport_type) VALUES ('20','email');
INSERT INTO borrower_message_transport_preferences (borrower_message_preference_id, message_transport_type) VALUES ('21','email');
INSERT INTO borrower_message_transport_preferences (borrower_message_preference_id, message_transport_type) VALUES ('22','email');
INSERT INTO borrower_message_transport_preferences (borrower_message_preference_id, message_transport_type) VALUES ('23','email');
INSERT INTO borrower_message_transport_preferences (borrower_message_preference_id, message_transport_type) VALUES ('24','email');
INSERT INTO borrower_message_transport_preferences (borrower_message_preference_id, message_transport_type) VALUES ('25','email');
-- ITEM CHANGES
UPDATE items SET homebranch="FPL", holdingbranch="FPL" WHERE itemnumber="19";
UPDATE items SET homebranch="MPL", holdingbranch="MPL" WHERE itemnumber="27";

-- LIBRARY GROUP CHANGES
--Create local hold group 1 with CPL and FFl in it
INSERT INTO library_groups (title, ft_local_hold_group) VALUES ('group1', '1');
INSERT INTO library_groups (parent_id, branchcode) VALUES ('1', 'CPL');
INSERT INTO library_groups (parent_id, branchcode) VALUES ('1', 'FFL');
--Create local hold group 2 with FPL and FRL in it
INSERT INTO library_groups (title, ft_local_hold_group) VALUES ('group2', '1');
INSERT INTO library_groups (parent_id, branchcode) VALUES ('4', 'FPL');
INSERT INTO library_groups (parent_id, branchcode) VALUES ('4', 'FRL');

-- HOLD CHANGES
-- Add reserves for Henry, Edna, Jordan, and Nicole to X Power Tools
INSERT INTO reserves (borrowernumber, reservedate, biblionumber, branchcode) VALUES ('45', '2025-04-29', '6', 'FFL');
INSERT INTO reserves (borrowernumber, reservedate, biblionumber, branchcode) VALUES ('29', '2025-04-29', '6', 'FRL');
INSERT INTO reserves (borrowernumber, reservedate, biblionumber, branchcode) VALUES ('5', '2025-04-29', '6', 'FPL');
INSERT INTO reserves (borrowernumber, reservedate, biblionumber, branchcode) VALUES ('19', '2025-04-29', '6', 'CPL');

INSERT INTO reserves (borrowernumber, reservedate, biblionumber, branchcode) VALUES ('5', '2025-08-14', '9', 'FPL');
INSERT INTO reserves (borrowernumber, reservedate, biblionumber, branchcode) VALUES ('19', '2025-08-14', '9', 'CPL');
INSERT INTO reserves (borrowernumber, reservedate, biblionumber, branchcode) VALUES ('29', '2025-08-14', '9', 'PVL');

-- ILL CHANGES
-- Make a default illrequest
INSERT INTO illrequests (illrequest_id,borrowernumber,biblio_id,branchcode,status,placed,backend) VALUES ('123','16','6','CPL','RequestReceived','2025-04-29','Standard');

-- TRANSPORT COST CHANGES
-- Populate the transport cost matrix
INSERT INTO transport_cost (frombranch, tobranch, cost, disable_transfer) VALUES ('CPL', 'FFL', "1.00", "0");
INSERT INTO transport_cost (frombranch, tobranch, cost, disable_transfer) VALUES ('CPL', 'MPL', "1.00", "0");
INSERT INTO transport_cost (frombranch, tobranch, cost, disable_transfer) VALUES ('FFL', 'CPL', "1.00", "0");
INSERT INTO transport_cost (frombranch, tobranch, cost, disable_transfer) VALUES ('FFL', 'MPL', "1.00", "0");
INSERT INTO transport_cost (frombranch, tobranch, cost, disable_transfer) VALUES ('FPL', 'CPL', "1.00", "0");
INSERT INTO transport_cost (frombranch, tobranch, cost, disable_transfer) VALUES ('FPL', 'MPL', "1.00", "0");
INSERT INTO transport_cost (frombranch, tobranch, cost, disable_transfer) VALUES ('MPL', 'FFL', "1.00", "0");
INSERT INTO transport_cost (frombranch, tobranch, cost, disable_transfer) VALUES ('MPL', 'CPL', "1.00", "0");
INSERT INTO transport_cost (frombranch, tobranch, cost, disable_transfer) VALUES ('MPL', 'PVL', "4.00", "0");
INSERT INTO transport_cost (frombranch, tobranch, cost, disable_transfer) VALUES ('PVL', 'MPL', "4.00", "0");
