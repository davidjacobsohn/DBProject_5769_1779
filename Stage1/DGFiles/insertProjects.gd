
[General]
Version=1

[Preferences]
Username=
Password=2642
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=PROJECTS
Count=400

[Record]
Name=PROJECT_ID
Type=NUMBER
Size=
Data=Sequence(2000, 58)
Master=

[Record]
Name=PROJECT_NAME
Type=VARCHAR2
Size=100
Data=Elements.Symbol
Master=

[Record]
Name=START_DATE
Type=DATE
Size=
Data=Random(01/01/2021, 30/05/2022)
Master=

[Record]
Name=END_DATE
Type=DATE
Size=
Data=Random(01/06/2022, 30/04/2024)
Master=

