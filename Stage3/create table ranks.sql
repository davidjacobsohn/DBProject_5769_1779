CREATE TABLE Ranks (
  Rank_ID NUMBER PRIMARY KEY,
  Rank_Name VARCHAR2(50),
  Next_Rank_ID NUMBER
);


INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (1, 'Private', 2);
INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (2, 'Corporal', 3);
INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (3, 'Sergeant', 4);
INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (4, 'Staff Sergeant', 5);
INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (5, 'Sergeant First Class', 6);
INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (6, 'First Sergeant', 7);
INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (7, 'Master Sergeant', 8);
INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (8, 'Sergeant Major', 9);
INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (9, 'Warrant Officer', 10);
INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (10, 'Chief Warrant Officer', 11);
INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (11, 'Second Lieutenant', 12);
INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (12, 'First Lieutenant', 13);
INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (13, 'Captain', 14);
INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (14, 'Major', 15);
INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (15, 'Lieutenant Colonel', 16);
INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (16, 'Colonel', 17);
INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (17, 'Brigadier General', 18);
INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (18, 'Major General', 19);
INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (19, 'Lieutenant General', 20);
INSERT INTO Ranks (Rank_ID, Rank_Name, Next_Rank_ID) VALUES (20, 'General', NULL);
