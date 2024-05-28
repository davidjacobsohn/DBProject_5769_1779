
[General]
Version=1

[Preferences]
Username=
Password=2828
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=SALARIES
Count=400

[Record]
Name=SALARY_ID_
Type=NUMBER
Size=
Data=Sequence(10000, 50)
Master=

[Record]
Name=AMOUNT_
Type=NUMBER
Size=
Data=Random(3250, 13200)
Master=

[Record]
Name=PAYMENT_DATE_
Type=DATE
Size=
Data=Random(01/01/1970, 27/05/2024)
Master=

