CREATE TABLE IF NOT EXISTS Students (
  Name varchar(255) NOT NULL,
  Age int,
  Mobile varchar(10) NOT NULL,

  ADD CONSTRAINT PK_Student_Mobile PRIMARY KEY (Mobile)
);

CREATE TABLE IF NOT EXISTS Staff (
  Name varchar(255) NOT NULL,
  Mobile varchar(10) NOT NULL,

  ADD CONSTRAINT PK_Staff_Mobile PRIMARY KEY (Mobile)
);

CREATE TABLE IF NOT EXISTS StaffSubjects (
  Name varchar(255) NOT NULL,
  Subject varchar(50) NOT NULL,

  ADD CONSTRAINT PK_Staff_Subjects PRIMARY KEY (Name, Subject),

  ADD CONSTRAINT FOREIGN KEY(Name) REFERENCES Staff(Name)
);

CREATE TABLE IF NOT EXISTS Lessons (
  Day varchar(10) NOT NULL,
  StartTime time NOT NULL,
  Subject varchar(50),

  ADD CONSTRAINT PK_Lesson_Time PRIMARY KEY (Day, StartTime)
);

CREATE TABLE IF NOT EXISTS LessonStaff (
  Day varchar(10) NOT NULL,
  StartTime time NOT NULL,
  Name varchar(255) NOT NULL,

  ADD CONSTRAINT PK_Lesson_Staff PRIMARY KEY (Day, StartTime, Staff),

  ADD CONSTRAINT FOREIGN KEY(Day) REFERENCES Lessons(Day),
  ADD CONSTRAINT FOREIGN KEY(StartTime) REFERENCES Lessons(StartTime),
  ADD CONSTRAINT FOREIGN KEY(Name) REFERENCES Staff(Name)
);
