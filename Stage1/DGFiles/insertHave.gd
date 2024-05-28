
[General]
Version=1

[Preferences]
Username=
Password=2682
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=HAVE
Count=400

[Record]
Name=SOLDIER_ID_
Type=NUMBER
Size=
Data=List(select soldier_id_ from soldiers)
Master=

[Record]
Name=PROJECT_ID
Type=NUMBER
Size=
Data=List(select project_id from projects)
Master=

