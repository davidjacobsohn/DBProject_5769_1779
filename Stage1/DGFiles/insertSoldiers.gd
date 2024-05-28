
[General]
Version=1

[Preferences]
Username=
Password=2168
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=SOLDIERS
Count=400

[Record]
Name=SOLDIER_ID_
Type=NUMBER
Size=
Data=Sequence(10000, 58)
Master=

[Record]
Name=FIRST_NAME_
Type=VARCHAR2
Size=100
Data=FirstName
Master=

[Record]
Name=LAST_NAME_
Type=VARCHAR2
Size=100
Data=LastName
Master=

[Record]
Name=BIRTH_DATE_
Type=DATE
Size=
Data=Random(01/01/1965, 30/12/2005)
Master=

[Record]
Name=RANK_
Type=VARCHAR2
Size=100
Data=List('Private', 'Corporal', 'Sergeant', 'Staff Sergeant', 'Sergeant First Class', 'Master Sergeant', 'First Sergeant', 'Sergeant Major', 'Second Lieutenant', 'Lieutenant', 'Captain', 'Major', 'Lieutenant Colonel', 'Colonel', 'Brigadier General', 'Major General', 'Lieutenant General', 'General', 'Chief Warrant Officer', 'Warrant Officer'
=)
Master=

[Record]
Name=UNIT_ID_
Type=NUMBER
Size=
Data=List(select unit_id_ from units)
Master=

[Record]
Name=SALARY_ID_
Type=NUMBER
Size=
Data=List(select Salary_id_ from Salaries)
Master=

[Record]
Name=ROLE_ID_
Type=NUMBER
Size=
Data=List(select Role_id_ from roles_)
Master=

