CREATE TABLE IF NOT EXISTS Students (
  Name varchar(50) NOT NULL,
  Age int,
  Mobile varchar(10) NOT NULL,

  ADD CONSTRAINT PK_Student_Mobile PRIMARY KEY (Mobile)
);

CREATE TABLE IF NOT EXISTS Staff (
  Name varchar(50) NOT NULL,
  Mobile varchar(10) NOT NULL,

  ADD CONSTRAINT PK_Staff_Mobile PRIMARY KEY (Mobile)
);

CREATE TABLE IF NOT EXISTS StaffSubjects (
  Name varchar(50) NOT NULL,
  Subject varchar(10) NOT NULL,

  ADD CONSTRAINT PK_Staff_Subjects PRIMARY KEY (Name, Subject),

  ADD CONSTRAINT FOREIGN KEY(Name) REFERENCES Staff(Name)
);

CREATE TABLE IF NOT EXISTS Lessons (
  Day varchar(10) NOT NULL,
  StartTime time NOT NULL,
  Subject varchar(10),

  ADD CONSTRAINT PK_Lesson_Time PRIMARY KEY (Day, StartTime)
);

CREATE TABLE IF NOT EXISTS LessonStaff (
  Day varchar(10) NOT NULL,
  StartTime time NOT NULL,
  StaffMember varchar(50) NOT NULL,

  ADD CONSTRAINT PK_Lesson_Staff PRIMARY KEY (Day, StartTime, StaffMember),

  ADD CONSTRAINT FOREIGN KEY(Day) REFERENCES Lessons(Day),
  ADD CONSTRAINT FOREIGN KEY(StartTime) REFERENCES Lessons(StartTime),
  ADD CONSTRAINT FOREIGN KEY(StaffMember) REFERENCES Staff(Name)
);

CREATE TABLE IF NOT EXISTS LessonAttendees (
  Day varchar(10) NOT NULL,
  StartTime time NOT NULL,
  Student varchar(50) NOT NULL,

  ADD CONSTRAINT PK_Lesson_Students PRIMARY KEY (Day, StartTime, Student),

  ADD CONSTRAINT FOREIGN KEY(Day) REFERENCES Lessons(Day),
  ADD CONSTRAINT FOREIGN KEY(StartTime) REFERENCES Lessons(StartTime),
  ADD CONSTRAINT FOREIGN KEY(Student) REFERENCES Students(Name)
);
