-- Creating a table called patients in clinicbooking database
CREATE TABLE clinicBooking.patients(
             PatientID INT AUTO_INCREMENT PRIMARY KEY,
             FirstName VARCHAR(100) NOT NULL,
             MiddleName VARCHAR(100) NOT NULL,
             LastName VARCHAR(100) NOT NULL,
             DateOfBirth DATE NOT NULL,
             Age INT NOT NULL,
             Gender ENUM('Male', 'Female', 'Other'),
             PhoneNumber VARCHAR(12) UNIQUE,
             EmailAddress VARCHAR(20) UNIQUE,
             Address TEXT
             );
  
-- Craeting a table doctors in clinicbooking database
CREATE TABLE clinicBooking.doctors(
             DoctorID INT AUTO_INCREMENT PRIMARY KEY,
             FirstName VARCHAR(100) NOT NULL,
             MiddleName VARCHAR(100) NOT NULL,
             LastName VARCHAR(100) NOT NULL,
             Specialization VARCHAR(255) NOT NULL,
             PhoneNumber VARCHAR(12) UNIQUE NOT NULL,
             Email VARCHAR(20) UNIQUE NOT NULL,
             RoomNumber VARCHAR(5) NOT NULL
             );
       
-- Creating tables called Appointments in clinicbooking database
CREATE TABLE clinicBooking.Appointments(
             AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
             PatientID INT NOT NULL,
             DoctorID INT NOT NULL,
             AppointmentDate DATE NOT NULL,
             AppointmentTime TIME NOT NULL,
             AppointmentStatus ENUM('Scheduled', 'Completed', 'Cancelled') NOT NULL DEFAULT 'Scheduled',
             Notes TEXT,
             CONSTRAINT fk_PatientID FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE CASCADE,
             CONSTRAINT fk_DoctorID FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID) ON DELETE CASCADE,
             UNIQUE (DoctorID, AppointmentDate, AppointmentTime) -- Code to prevent double booking
             );
            
-- Creating tables called Payments in clinicbooking database
CREATE TABLE clinicBooking.Payments(
             PaymentID INT AUTO_INCREMENT PRIMARY KEY,
             AppointmentID INT NOT NULL,
             PaymentDate DATE NOT NULL,
             PaymentAmount DECIMAL (10, 2) NOT NULL,
             PaymentMethod ENUM('Cash', 'Cheqye', 'Insurance') NOT NULL,
             Payment_Status ENUM('Paid', 'Pending', 'Failed') NOT NULL DEFAULT 'Pending',
             CONSTRAINT fk_AppointmentID FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID) ON DELETE CASCADE
             );
            
-- Creating a table called ClinicRooms in clinicBooking Database
CREATE TABLE clinicBooking.ClinicRooms(
             RoomID INT AUTO_INCREMENT PRIMARY KEY,
             RoomNumber VARCHAR(15) NOT NULL,
             RoomCapacity INT NOT NULL,
             RoomAvailability ENUM('Available', 'Not Available') NOT NULL DEFAULT 'Available'
             );
            





             
             
             
             
             
              
              
              
              
              
              
              

















