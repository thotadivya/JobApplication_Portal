# Job Application Portal

This project aims to revolutionize the recruitment process by integrating robust backend MySQL server capabilities with a Python Tkinter-based graphical user interface. The portal is designed to provide a user-friendly experience for both job seekers and employers, facilitating job matching, efficient communication, and critical insights into the recruitment process.

## Team Members
- **Divya Lakshmi Thota** (divyalakshmithota@my.unt.edu)
- Vishal Rachuri
- Sai Varshith Gandu
- Sushil Banka
- Teegala Tejasvi
- Lalitha Nali

## Abstract
Our Job Application Portal is designed to enhance the recruitment process by providing an intuitive user interface and essential collaborations for successful job matching and management. This report covers the development and deployment of this essential recruitment tool.

## Introduction
In the current job market, matching job seekers with potential employers efficiently is crucial. Understanding the challenges in the recruitment industry, we developed a Job Application Portal that meets these needs. The primary objective is to speed up the recruitment process with a user-friendly interface and robust data management using MySQL and Python Tkinter.

## Implementation

### 1. Planning and Design
Meticulous planning and design considerations were undertaken, including identifying essential features, database structure design, and front-end layout.

### 2. Backend Development
The backend was developed using MySQL server, involving the creation of necessary tables and relationships to securely store job-related and user data.

### 3. Frontend Implementation
The front-end interface was developed using Python's Tkinter framework, providing users with an interactive experience. Scripts were linked to specific table activities, with a main menu serving as a centralized portal for features.

### 4. Integration and Testing
Thorough testing was conducted to ensure seamless integration and functionality, including verifying data exchanges, user inputs, and system responses.

### 5. End User Experience
The portal provides functionalities for job seekers to search for jobs, submit applications, and manage profiles, while employers can manage job postings and review applications.

## Updated ER Diagram

 <img src="fdb_final_er (4).pdf" alt="Divya Lakshmi Thota" width ="300" height="400" class="ER" />


## Cardinalities
- **Users** have a one-to-many relationship with **Applied_JobPosts**, **Education**, **User_Notifications**, **Company_Reviews**.
- **Company** has a one-to-many relationship with **Job_Post** and a many-to-one relationship with **Industry**.
- **Job_Post** has a one-to-many relationship with **Job_Application_History**, **Job_Post_Skills**, and a many-to-one relationship with **Company** and **Job_Type**.

## UI Components
- **Main Menu**
- **Admin Management**
- **Company Management**
- **Job Types Management**
- **States Management**
- **Applied Job Posts Management**
- **Districts/Cities Management**
- **Interview Feedback Management**
- **Job Post Skills Management**
- **Saved Job Posts Management**
- **User Notifications Management**
- **Company Reviews Management**
- **Education Management**
- **Interviews Management**
- **Skills Management**
- **User Management**

## Requirements
- Windows 7 or later
- MySQL installed for database operations
- Python IDE or Jupyter Notebook for running the UI
- Zip folder containing Python scripts and icons

## Conclusion
The Job Application Portal enhances the efficiency of the recruitment process by combining robust backend capabilities with an intuitive frontend, offering a streamlined and user-friendly platform for both job seekers and employers.

