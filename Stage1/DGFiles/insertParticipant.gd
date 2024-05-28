
[General]
Version=1

[Preferences]
Username=
Password=2917
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=PARTICIPANT
Count=400

[Record]
Name=SOLDIER_ID_
Type=NUMBER
Size=
Data=List(select Soldier_id_ from Soldiers)
Master=

[Record]
Name=TRAINING_ID_
Type=NUMBER
Size=
Data=List(select Training_id_ from Trainings_)
Master=

