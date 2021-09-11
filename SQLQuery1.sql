Use base02
Go
Create table Discipline
(
IDName int primary key identity (1,1) not null,
NameDiscipline varchar(50),
)
Create table Teacher
(
NumberTeacher int primary key identity (1,1) not null,
FamilyTeacher varchar(50),
NameTeacher varchar(50),
PatronymicTeacher varchar(50),
Phone varchar(20),
Email varchar(100),
Discipline int,
Foreign key (Discipline) references Discipline(IDName)
)

Create table [Group]
(
IDGroup int primary key,
NameGroup varchar(100),
)

Create table Student
(
StudentBook int primary key not null,
FamilyStudent varchar(50),
NameStudent varchar(50),
PatronymicStudent varchar(50),
[Group] int,
Foreign key ([Group]) references [Group](IDGroup),
Phone varchar(20)
)

Create table Room
(
IDRoom int primary key not null,
NameRoom varchar(100)
)

Create table CallTable
(
IDCallTable int primary key identity(1,1) not null,
[Time] time not null,
)

Create table TimeTable 
(
IDTimeTable int primary key identity(1,1) not null,
Discipline int,
Foreign key (Discipline) references Discipline(IDName),
[Date] date,
Pair int,
Check (Pair >=1 and Pair <=8),
Room int,
Foreign key (Room) references Room(IDRoom),
CallTable int,
Foreign key (CallTable) references CallTable(IDCallTable),
[Group] int,
Foreign key ([Group]) references [Group](IDGroup),
Subgroup int,
Check(Subgroup =1 and Subgroup =2 )
)

Create table Magazine
(
IDAppraisal int primary key identity(1,1) not null,
Student int not null,
Foreign key (Student) references Student(StudentBook),
Appraisal varchar(15),
Check (Appraisal >= 2 and Appraisal <=5 and Appraisal = 'í' and Appraisal = 'á'),
TimeTable int not null,
Foreign key (TimeTable) references TimeTable(IDTimeTable)
)
Go