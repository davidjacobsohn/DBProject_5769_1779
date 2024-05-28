
[General]
Version=1

[Preferences]
Username=
Password=2463
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=TRAININGS_
Count=400

[Record]
Name=TRAINING_ID_
Type=NUMBER
Size=
Data=Sequence(100, 13)
Master=

[Record]
Name=TRAINING_NAME_
Type=VARCHAR2
Size=100
Data=List('Krav Maga Training', 'Advanced Weapon Training', 'Combat Fitness Training',
='Urban Warfare Training',
='Tactical Driving Training',
='Rescue and Evacuation Training',
='Firefighting Training',
='Parachuting Training',
='Land Navigation Training',
='Sniper Shooting Training',
='Armored Vehicle Operation Training',
='Biological Warfare Training',
='Reconnaissance and Defense Training',
='Medical Evacuation Training',
='Chemical Warfare Training',
='Communication and Signal Training',
='Under Fire Rescue Training',
='Observation and Defense Training',
='Combat Management Training',
='Open Field Warfare Training',
='Rain Condition Warfare Training',
='Heat Condition Warfare Training',
='Heavy Weapon Usage Training',
='Grenade Launcher Operation Training',
='Tank Operation Training',
='APC Operation Training',
='Anti-Terrorism Training',
='Collapsed Structure Rescue Training',
='Complex Terrain Combat Training',
='Naval Warfare Training')
Master=

[Record]
Name=START_DATE_
Type=DATE
Size=
Data=Random(01/01/2022, 30/05/2022)
Master=

[Record]
Name=END_DATE_
Type=DATE
Size=
Data=Random(01/06/2022, 30/12/2022)
Master=

