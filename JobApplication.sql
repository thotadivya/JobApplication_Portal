Create database jobApplicationPortal;

use jobApplicationPortal;

-- Admin Table
CREATE TABLE Admin (
    AdminID INT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL
);
-- Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);
-- Industry Table
CREATE TABLE Industry (
    IndustryID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

-- Company Table
CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    IndustryID INT,
    FOREIGN KEY (IndustryID) REFERENCES Industry(IndustryID)
);
-- Job_Post Table
CREATE TABLE Job_Post (
    JobPostID INT PRIMARY KEY,
    CompanyID INT,
    JobTitle VARCHAR(255) NOT NULL,
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);


-- Applied JobPosts Table
CREATE TABLE Applied_JobPosts (
    ApplicationID INT PRIMARY KEY,
    UserID INT,
    JobPostID INT,
    ApplicationDate DATE,
    Status VARCHAR(50),
    Notes TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (JobPostID) REFERENCES Job_Post(JobPostID)
);


-- Company Reviews Table
CREATE TABLE Company_Reviews (
    ReviewID INT PRIMARY KEY,
    CompanyID INT,
    UserID INT,
    Rating DECIMAL(3, 2),
    ReviewText TEXT,
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- States Table
CREATE TABLE States (
    StateID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

-- Districts or Cities Table
CREATE TABLE Districts_or_Cities (
    DistrictCityID INT PRIMARY KEY,
    StateID INT,
    Name VARCHAR(255) NOT NULL,
    FOREIGN KEY (StateID) REFERENCES States(StateID)
);

-- Education Table
CREATE TABLE Education (
    EducationID INT PRIMARY KEY,
    UserID INT,
    Institution VARCHAR(255),
    Degree VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


-- Job_Type Table
CREATE TABLE Job_Type (
    JobTypeID INT PRIMARY KEY,
    TypeName VARCHAR(255) NOT NULL
);

-- Saved JobPosts Table
CREATE TABLE Saved_JobPosts (
    SavedJobID INT PRIMARY KEY,
    UserID INT,
    JobPostID INT,
    SaveDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (JobPostID) REFERENCES Job_Post(JobPostID)
);


-- Job Application History Table
CREATE TABLE Job_Application_History (
    ApplicationHistoryID INT PRIMARY KEY,
    UserID INT,
    JobPostID INT,
    ApplicationDate DATE,
    Status VARCHAR(50),
    Notes TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (JobPostID) REFERENCES Job_Post(JobPostID)
);

-- Job Post Skills Table
CREATE TABLE Job_Post_Skills (
    JobPostSkillsID INT PRIMARY KEY,
    JobPostID INT,
    SkillID INT,
    SkillLevel VARCHAR(50),
    FOREIGN KEY (JobPostID) REFERENCES Job_Post(JobPostID),
    FOREIGN KEY (SkillID) REFERENCES Skills(SkillID)
);

CREATE TABLE Interviews (
    InterviewID INT PRIMARY KEY,
    ApplicationID INT,
    InterviewDate DATE,
    InterviewType VARCHAR(255),
    InterviewNotes TEXT,
    FOREIGN KEY (ApplicationID) REFERENCES Job_Application_History(ApplicationHistoryID)
);

-- Interview Feedback Table
CREATE TABLE Interview_Feedback (
    InterviewFeedbackID INT PRIMARY KEY,
    InterviewID INT,
    UserID INT,
    FeedbackDate DATE,
    FeedbackText TEXT,
    Rating DECIMAL(3, 2),
    FOREIGN KEY (InterviewID) REFERENCES Interviews(InterviewID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- User Notifications Table
CREATE TABLE User_Notifications (
    NotificationID INT PRIMARY KEY,
    UserID INT,
    NotificationType VARCHAR(255),
    Message TEXT,
    Timestamp TIMESTAMP,
    IsRead BOOLEAN,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


-- Skills Table
CREATE TABLE Skills (
    SkillID INT PRIMARY KEY,
    SkillName VARCHAR(255) NOT NULL,
    SkillDescription TEXT,
    SkillLevel VARCHAR(50)
);





-- INSERT QUERIES
INSERT INTO Admin (AdminID, Username, Password)
VALUES
    (1, 'admin1', 'password1'),
    (2, 'admin2', 'password2'),
    (3, 'admin3', 'password3'),
    (4, 'admin4', 'password4'),
    (5, 'admin5', 'password5'),
    (6, 'admin6', 'password6');
    
INSERT INTO Users (UserID, FirstName, LastName, Email)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com'),
    (3, 'Michael', 'Johnson', 'michael.johnson@example.com'),
    (4, 'Emily', 'Brown', 'emily.brown@example.com'),
    (5, 'David', 'Lee', 'david.lee@example.com'),
    (6, 'Sarah', 'Wilson', 'sarah.wilson@example.com');

INSERT INTO States (StateID, Name)
VALUES
    (1, 'California'),
    (2, 'New York'),
    (3, 'Texas');

INSERT INTO Industry (IndustryID, Name)
VALUES
    (1, 'Technology'),
    (2, 'Finance'),
    (3, 'Healthcare');

INSERT INTO Company (CompanyID, Name, IndustryID)
VALUES
    (1, 'Tech Innovators Inc.', 1),
    (2, 'Finance Experts Ltd.', 2),
    (3, 'HealthCare Solutions LLC', 3),
    (4, 'Data Insights Co.', 1),
    (5, 'Marketing Producers Corp.', 2),
    (6, 'HR Solutions Group', 3);

INSERT INTO Job_Post (JobPostID, CompanyID, JobTitle)
VALUES
    (1, 1, 'Software Engineer'),
    (2, 2, 'Financial Analyst'),
    (3, 3, 'Registered Nurse'),
    (4, 4, 'Data Scientist'),
    (5, 5, 'Marketing Manager'),
    (6, 6, 'HR Coordinator');

INSERT INTO Applied_JobPosts (ApplicationID, UserID, JobPostID, ApplicationDate, Status, Notes)
VALUES
    (1, 1, 1, '2023-01-15', 'Pending', 'Application under review.'),
    (2, 2, 2, '2023-02-20', 'Accepted', 'Scheduled for an interview.'),
    (3, 3, 3, '2023-03-10', 'Rejected', 'Position filled.'),
    (4, 4, 4, '2023-04-05', 'Pending', 'Awaiting HR response.'),
    (5, 5, 5, '2023-05-12', 'Accepted', 'Interview completed.'),
    (6, 6, 6, '2023-06-25', 'Pending', 'Application under review.');

INSERT INTO Company_Reviews (ReviewID, CompanyID, UserID, Rating, ReviewText)
VALUES
    (1, 1, 1, 4.5, 'Great company to work for.'),
    (2, 2, 2, 3.8, 'Decent workplace with room for improvement.'),
    (3, 3, 3, 4.2, 'Excellent culture and management.'),
    (4, 4, 4, 3.5, 'Average experience, but good benefits.'),
    (5, 5, 5, 4.7, 'Top-notch company with competitive pay.'),
    (6, 6, 6, 3.0, 'Needs improvement in work-life balance.');

INSERT INTO Districts_or_Cities (DistrictCityID, StateID, Name)
VALUES
    (1, 1, 'San Francisco'),
    (2, 2, 'New York City'),
    (3, 3, 'Houston'),
    (4, 1, 'Los Angeles'),
    (5, 2, 'Chicago'),
    (6, 3, 'Dallas');

INSERT INTO Education (EducationID, UserID, Institution, Degree)
VALUES
    (1, 1, 'Stanford University', 'Bachelor of Science'),
    (2, 2, 'Harvard Business School', 'Master of Business Administration'),
    (3, 3, 'University of Texas', 'Bachelor of Arts'),
    (4, 4, 'High School XYZ', 'High School Diploma'),
    (5, 5, 'Massachusetts Institute of Technology', 'Master of Science'),
    (6, 6, 'University of Chicago', 'Bachelor of Business Administration');



INSERT INTO Job_Type (JobTypeID, TypeName)
VALUES
    (1, 'Full-Time'),
    (2, 'Part-Time'),
    (3, 'Contract'),
    (4, 'Internship');

INSERT INTO Saved_JobPosts (SavedJobID, UserID, JobPostID, SaveDate)
VALUES
    (1, 1, 1, '2023-01-20'),
    (2, 2, 2, '2023-02-25'),
    (3, 3, 3, '2023-03-15'),
    (4, 4, 4, '2023-04-10'),
    (5, 5, 5, '2023-05-17'),
    (6, 6, 6, '2023-06-30');


INSERT INTO Job_Application_History (ApplicationHistoryID, UserID, JobPostID, ApplicationDate, Status, Notes)
VALUES
    (1, 1, 1, '2023-01-15', 'Pending', 'Application under review.'),
    (2, 2, 2, '2023-02-20', 'Accepted', 'Scheduled for an interview.'),
    (3, 3, 3, '2023-03-10', 'Rejected', 'Position filled.'),
    (4, 4, 4, '2023-04-05', 'Pending', 'Awaiting HR response.'),
    (5, 5, 5, '2023-05-12', 'Accepted', 'Interview completed.'),
    (6, 6, 6, '2023-06-25', 'Pending', 'Application under review.');

INSERT INTO Skills (SkillID, SkillName, SkillDescription, SkillLevel)
VALUES
    (1, 'Java Programming', 'Object-oriented programming language', 'Intermediate'),
    (2, 'Financial Analysis', 'Analyzing financial data', 'Advanced'),
    (3, 'Nursing Skills', 'Medical care skills', 'Expert'),
    (4, 'Data Analysis', 'Analyzing data sets', 'Intermediate'),
    (5, 'Marketing Strategy', 'Strategic marketing planning', 'Advanced'),
    (6, 'HR Management', 'Human resource management', 'Expert');
    
INSERT INTO Job_Post_Skills (JobPostSkillsID, JobPostID, SkillID, SkillLevel)
VALUES
    (1, 1, 1, 'Intermediate'),
    (2, 2, 2, 'Advanced'),
    (3, 3, 3, 'Expert'),
    (4, 4, 4, 'Intermediate'),
    (5, 5, 5, 'Advanced'),
    (6, 6, 6, 'Expert');

INSERT INTO Interviews (InterviewID, ApplicationID, InterviewDate, InterviewType, InterviewNotes)
VALUES
    (1, 1, '2023-01-30', 'Phone Interview', 'Candidate performed well.'),
    (2, 2, '2023-02-25', 'In-Person Interview', 'Detailed discussion on qualifications.'),
    (3, 3, '2023-03-15', 'Video Interview', 'Positive interaction with the applicant.'),
    (4, 4, '2023-04-20', 'Technical Interview', 'Average technical skills.'),
    (5, 5, '2023-05-27', 'On-Site Interview', 'Strong presentation skills.'),
    (6, 6, '2023-06-10', 'Phone Interview', 'Needs improvement in communication.');


INSERT INTO Interview_Feedback (InterviewFeedbackID, InterviewID, UserID, FeedbackDate, FeedbackText, Rating)
VALUES
    (1, 1, 1, '2023-01-25', 'Impressed with the candidate.', 4.8),
    (2, 2, 2, '2023-02-28', 'Good communication skills.', 4.0),
    (3, 3, 3, '2023-03-20', 'Positive interaction with the applicant.', 4.5),
    (4, 4, 4, '2023-04-15', 'Average performance in the interview.', 3.2),
    (5, 5, 5, '2023-05-22', 'Strong technical skills.', 4.7),
    (6, 6, 6, '2023-06-05', 'Needs improvement in problem-solving.', 3.3);

INSERT INTO User_Notifications (NotificationID, UserID, NotificationType, Message, Timestamp, IsRead)
VALUES
    (1, 1, 'Job Alert', 'New job opportunity available.', '2023-01-10 08:30:00', false),
    (2, 2, 'Interview Invitation', 'You have been invited for an interview.', '2023-02-15 14:20:00', false),
    (3, 3, 'Application Update', 'Your job application status has changed.', '2023-03-05 10:45:00', false),
    (4, 4, 'Job Offer', 'Congratulations! You have received a job offer.', '2023-04-08 16:10:00', false),
    (5, 5, 'Job Alert', 'New job opportunity available.', '2023-05-18 09:55:00', false),
    (6, 6, 'Interview Invitation', 'You have been invited for an interview.', '2023-06-28 11:30:00', false);
