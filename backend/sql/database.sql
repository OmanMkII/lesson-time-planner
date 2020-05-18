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
  Subject varchar(255) NOT NULL,

  ADD CONSTRAINT PK_Staff_Subjects PRIMARY KEY (Name, Subject),

  ADD CONSTRAINT FOREIGN KEY(Name) REFERENCES Staff(Name)
);

CREATE TABLE IF NOT EXISTS Lessons (
  Lesson datetime NOT NULL,
  Subject varchar(255),

  ADD CONSTRAINT PK_Lesson_Time PRIMARY KEY (Lesson)
);

CREATE TABLE IF NOT EXISTS LessonStaff (
  Lesson datetime NOT NULL,
  Name varchar(255) NOT NULL,

  ADD CONSTRAINT PK_Lesson_Staff PRIMARY KEY (Lesson, Staff),

  ADD CONSTRAINT FOREIGN KEY(Lesson) REFERENCES Lessons(Lesson),
  ADD CONSTRAINT FOREIGN KEY(Name) REFERENCES Staff(Name)
);
