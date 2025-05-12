-- authors table
CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    gender VARCHAR(10),
    city VARCHAR(25)
);

--languages table
CREATE TABLE languages (
    id SERIAL PRIMARY KEY,
    language VARCHAR(30) NOT NULL UNIQUE
);

-- books table
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL UNIQUE,
    price NUMERIC(10, 2) NOT NULL CHECK (price > 0),
    authorid INT NOT NULL,
    languageid INT NOT NULL,
	availability BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (authorid) REFERENCES authors (id),
    FOREIGN KEY (languageid) REFERENCES languages (id)
);

-- customers table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    age INT CHECK (age > 0),
    city VARCHAR(25)
);

-- bookcart table
CREATE TABLE bookcart (
    id SERIAL PRIMARY KEY,
    customerid INT NOT NULL,
    bookid INT NOT NULL,
	amount INT NOT NULL CHECK(amount>0),
    FOREIGN KEY (customerid) REFERENCES customers (id),
    FOREIGN KEY (bookid) REFERENCES books (id)
);

-- payment table
CREATE TABLE payment (
    id SERIAL PRIMARY KEY,
    customerid INT NOT NULL,
    totalamount NUMERIC(10, 2) NOT NULL CHECK (totalamount >= 0),
	payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Automatically sets the current date and time
    FOREIGN KEY (customerid) REFERENCES customers (id)
);

--paid table
CREATE TABLE paid (
    id SERIAL PRIMARY KEY,
    customerid INT NOT NULL,
    totalprice NUMERIC(10, 2) NOT NULL CHECK (totalprice >= 0),
    paid_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customerid) REFERENCES customers (id)
);



SELECT * FROM pg_catalog.pg_tables;
-- show tables
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
AND table_type = 'BASE TABLE';




-- insert authors
INSERT INTO authors (name, gender, city) VALUES
    ('Amal Perera', 'Male', 'Colombo'),
    ('Kumari Wijesinghe', 'Female', 'Kandy'),
    ('Sunil Fernando', 'Male', 'Galle'),
    ('Nimali Rathnayake', 'Female', 'Matara'),
    ('Ranjan Silva', 'Male', 'Jaffna'),
    ('Sanduni Jayawardena', 'Female', 'Kurunegala'),
    ('Tharindu Wickramasinghe', 'Male', 'Gampaha'),
    ('Shanika Dissanayake', 'Female', 'Anuradhapura'),
    ('Asela Karunaratne', 'Male', 'Ratnapura'),
    ('Chandani Weerasinghe', 'Female', 'Badulla'),
    ('Roshan Gunasekara', 'Male', 'Colombo'),
    ('Nadeeka Samarasinghe', 'Female', 'Kandy'),
    ('Prasanna Ekanayake', 'Male', 'Galle'),
    ('Nirosha Liyanage', 'Female', 'Matara'),
    ('Anura Aluthge', 'Male', 'Jaffna'),
    ('Thilini Ranasinghe', 'Female', 'Kurunegala'),
    ('Rohan Bandara', 'Male', 'Gampaha'),
    ('Iresha Herath', 'Female', 'Anuradhapura'),
    ('Sarath Tennakoon', 'Male', 'Ratnapura'),
    ('Sulochana Kodithuwakku', 'Female', 'Badulla'),
    ('Upul Dharmapala', 'Male', 'Colombo'),
    ('Menaka Rajapaksha', 'Female', 'Kandy'),
    ('Kamal Jayasuriya', 'Male', 'Galle'),
    ('Rashmi Perera', 'Female', 'Matara'),
    ('Sunil Abeysekara', 'Male', 'Jaffna'),
    ('Sumudu Wanniarachchi', 'Female', 'Kurunegala'),
    ('Nimal Senanayake', 'Male', 'Gampaha'),
    ('Kanchana Dias', 'Female', 'Anuradhapura'),
    ('Ranjan Amarasinghe', 'Male', 'Ratnapura'),
    ('Anjali Perera', 'Female', 'Badulla'),
    ('Tharindu Wijetunga', 'Male', 'Colombo'),
    ('Nimali Hettiarachchi', 'Female', 'Kandy'),
    ('Amal Rathnayake', 'Male', 'Galle'),
    ('Kumari Weerasekara', 'Female', 'Matara'),
    ('Roshan Siriwardana', 'Male', 'Jaffna'),
    ('Nadeeka Ranasinghe', 'Female', 'Kurunegala'),
    ('Prasanna Wijewardena', 'Male', 'Gampaha'),
    ('Nirosha Ekanayake', 'Female', 'Anuradhapura'),
    ('Anura Gunawardana', 'Male', 'Ratnapura'),
    ('Thilini Chandrasekara', 'Female', 'Badulla'),
    ('Rohan Perera', 'Male', 'Colombo'),
    ('Chandani Jayasena', 'Female', 'Kandy'),
    ('Sarath Ranathunga', 'Male', 'Galle'),
    ('Sulochana Bandara', 'Female', 'Matara'),
    ('Upul Rajakaruna', 'Male', 'Jaffna'),
    ('Menaka Seneviratne', 'Female', 'Kurunegala'),
    ('Kamal Tennakoon', 'Male', 'Gampaha'),
    ('Rashmi Wickramaratne', 'Female', 'Anuradhapura'),
    ('Sunil Madushanka', 'Male', 'Ratnapura'),
    ('Sumudu Karunarathne', 'Female', 'Badulla'),
    ('Nimal De Silva', 'Male', 'Colombo'),
    ('Kanchana Wijetilake', 'Female', 'Kandy'),
    ('Ranjan Pathirana', 'Male', 'Galle'),
    ('Anjali Jayawardana', 'Female', 'Matara'),
    ('Tharindu Rathnayake', 'Male', 'Jaffna'),
    ('Nimali Kodikara', 'Female', 'Kurunegala'),
    ('Amal Jayasuriya', 'Male', 'Gampaha'),
    ('Kumari Wickramasinghe', 'Female', 'Anuradhapura'),
    ('Roshan Dissanayake', 'Male', 'Ratnapura'),
    ('Nadeeka Bandara', 'Female', 'Badulla'),
    ('Prasanna Karunarathna', 'Male', 'Colombo'),
    ('Nirosha Gunasekara', 'Female', 'Kandy'),
    ('Anura Tennakoon', 'Male', 'Galle'),
    ('Thilini Rajapakse', 'Female', 'Matara'),
    ('Rohan Alwis', 'Male', 'Jaffna'),
    ('Chandani Rathnayake', 'Female', 'Kurunegala'),
    ('Sarath Wijesekara', 'Male', 'Gampaha'),
    ('Sulochana Perera', 'Female', 'Anuradhapura'),
    ('Upul Silva', 'Male', 'Ratnapura'),
    ('Menaka Rathnayake', 'Female', 'Badulla'),
    ('Kamal Ekanayake', 'Male', 'Colombo'),
    ('Rashmi Wijewardena', 'Female', 'Kandy'),
    ('Sunil Aluthgama', 'Male', 'Galle'),
    ('Sumudu Gunawardena', 'Female', 'Matara'),
    ('Nimal Jayaratne', 'Male', 'Jaffna'),
    ('Kanchana Herath', 'Female', 'Kurunegala'),
    ('Ranjan Seneviratne', 'Male', 'Gampaha'),
    ('Anjali Kodithuwakku', 'Female', 'Anuradhapura'),
    ('Tharindu Gunasekara', 'Male', 'Ratnapura'),
    ('Nimali Tennakoon', 'Female', 'Badulla'),
    ('Amal Dissanayake', 'Male', 'Colombo'),
    ('Kumari Wickramarathna', 'Female', 'Kandy'),
    ('Roshan Ranasinghe', 'Male', 'Galle'),
    ('Nadeeka Pathirana', 'Female', 'Matara'),
    ('Indika Perera', 'Male', 'Colombo'),
    ('Himani Wijesinghe', 'Female', 'Kandy'),
    ('Dilan Fernando', 'Male', 'Galle'),
    ('Geethika Rathnayake', 'Female', 'Matara'),
    ('Ravindu Silva', 'Male', 'Jaffna'),
    ('Pavithra Jayawardena', 'Female', 'Kurunegala'),
    ('Thushara Wickramasinghe', 'Male', 'Gampaha'),
    ('Madhavi Dissanayake', 'Female', 'Anuradhapura'),
    ('Kasun Karunaratne', 'Male', 'Ratnapura'),
    ('Dilrukshi Weerasinghe', 'Female', 'Badulla'),
    ('Lakshan Gunasekara', 'Male', 'Colombo'),
    ('Ruvini Samarasinghe', 'Female', 'Kandy'),
    ('Tharaka Ekanayake', 'Male', 'Galle'),
    ('Anuki Liyanage', 'Female', 'Matara'),
    ('Devaka Aluthge', 'Male', 'Jaffna'),
    ('Thisuni Ranasinghe', 'Female', 'Kurunegala'),
    ('Eranda Bandara', 'Male', 'Gampaha'),
    ('Hiruni Herath', 'Female', 'Anuradhapura'),
    ('Sajith Tennakoon', 'Male', 'Ratnapura'),
    ('Nishadi Kodithuwakku', 'Female', 'Badulla'),
    ('Janith Dharmapala', 'Male', 'Colombo'),
    ('Dilini Rajapaksha', 'Female', 'Kandy'),
    ('Kavindu Jayasuriya', 'Male', 'Galle'),
    ('Chathuni Perera', 'Female', 'Matara'),
    ('Shenal Abeysekara', 'Male', 'Jaffna'),
    ('Navodya Wanniarachchi', 'Female', 'Kurunegala'),
    ('Niroshan Senanayake', 'Male', 'Gampaha'),
    ('Pathum Dias', 'Female', 'Anuradhapura'),
    ('Raveen Amarasinghe', 'Male', 'Ratnapura'),
    ('Tharushi Perera', 'Female', 'Badulla'),
    ('Harindu Wijetunga', 'Male', 'Colombo'),
    ('Tharanga Hettiarachchi', 'Female', 'Kandy'),
    ('Amith Rathnayake', 'Male', 'Galle'),
    ('Dilsha Weerasekara', 'Female', 'Matara'),
    ('Suresh Siriwardana', 'Male', 'Jaffna'),
    ('Thulasi Ranasinghe', 'Female', 'Kurunegala'),
    ('Chalana Wijewardena', 'Male', 'Gampaha'),
    ('Sashini Ekanayake', 'Female', 'Anuradhapura'),
    ('Vihan Gunawardana', 'Male', 'Ratnapura'),
    ('Ruwini Chandrasekara', 'Female', 'Badulla'),
    ('Pasindu Perera', 'Male', 'Colombo'),
    ('Kalpana Jayasena', 'Female', 'Kandy'),
    ('Dinuk Ranathunga', 'Male', 'Galle'),
    ('Sithara Bandara', 'Female', 'Matara'),
    ('Hasitha Rajakaruna', 'Male', 'Jaffna'),
    ('Nimesha Seneviratne', 'Female', 'Kurunegala'),
    ('Chinthaka Tennakoon', 'Male', 'Gampaha'),
    ('Kavindya Wickramaratne', 'Female', 'Anuradhapura'),
    ('Bhanuka Madushanka', 'Male', 'Ratnapura'),
    ('Vimasha Karunarathne', 'Female', 'Badulla'),
    ('Akalanka De Silva', 'Male', 'Colombo'),
    ('Devmini Wijetilake', 'Female', 'Kandy'),
    ('Sahan Pathirana', 'Male', 'Galle'),
    ('Piyumi Jayawardana', 'Female', 'Matara'),
    ('Kavish Rathnayake', 'Male', 'Jaffna'),
    ('Thivya Kodikara', 'Female', 'Kurunegala'),
    ('Malith Jayasuriya', 'Male', 'Gampaha'),
    ('Sithmi Wickramasinghe', 'Female', 'Anuradhapura'),
    ('Charith Dissanayake', 'Male', 'Ratnapura'),
    ('Harshani Bandara', 'Female', 'Badulla'),
    ('Shenal Rajapakse', 'Male', 'Colombo'),
    ('Hiruni Tennakoon', 'Female', 'Kandy'),
    ('Rasika Fernando', 'Male', 'Galle'),
    ('Vishmi Rathnayake', 'Female', 'Matara'),
    ('Kalum Wijewardena', 'Male', 'Jaffna'),
    ('Nisala Ekanayake', 'Female', 'Kurunegala'),
    ('Mihiran Gunasekara', 'Male', 'Gampaha'),
    ('Haritha Chandrasekara', 'Female', 'Anuradhapura'),
    ('Devinda Tennakoon', 'Male', 'Ratnapura'),
    ('Vindya Kodithuwakku', 'Female', 'Badulla'),
    ('Senuja Dharmapala', 'Male', 'Colombo'),
    ('Nimasha Rajapaksha', 'Female', 'Kandy'),
    ('Chanuka Jayasuriya', 'Male', 'Galle'),
    ('Shenali Perera', 'Female', 'Matara'),
    ('Lakindu Abeysekara', 'Male', 'Jaffna'),
    ('Sayuri Wanniarachchi', 'Female', 'Kurunegala'),
    ('Dineth Senanayake', 'Male', 'Gampaha'),
    ('Chathuni Dias', 'Female', 'Anuradhapura'),
    ('Kalindu Amarasinghe', 'Male', 'Ratnapura'),
    ('Tharani Perera', 'Female', 'Badulla'),
    ('Sithara Wijetunga', 'Male', 'Colombo'),
    ('Thisari Hettiarachchi', 'Female', 'Kandy'),
    ('Ashen Rathnayake', 'Male', 'Galle'),
    ('Navindi Weerasekara', 'Female', 'Matara'),
    ('Praveen Siriwardana', 'Male', 'Jaffna'),
    ('Thanuja Ranasinghe', 'Female', 'Kurunegala'),
    ('Chiran Wijewardena', 'Male', 'Gampaha'),
    ('Pramuditha Ekanayake', 'Female', 'Anuradhapura'),
    ('Sudeepa Gunawardana', 'Male', 'Ratnapura'),
    ('Ishini Chandrasekara', 'Female', 'Badulla'),
    ('Martin Wickramasinghe', 'Male', 'Koggala'),
    ('Michel de Kretser', 'Female', 'Colombo'),
    ('Kumar de Silva', 'Male', 'Colombo'),
    ('Sybil Wettasinghe', 'Female', 'Galle'),
    ('Bertie Fernando', 'Male', 'Colombo'),
    ('Maithree Wickramasinghe', 'Female', 'Kandy'),
    ('Gunayana', 'Male', 'Ratnapura'),
    ('Tissa Abeysekara', 'Male', 'Colombo'),
    ('Geoffrey Bawa', 'Male', 'Colombo'),
    ('Kamala Wijeratne', 'Female', 'Kandy'),
    ('Rohana Wijeweera', 'Male', 'Anuradhapura'),
    ('D. B. Wijetunga', 'Male', 'Galle'),
    ('Shyam Selvadurai', 'Male', 'Colombo'),
    ('Martha Q. U. R. Renganayagam', 'Female', 'Jaffna'),
    ('C. S. Gooneratne', 'Male', 'Ratnapura'),
    ('Anoma Rajakaruna', 'Female', 'Matara'),
    ('G. B. Senanayake', 'Male', 'Colombo'),
    ('A. A. Wickremasinghe', 'Male', 'Gampaha'),
    ('Niranjala Nadeera', 'Female', 'Jaffna'),
    ('K. Jayathilaka', 'Male', 'Galle'),
    ('Sunanda Mahendra', 'Female', 'Kurunegala'),
    ('Sujatha Jayawardena', 'Female', 'Colombo'),
    ('Siri Gunasinghe', 'Male', 'Kandy'),
    ('Vasantha Jayasuriya', 'Female', 'Galle'),
    ('Sumitra Perera', 'Female', 'Kandy'),
    ('W. A. Silva', 'Male', 'Gampaha'),
    ('Lester James Peries', 'Male', 'Colombo'),
    ('Chandani Thennakoon', 'Female', 'Matara'),
    ('Sarath Kumara Rajakaruna', 'Male', 'Badulla'),
    ('K. S. Sivaratnam', 'Male', 'Jaffna'),
    ('Jeevitha Tharanga', 'Female', 'Kandy'),
    ('K. L. Seneviratne', 'Male', 'Colombo'),
    ('Minoli de Silva', 'Female', 'Matara'),
    ('S. J. M. Goonatilleke', 'Male', 'Ratnapura'),
    ('Lalitha Wijewardena', 'Female', 'Colombo'),
    ('H. D. B. Gunarathna', 'Male', 'Galle'),
    ('Indrani Wijesinghe', 'Female', 'Gampaha'),
    ('Sampath Siriwardena', 'Male', 'Colombo'),
    ('Ananda Coomaraswamy', 'Male', 'Colombo'),
    ('Vijitha Yapa', 'Female', 'Galle'),
    ('Edith Wharton', 'Female', 'Colombo'),
    ('Selina Perera', 'Female', 'Kurunegala'),
    ('Ratna Weerakoon', 'Female', 'Matara'),
    ('Ranjan Wijewardena', 'Male', 'Galle'),
    ('Gamini Dissanayake', 'Male', 'Gampaha'),
    ('Lalitha Subasinghe', 'Female', 'Ratnapura'),
    ('Richard de Zoysa', 'Male', 'Colombo'),
    ('Selvam Rathinam', 'Male', 'Jaffna'),
    ('Ismeth Raheem', 'Male', 'Colombo'),
    ('Shirani Bandaranayake', 'Female', 'Kurunegala'),
    ('Mihirini Dissanayake', 'Female', 'Gampaha'),
    ('Ruwan Premarathna', 'Male', 'Colombo'),
    ('Madhura Lakshmi', 'Female', 'Matara'),
    ('Gamini Fonseka', 'Male', 'Galle'),
    ('Janaki Amaratunga', 'Female', 'Ratnapura'),
    ('M. P. L. W.', 'Male', 'Badulla'),
    ('Raja Ratnam', 'Male', 'Kandy'),
    ('Vijayalakshmi Rajapakse', 'Female', 'Colombo'),
    ('Dayasiri Jayasekera', 'Male', 'Gampaha'),
    ('Nawaz Rajabdeen', 'Male', 'Colombo'),
    ('Mani Liyanage', 'Female', 'Galle'),
    ('Marcel de Zoysa', 'Male', 'Colombo'),
    ('Ranjani Pushpakumari', 'Female', 'Kurunegala'),
    ('Indu Gunasekara', 'Female', 'Jaffna'),
    ('Madhusree Kumarasinghe', 'Female', 'Matara'),
    ('Ravi Karunanayake', 'Male', 'Gampaha'),
    ('Kalpana Wijesundara', 'Female', 'Galle'),
    ('Rohini Nanda', 'Female', 'Badulla'),
    ('Mihindu Rajapaksha', 'Male', 'Galle'),
    ('Kalyani Seneviratne', 'Female', 'Ratnapura'),
    ('Deva Dissanayake', 'Male', 'Colombo'),
    ('Priyantha Wijeratne', 'Male', 'Kurunegala'),
    ('Kalaweera Gunawardena', 'Male', 'Gampaha'),
    ('Shirin Jayawardena', 'Female', 'Jaffna'),
    ('Kavitha Perera', 'Female', 'Colombo'),
    ('Sanjay Wijeratne', 'Male', 'Galle'),
    ('Geeta Nandawathie', 'Female', 'Matara'),
    ('Sanjeewa Kularathna', 'Male', 'Badulla'),
    ('Anushka Weerasinghe', 'Female', 'Kandy'),
    ('Zainab Fatima', 'Female', 'Colombo'),
    ('Kavinda Samarasinghe', 'Male', 'Gampaha'),
    ('Shalini Ekanayake', 'Female', 'Kurunegala'),
    ('Kamani Premaratne', 'Female', 'Galle'),
    ('T. M. R. Joseph', 'Male', 'Badulla'),
    ('Ushantha Karunaratne', 'Male', 'Colombo'),
    ('Anushka Nandana', 'Female', 'Matara'),
    ('Dilusha Gunasekara', 'Male', 'Jaffna'),
    ('Rukshan Jayathilaka', 'Male', 'Gampaha'),
    ('Dilanthika Seneviratne', 'Female', 'Colombo'),
    ('Sithmi Fernando', 'Female', 'Kurunegala'),
    ('Damayanthi Karunaratne', 'Female', 'Galle'),
    ('Samitha Rajendran', 'Female', 'Badulla'),
    ('Ashani Perera', 'Female', 'Matara'),
    ('Chandimal Wijesuriya', 'Male', 'Ratnapura'),
    ('Charitha Wickramasinghe', 'Female', 'Galle'),
    ('Saman Jayasinghe', 'Male', 'Kandy'),
    ('Anjani Ranasinghe', 'Male', 'Colombo'),
    ('Haritha Wijesinghe', 'Female', 'Kandy'),
    ('Ravindra Perera', 'Male', 'Galle'),
    ('Indika Dissanayake', 'Female', 'Matara'),
    ('Kusal Perera', 'Male', 'Jaffna'),
    ('Sashini Jayawardene', 'Female', 'Kurunegala'),
    ('Chaminda Wickramasinghe', 'Male', 'Gampaha'),
    ('Iresha Ratnayake', 'Female', 'Anuradhapura'),
    ('Shalitha Gunasekara', 'Male', 'Ratnapura'),
    ('Kasuni Weerasinghe', 'Female', 'Badulla'),
    ('Vimukthi Rajapaksha', 'Male', 'Colombo'),
    ('Nadika Seneviratne', 'Female', 'Kandy'),
    ('Yohan Fernando', 'Male', 'Galle'),
    ('Nivanka Wijewardene', 'Female', 'Matara'),
    ('Sathish Abeysekara', 'Male', 'Jaffna'),
    ('Dulini Wickramasinghe', 'Female', 'Kurunegala'),
    ('Kasun Gunaratne', 'Male', 'Gampaha'),
    ('Pramodhika Dissanayake', 'Female', 'Anuradhapura'),
    ('Dinesh Karunaratne', 'Male', 'Ratnapura'),
    ('Kumari Wijesundara', 'Female', 'Badulla'),
    ('Sachith Wickramasinghe', 'Male', 'Colombo'),
    ('Nimalani Seneviratne', 'Female', 'Kandy'),
    ('Ajith Silva', 'Male', 'Galle'),
    ('Sunethri Rajapaksha', 'Female', 'Matara'),
    ('Janaka Wickramaratne', 'Male', 'Jaffna'),
    ('Shiranthi Perera', 'Female', 'Kurunegala'),
    ('Harindra Gunasekara', 'Male', 'Gampaha'),
    ('Kavitha Dissanayake', 'Female', 'Anuradhapura'),
    ('Chamara Ekanayake', 'Male', 'Ratnapura'),
    ('Vijitha Herath', 'Female', 'Badulla'),
    ('Priyankara Wickramasinghe', 'Male', 'Colombo'),
    ('Rohini Seneviratne', 'Female', 'Kandy'),
    ('Bhavani Rajapaksha', 'Female', 'Galle'),
    ('Kamala Weerasinghe', 'Female', 'Matara'),
    ('Kasuni Liyanage', 'Female', 'Jaffna'),
    ('Samanthika Jayawardena', 'Female', 'Kurunegala'),
    ('Sithara Gunasekara', 'Female', 'Gampaha'),
    ('Damith Wickramasinghe', 'Male', 'Anuradhapura'),
    ('Anushka Rajapaksha', 'Female', 'Badulla'),
    ('Udaya Fernando', 'Male', 'Colombo'),
    ('Shalini Wijesinghe', 'Female', 'Kandy'),
    ('Ravindra Senanayake', 'Male', 'Galle'),
    ('Nalika Dissanayake', 'Female', 'Matara'),
    ('Kithsiri Jayasuriya', 'Male', 'Jaffna'),
    ('Sujani Perera', 'Female', 'Kurunegala'),
    ('Madushan Ranasinghe', 'Male', 'Gampaha'),
    ('Pavithra Wickramasinghe', 'Female', 'Anuradhapura'),
    ('Ranitha Gunasekara', 'Male', 'Ratnapura'),
    ('Pranitha Seneviratne', 'Female', 'Badulla'),
    ('Thushara Silva', 'Male', 'Colombo'),
    ('Sanduni Wijewardena', 'Female', 'Kandy'),
    ('Ravindu Rajapakse', 'Male', 'Galle'),
    ('Jayanthi Dissanayake', 'Female', 'Matara'),
    ('Mihiran Fernando', 'Male', 'Jaffna'),
    ('Kasuni Perera', 'Female', 'Kurunegala'),
    ('Nadeesha Wickramasinghe', 'Female', 'Gampaha'),
    ('Samitha Herath', 'Male', 'Anuradhapura'),
    ('Anjali Gunasekara', 'Female', 'Badulla'),
    ('Asanka Perera', 'Male', 'Colombo'),
    ('Sajitha Wijewardena', 'Female', 'Kandy'),
    ('Yasara Rajapaksha', 'Male', 'Galle'),
    ('Shamitha Dissanayake', 'Female', 'Matara'),
    ('Dinesh Rajapakse', 'Male', 'Jaffna'),
    ('Haritha Karunarathna', 'Female', 'Kurunegala'),
    ('Chinthaka Wickramasinghe', 'Male', 'Gampaha'),
    ('Anushka Wijewardena', 'Female', 'Anuradhapura'),
    ('Sajith Rajapaksha', 'Male', 'Ratnapura'),
    ('Kasuni Ekanayake', 'Female', 'Badulla'),
    ('Ishan Wickramasinghe', 'Male', 'Colombo'),
    ('Kavitha Wijewardena', 'Female', 'Kandy'),
    ('Tharindu Rajapakse', 'Male', 'Galle'),
    ('Sithara Gunasiri', 'Female', 'Matara'),
    ('Dulini Rajapaksha', 'Female', 'Jaffna'),
    ('Sandeepa Gunasekara', 'Male', 'Kurunegala'),
    ('Haritha Perera', 'Female', 'Gampaha'),
    ('Asela Rajapaksha', 'Male', 'Anuradhapura'),
    ('Navodini Jayasuriya', 'Female', 'Badulla'),
    ('Kasun Ranasinghe', 'Male', 'Colombo'),
    ('Shanika Wijewardena', 'Female', 'Kandy'),
    ('Vijitha Wickramasinghe', 'Male', 'Galle'),
    ('Gamini Rajapaksha', 'Male', 'Matara'),
    ('Chandima Gunasekara', 'Male', 'Jaffna'),
    ('Madhav Dissanayake', 'Female', 'Kurunegala'),
    ('Ravindu Wijesekara', 'Male', 'Gampaha'),
    ('Kumari Perera', 'Female', 'Anuradhapura'),
    ('Dhanushka Wickramasinghe', 'Male', 'Ratnapura'),
    ('Pavithra Perera', 'Female', 'Badulla'),
    ('Ashan Wijewardena', 'Male', 'Colombo'),
    ('Sarath Rajapakse', 'Male', 'Kandy'),
    ('Vimukthi Wickramaratne', 'Male', 'Galle');

-- insert lang
INSERT INTO languages (language) VALUES
    ('Sinhala'),
    ('Tamil'),
    ('Japanese'),
    ('English'),
    ('Spanish');

--insert books
INSERT INTO books (title, price, authorid, languageid, availability) VALUES
    ('The Silence of the Sea', 1500, 1, 1, TRUE),
    ('Whispers in the Wind', 1200, 2, 1, TRUE),
    ('The Last Sunrise', 1800, 3, 2, TRUE),
    ('Echoes of the Past', 2000, 4, 3, TRUE),
    ('The Heart of the Island', 1400, 5, 1, TRUE),
    ('Fading Memories', 1600, 6, 4, TRUE),
    ('The Storm Within', 1700, 7, 2, TRUE),
    ('Rays of Hope', 1300, 8, 1, TRUE),
    ('Beneath the Moonlit Sky', 1500, 9, 3, TRUE),
    ('Journey Through Time', 1900, 10, 4, TRUE),
    ('The Lost Dreams', 1800, 11, 2, TRUE),
    ('Whispers of the Soul', 2000, 12, 1, TRUE),
    ('Reflections of the Mind', 1400, 13, 4, TRUE),
    ('The Forbidden Path', 1600, 14, 3, TRUE),
    ('Tales of the Forgotten', 1700, 15, 1, TRUE),
    ('Rising From the Ashes', 1500, 16, 2, TRUE),
    ('The Winds of Change', 1200, 17, 4, TRUE),
    ('The Secret of the Sea', 1800, 18, 1, TRUE),
    ('The Lost Tribe', 1900, 19, 3, TRUE),
    ('In the Shadow of the Mountain', 1600, 20, 2, TRUE),
    ('The Forgotten Kingdom', 1500, 21, 4, TRUE),
    ('A World in Ruins', 1700, 22, 1, TRUE),
    ('The Voice of the River', 1800, 23, 2, TRUE),
    ('The Eyes of the Storm', 1400, 24, 3, TRUE),
    ('The Prisoner of Fate', 1500, 25, 4, TRUE),
    ('The Return of the King', 2000, 26, 1, TRUE),
    ('Shadows in the Valley', 1200, 27, 2, TRUE),
    ('The Final Hour', 1600, 28, 3, TRUE),
    ('The House on the Hill', 1900, 29, 4, TRUE),
    ('The Dreamer’s Journey', 1800, 30, 1, TRUE),
    ('The Kingdom of Souls', 1400, 31, 2, TRUE),
    ('The Call of the Wild', 1600, 32, 3, TRUE),
    ('The Forgotten Child', 1500, 33, 4, TRUE),
    ('The Night Watcher', 1700, 34, 1, TRUE),
    ('The Edge of Tomorrow', 1800, 35, 2, TRUE),
    ('The Broken Sword', 1400, 36, 3, TRUE),
    ('The Hidden Realm', 1500, 37, 4, TRUE),
    ('The Eternal Flame', 1600, 38, 1, TRUE),
    ('The Road to Nowhere', 1800, 39, 2, TRUE),
    ('The Dark Horizon', 1900, 40, 3, TRUE),
    ('The Lost Paradise', 1700, 41, 4, TRUE),
    ('The Shadow of the Moon', 1600, 42, 1, TRUE),
    ('The Eyes of the Leopard', 1400, 43, 2, TRUE),
    ('The Heart of the Wolf', 1500, 44, 3, TRUE),
    ('The Winter’s Breath', 1700, 45, 4, TRUE),
    ('A Dreamer’s Heart', 1600, 46, 1, TRUE),
    ('The Lady of the Lake', 1800, 47, 2, TRUE),
    ('The Man of the Mountain', 1400, 48, 3, TRUE),
    ('The Path of the Stars', 1900, 49, 4, TRUE),
    ('The Cursed Valley', 1500, 50, 1, TRUE),
    ('The Star in the Sky', 1600, 51, 2, TRUE),
    ('The Song of the Wind', 1700, 52, 3, TRUE),
    ('The Last Dreamer', 1800, 53, 4, TRUE),
    ('The Fire Within', 1400, 54, 1, TRUE),
    ('The Ghost of the Past', 1500, 55, 2, TRUE),
    ('The Island of Secrets', 1600, 56, 3, TRUE),
    ('The Path of the Soul', 1700, 57, 4, TRUE),
    ('The Eternal Darkness', 1800, 58, 1, TRUE),
    ('The Final Destination', 1400, 59, 2, TRUE),
    ('The Prince of the Night', 1500, 60, 3, TRUE),
    ('The Ocean’s Call', 1600, 61, 4, TRUE),
    ('The Keeper of Secrets', 1700, 62, 1, TRUE),
    ('The Mountain’s Voice', 1800, 63, 2, TRUE),
    ('The Dragon’s Roar', 1900, 64, 3, TRUE),
    ('The Hidden Path', 1600, 65, 4, TRUE),
    ('The Moon’s Embrace', 1700, 66, 1, TRUE),
    ('The Heart’s Journey', 1500, 67, 2, TRUE),
    ('The Land of Fire', 1400, 68, 3, TRUE),
    ('The King’s Return', 1600, 69, 4, TRUE),
    ('The Soul’s Cry', 1800, 70, 1, TRUE),
    ('The Edge of the World', 1700, 71, 2, TRUE),
    ('The Light Beyond', 1500, 72, 3, TRUE),
    ('The Voice of the Ancient Ones', 1600, 73, 4, TRUE),
    ('The Path to Freedom', 1700, 74, 1, TRUE),
    ('The Edge of the Abyss', 1600, 75, 2, TRUE),
    ('The Call of the Horizon', 1500, 76, 3, TRUE),
    ('The Silent Dreamer', 1800, 77, 4, TRUE),
    ('The Last Escape', 1400, 78, 1, TRUE),
    ('The Heart’s Awakening', 1500, 79, 2, TRUE),
    ('The Secret of the Horizon', 1600, 80, 3, TRUE),
    ('The Stranger’s Journey', 1700, 81, 4, TRUE),
    ('The Red Sky', 1600, 82, 1, TRUE),
    ('The Eye of the Eagle', 1500, 83, 2, TRUE),
    ('The Crown of Thorns', 1700, 84, 3, TRUE),
    ('The Dragon’s Flight', 1800, 85, 4, TRUE),
    ('The Land Beyond', 1400, 86, 1, TRUE),
    ('The Heart of the Phoenix', 1500, 87, 2, TRUE),
    ('The Journey of the Soul', 1600, 88, 3, TRUE),
    ('The Bridge to Tomorrow', 1700, 89, 4, TRUE),
    ('The Song of the Sea', 1600, 90, 1, TRUE),
    ('The Eye of the Storm', 1500, 91, 2, TRUE),
    ('The Last Breath', 1700, 92, 3, TRUE),
    ('The Dragon’s Breath', 1800, 93, 4, TRUE),
    ('The Kingdom of the Sun', 1400, 94, 1, TRUE),
    ('The City of Lights', 1600, 95, 2, TRUE),
    ('The Heart of the Ocean', 1500, 96, 3, TRUE),
    ('The Path to Eternity', 1700, 97, 4, TRUE),
    ('The Age of Shadows', 1800, 98, 1, TRUE),
    ('The Dance of the Rain', 1500, 99, 2, TRUE),
    ('The Eye of the Night', 1700, 100, 3, TRUE),
	('Beyond the Boundaries', 1500, 1, 1, TRUE),
    ('The Sea of Silence', 1600, 2, 1, FALSE),
    ('A Symphony of Shadows', 1700, 3, 2, TRUE),
    ('The Path of the Warrior', 1800, 4, 3, FALSE),
    ('Voices in the Mist', 1400, 5, 4, TRUE),
    ('Waves of Time', 1500, 6, 1, FALSE),
    ('Shadows on the Horizon', 1600, 7, 2, TRUE),
    ('Heart', 1700, 8, 3, FALSE),
    ('A Journey through the Dark', 1800, 9, 4, TRUE),
    ('Tides of Change', 1400, 10, 1, FALSE),
    ('Through the Misty Mountains', 1500, 11, 2, TRUE),
    ('The Roar of the Tiger', 1600, 12, 3, FALSE),
    ('Beneath the Surface', 1700, 13, 4, TRUE),
    ('The Black Lotus', 1800, 14, 1, FALSE),
    ('Whispers of the Moon', 1400, 15, 2, TRUE),
    ('The Lost Dreamers', 1500, 16, 3, FALSE),
    ('The Shadows of the Past', 1600, 17, 4, TRUE),
    ('Songs of the Wind', 1700, 18, 1, FALSE),
    ('The Sea of Dreams', 1800, 19, 2, TRUE),
    ('The Book of Life', 1400, 20, 3, FALSE),
    ('Echoes from the Ocean', 1500, 21, 4, TRUE),
    ('The Silent Storm', 1600, 22, 1, FALSE),
    ('The Flame of Hope', 1700, 23, 2, TRUE),
    ('Reflections of the Heart', 1800, 24, 3, FALSE),
    ('The Dreamer’s Song', 1400, 25, 4, TRUE),
    ('In the Land of the Giants', 1500, 26, 1, FALSE),
    ('The Return of the Hero', 1600, 27, 2, TRUE),
    ('The Red Rain', 1700, 28, 3, FALSE),
    ('The Book of Tears', 1800, 29, 4, TRUE),
    ('The River of Souls', 1400, 30, 1, FALSE),
    ('The Heart of Darkness', 1500, 31, 2, TRUE),
    ('Wild', 1600, 32, 3, FALSE),
    ('Whispers in the Breeze', 1700, 33, 4, TRUE),
    ('Under the Crimson Sky', 1800, 34, 1, FALSE),
    ('The Path of the Fallen', 1400, 35, 2, TRUE),
    ('The Stranger in the Shadows', 1500, 36, 3, FALSE),
    ('The World Beyond', 1600, 37, 4, TRUE),
    ('The Key to the Kingdom', 1700, 38, 1, FALSE),
    ('The Death of a Dream', 1800, 39, 2, TRUE),
    ('Into the Fire', 1400, 40, 3, FALSE),
    ('Beneath the Red Sun', 1500, 41, 4, TRUE),
    ('The Last Hope', 1600, 42, 1, FALSE),
    ('The Tribe', 1700, 43, 2, TRUE),
    ('The End of the World', 1800, 44, 3, FALSE),
    ('The Sunken Ship', 1400, 45, 4, TRUE),
    ('The Woman in the Window', 1500, 46, 1, FALSE),
    ('The Curse of the River', 1600, 47, 2, TRUE),
    ('The Wings of the Phoenix', 1700, 48, 3, FALSE),
    ('The Last King of Lanka', 1800, 49, 4, TRUE),
    ('The White Tower', 1500, 51, 2, FALSE),
    ('Echoes of the Ancestors', 1600, 52, 3, TRUE),
    ('The Kingdom of Tears', 1700, 53, 4, FALSE),
    ('The Song of the Stars', 1800, 54, 1, TRUE),
    ('The Cry of the Wild', 1400, 55, 2, FALSE),
    ('The Last Dance', 1500, 56, 3, TRUE),
    ('The Flame of Justice', 1600, 57, 4, FALSE),
    ('The Golden Hour', 1700, 58, 1, TRUE),
    ('The Forbidden City', 1800, 59, 2, FALSE),
    ('The Fire of the Soul', 1400, 60, 3, TRUE),
    ('The Darkness Before Dawn', 1500, 61, 4, FALSE),
    ('The World', 1600, 62, 1, TRUE),
    ('The Dawn of Time', 1700, 63, 2, FALSE),
    ('The Eye of the Tiger', 1800, 64, 3, TRUE),
    ('The Road Less Traveled', 1400, 65, 4, FALSE),
    ('In the Wake of the Storm', 1500, 66, 1, TRUE),
    ('The Fall of the Empire', 1600, 67, 2, FALSE),
    ('The Black Knight', 1700, 68, 3, TRUE),
    ('The Hidden Kingdom', 1800, 69, 4, FALSE),
    ('The Queen’s Legacy', 1400, 70, 1, TRUE),
    ('The Secret of the River', 1500, 71, 2, FALSE),
    ('The Treasure of the Sea', 1600, 72, 3, TRUE),
    ('The King’s Heart', 1700, 73, 4, FALSE),
    ('Whispers of the Wind', 1800, 74, 1, TRUE),
    ('The Prince of Darkness', 1500, 76, 3, FALSE),
    ('The Queen of Shadows', 1600, 77, 4, TRUE),
    ('The Story of the Sea', 1700, 78, 1, FALSE),
    ('The Last Sunset', 1400, 80, 3, TRUE),
    ('The Paradise', 1600, 82, 1, FALSE),
    ('The Flame of the Phoenix', 1700, 83, 2, TRUE),
    ('The Power of the King', 1800, 84, 3, FALSE),
    ('The Dance of the Gods', 1400, 85, 4, TRUE),
    ('The Flame', 1500, 86, 1, FALSE),
    ('The Bridge to the Future', 1600, 87, 2, TRUE),
    ('The Mask of the Warrior', 1700, 88, 3, FALSE),
    ('The Last Goodbye', 1800, 89, 4, TRUE),
    ('The Children of the Earth', 1400, 90, 1, FALSE),
    ('The River', 1500, 91, 2, TRUE),
    ('The Path of the King', 1600, 92, 3, FALSE),
    ('The Souls', 1700, 93, 4, TRUE),
    ('The Secret of the Jungle', 1800, 94, 1, FALSE),
    ('The Call of the Heart', 1400, 95, 2, TRUE),
    ('The Thief in the Night', 1500, 96, 3, FALSE),
    ('The Night of the Storm', 1600, 97, 4, TRUE),
    ('The Eyes of the Dragon', 1700, 98, 1, FALSE),
    ('The Sword of Truth', 1800, 99, 2, TRUE),
    ('The Time of Reckoning', 1400, 100, 3, FALSE),
    ('Madol Doova', 1500, 1, 1, TRUE),
    ('Kaliyugaya', 1600, 1, 1, FALSE),
    ('Gamperaliya', 1700, 1, 2, TRUE),
    ('The Life and Work of Geoffrey Bawa', 1800, 2, 1, FALSE),
    ('Bawa: The Sri Lankan Architect', 1400, 2, 2, TRUE),
    ('Maname', 1500, 3, 1, FALSE),
    ('Raththaran Kinnari', 1600, 3, 2, TRUE),
    ('Loku Duwe', 1700, 4, 3, FALSE),
    ('Asirimath Kollo', 1800, 4, 4, TRUE),
    ('Ape Gama', 1400, 5, 1, TRUE),
    ('Kele Handa', 1500, 5, 2, FALSE),
    ('Jeevithaya', 1600, 6, 3, TRUE),
    ('Agni', 1700, 6, 4, FALSE),
    ('My Story', 1800, 7, 1, TRUE),
    ('The Descendants', 1400, 7, 2, FALSE),
    ('Ra**mayanaya', 1500, 8, 3, TRUE),
    ('Hiripoda Wessa', 1600, 8, 4, FALSE),
    ('A Decade in the Making', 1700, 9, 1, TRUE),
    ('Social and Political Change in Sri Lanka', 1800, 9, 2, FALSE),
    ('Colpetty People', 1400, 10, 3, TRUE),
    ('The Unmarried Wife', 1500, 10, 4, FALSE),
    ('Funny Boy', 1600, 11, 1, TRUE),
    ('Cinnamon Gardens', 1700, 11, 2, FALSE),
    ('The Lotus', 1800, 12, 3, TRUE),
    ('The Dreamers', 1400, 12, 4, FALSE),
    ('The Village in the Jungle', 1500, 1, 1, TRUE),
    ('The Bridge Over the River Kwai', 1600, 2, 1, FALSE),
    ('The Legend of the Serpent', 1700, 3, 2, TRUE),
    ('The River of Sorrows', 1800, 4, 1, FALSE),
    ('The Sinhalese Kingdom', 1400, 5, 3, TRUE),
    ('The Mysterious Island', 1500, 6, 2, FALSE),
    ('The Black Prince', 1600, 7, 4, TRUE),
    ('Island of the Gods', 1700, 8, 1, FALSE),
    ('The Shadows of History', 1800, 9, 2, TRUE),
    ('The Curse of the Naga', 1400, 10, 3, FALSE),
    ('The Tiger’s Lair', 1500, 11, 4, TRUE),
    ('Waves of Change', 1600, 12, 1, FALSE),
    ('The Golden Land', 1700, 13, 2, TRUE),
    ('The Blue Horizon', 1800, 14, 3, FALSE),
    ('The Crown of Ceylon', 1400, 15, 1, TRUE),
    ('The Raging Sea', 1500, 16, 2, FALSE),
    ('The Pearl of the East', 1600, 17, 4, TRUE),
    ('Echoes Past', 1700, 18, 3, FALSE),
    ('The Kings Dilemma', 1800, 19, 1, TRUE),
    ('The Last Kingdom', 1400, 20, 2, FALSE),
    ('The Heart of Lanka', 1500, 21, 4, TRUE),
    ('The Dawn of Freedom', 1600, 22, 3, FALSE),
    ('The Moonlit Path', 1700, 23, 1, TRUE),
    ('Tales from the Temple', 1800, 24, 2, FALSE),
    ('The Silver Lining', 1400, 25, 3, TRUE),
    ('The Silent Forest', 1500, 26, 4, FALSE),
    ('Whispers', 1600, 27, 1, TRUE),
    ('The Flame of Revolution', 1700, 28, 2, FALSE),
    ('The Dark Garden', 1800, 29, 3, TRUE),
    ('The Burning Horizon', 1400, 30, 4, FALSE),
    ('The Sea', 1500, 31, 1, TRUE),
    ('The Secret of the Mountain', 1600, 32, 2, FALSE),
    ('The Fallen Kingdom', 1700, 33, 3, TRUE),
    ('The Story of the People', 1800, 34, 4, FALSE),
    ('The Legacy of the King', 1400, 35, 1, TRUE),
    ('The Last Light', 1500, 36, 2, FALSE),
    ('The Darkness', 1600, 37, 3, TRUE),
    ('The Ghost of the Empire', 1700, 38, 4, FALSE),
    ('The White Lotus', 1800, 39, 1, TRUE),
    ('The Path of the Immortals', 1400, 40, 2, FALSE),
    ('The Blue City', 1500, 41, 3, TRUE),
    ('The Songbird', 1600, 42, 4, FALSE),
    ('The Last Chance', 1700, 43, 1, TRUE),
    ('The Mark of the Beast', 1800, 44, 2, FALSE),
    ('The Land of Wonders', 1400, 45, 3, TRUE),
    ('The Path of the Hero', 1500, 46, 4, FALSE),
    ('The Crown of Fire', 1600, 47, 1, TRUE),
    ('The Shadow of the Tiger', 1700, 48, 2, FALSE),
    ('The Blood Moon', 1800, 49, 3, TRUE),
    ('The Last Hunt', 1400, 50, 4, FALSE);
	
-- insert customers
INSERT INTO customers (name, gender, age, city) VALUES
    ('Ayesha Fernando', 'Female', 28, 'Colombo'),
    ('Saman Perera', 'Male', 35, 'Kandy'),
    ('Nimali Jayasinghe', 'Female', 42, 'Galle'),
    ('Chandana Silva', 'Male', 26, 'Negombo'),
    ('Priyanka Abeysekera', 'Female', 31, 'Jaffna'),
    ('Tharindu Weerasinghe', 'Male', 29, 'Matara'),
    ('Lakmini Gunawardena', 'Female', 33, 'Kurunegala'),
    ('Vishal Kumar', 'Male', 24, 'Colombo'),
    ('Anushka Wijeratne', 'Female', 38, 'Ratnapura'),
    ('Roshan Mendis', 'Male', 27, 'Colombo'),
    ('Nadeesha Jayawardena', 'Female', 30, 'Colombo'),
    ('Ravindra Dissanayake', 'Male', 37, 'Galle'),
    ('Danushka Rajapaksha', 'Male', 41, 'Jaffna'),
    ('Dilani Perera', 'Female', 36, 'Anuradhapura'),
    ('Chathuri Fernando', 'Female', 32, 'Colombo'),
    ('Buddhika Senanayake', 'Male', 34, 'Kurunegala'),
    ('Sandun Wijesuriya', 'Male', 40, 'Puttalam'),
    ('Ruvini Silva', 'Female', 25, 'Kandy'),
    ('Dinesh Bandara', 'Male', 28, 'Vavuniya'),
    ('Samitha Gunasekara', 'Female', 22, 'Kalutara'),
    ('Ajantha Wickramasinghe', 'Female', 29, 'Colombo'),
    ('Ananda Silva', 'Male', 38, 'Kegalle'),
    ('Lakshitha Perera', 'Male', 30, 'Colombo'),
    ('Kasuni Nisansala', 'Female', 33, 'Gampaha'),
    ('Nimesh Bandara', 'Male', 27, 'Ratnapura'),
    ('Rukshan Jayarathne', 'Male', 35, 'Kandy'),
    ('Asela Tharanga', 'Male', 41, 'Colombo'),
    ('Suwandana Ruwanpathirana', 'Female', 25, 'Matara'),
    ('Ashan Dissanayake', 'Male', 28, 'Galle'),
    ('Sashini Bandara', 'Female', 24, 'Colombo'),
    ('Heshani Fernando', 'Female', 30, 'Kurunegala'),
    ('Dinesh Lakshan', 'Male', 37, 'Colombo'),
    ('Tashan Fernando', 'Male', 33, 'Puttalam'),
    ('Kavitha Kumari', 'Female', 29, 'Trincomalee'),
    ('Gayantha Perera', 'Male', 40, 'Batticaloa'),
    ('Neelani Rajapaksha', 'Female', 25, 'Colombo'),
    ('Nalaka Pradeep', 'Male', 29, 'Jaffna'),
    ('Nisal Kumar', 'Male', 28, 'Colombo'),
    ('Shalini Perera', 'Female', 26, 'Gampaha'),
    ('Janithra Jayasekara', 'Female', 30, 'Colombo'),
    ('Piyumal Gunathilake', 'Male', 37, 'Galle'),
    ('Indira Kumari', 'Female', 31, 'Kurunegala'),
    ('Sachintha Rajapaksha', 'Male', 29, 'Kandy'),
    ('Tharushi Mendis', 'Female', 28, 'Colombo'),
    ('Upeksha Samarasinghe', 'Female', 34, 'Anuradhapura'),
    ('Sahan Gunaratne', 'Male', 36, 'Kandy'),
    ('Shashika Perera', 'Female', 32, 'Colombo'),
    ('Krishna Priyanka', 'Female', 41, 'Matara'),
    ('Chaminda Silva', 'Male', 27, 'Negombo'),
    ('Tharindu Samarakoon', 'Male', 35, 'Kurunegala'),
    ('Nilani Silva', 'Female', 29, 'Jaffna'),
    ('Kasun Weerasinghe', 'Male', 32, 'Colombo'),
    ('Thivanka Rajapakse', 'Male', 38, 'Galle'),
    ('Sunanda Wijesekara', 'Female', 24, 'Colombo'),
    ('Bishara Perera', 'Female', 30, 'Kegalle'),
    ('Chamari Bandara', 'Female', 27, 'Galle'),
    ('Sahan Lakshan', 'Male', 33, 'Kurunegala'),
    ('Iresha Senanayake', 'Female', 35, 'Kandy'),
    ('Kanchana Jayasuriya', 'Female', 28, 'Vavuniya'),
    ('Yohan Perera', 'Male', 26, 'Jaffna'),
    ('Ravindra Lakshan', 'Male', 30, 'Colombo'),
    ('Madhushani Fernando', 'Female', 29, 'Matara'),
    ('Ruwan Priyankara', 'Male', 31, 'Puttalam'),
    ('Dulitha Jayasundara', 'Male', 33, 'Kurunegala'),
    ('Thilan Wijeratne', 'Male', 28, 'Ratnapura'),
    ('Yasoda Senanayake', 'Female', 32, 'Colombo'),
    ('Manori Fernando', 'Female', 30, 'Gampaha'),
    ('Sujith Perera', 'Male', 35, 'Colombo'),
    ('Kumari Wijesekara', 'Female', 41, 'Kandy'),
    ('Kasuni Perera', 'Female', 24, 'Jaffna'),
    ('Dimuthu Wijesekera', 'Female', 28, 'Galle'),
    ('Roshan Tharanga', 'Male', 33, 'Kurunegala'),
    ('Ruwantha Silva', 'Male', 30, 'Vavuniya'),
    ('Kanishka Rajapakse', 'Male', 29, 'Negombo'),
    ('Aruni De Silva', 'Female', 26, 'Colombo'),
    ('Upul Mendis', 'Male', 27, 'Colombo'),
    ('Nirasha Wijesekara', 'Female', 33, 'Puttalam'),
    ('Madhavi Mendis', 'Female', 38, 'Ratnapura'),
    ('Kasuni Jayasinghe', 'Female', 32, 'Matara'),
    ('Pradeep Priyanka', 'Male', 40, 'Galle'),
    ('Dilmi Perera', 'Female', 29, 'Vavuniya'),
    ('Amila Perera', 'Male', 34, 'Colombo'),
    ('Ishara Wijeratne', 'Female', 26, 'Kandy'),
    ('Ravindra Kumara', 'Male', 27, 'Trincomalee'),
    ('Janaka Mendis', 'Male', 33, 'Kalutara'),
    ('Anuradha Silva', 'Female', 30, 'Kurunegala'),
    ('Shammi Fernando', 'Female', 28, 'Puttalam'),
    ('Lakshan Rajapaksha', 'Male', 32, 'Colombo'),
    ('Pavithra Mendis', 'Female', 31, 'Matara'),
    ('Roshan Kumara', 'Male', 27, 'Jaffna'),
    ('Niroshan Perera', 'Male', 36, 'Galle'),
    ('Shani Wijesuriya', 'Female', 35, 'Colombo'),
    ('Ruvini Gunaratne', 'Female', 29, 'Ratnapura'),
    ('Chamathka Silva', 'Female', 25, 'Gampaha'),
    ('Nirosha Rajapakse', 'Female', 34, 'Colombo'),
    ('Sankalpa Perera', 'Male', 40, 'Jaffna'),
    ('Chulani Wijeratne', 'Female', 33, 'Puttalam'),
    ('Dasun Silva', 'Male', 29, 'Kalutara'),
    ('Samanthi Mendis', 'Female', 38, 'Colombo'),
    ('Sasitha Fernando', 'Male', 36, 'Colombo'),
    ('Sangeetha Perera', 'Female', 28, 'Ratnapura'),
    ('Anoma Jayasundara', 'Female', 33, 'Kandy'),
    ('Dilani Rajapaksha', 'Female', 32, 'Kurunegala'),
    ('Nandani Perera', 'Female', 40, 'Colombo'),
    ('Sahantha Wijesuriya', 'Male', 35, 'Galle'),
    ('Suhail Mendis', 'Male', 29, 'Ratnapura'),
    ('Nadeesha Gunaratne', 'Female', 31, 'Matara'),
    ('Roshan Perera', 'Male', 34, 'Colombo'),
    ('Anjali Kumari', 'Female', 28, 'Jaffna'),
    ('Mihiri Senanayake', 'Female', 25, 'Vavuniya'),
    ('Amila Jayasinghe', 'Male', 36, 'Negombo'),
    ('Kavisha Gunasekara', 'Female', 26, 'Gampaha'),
    ('Sashika Mendis', 'Female', 33, 'Colombo'),
    ('Anushka Perera', 'Female', 28, 'Kandy'),
    ('Chandima Wijeratne', 'Male', 41, 'Kurunegala'),
    ('Dilhani Weerasinghe', 'Female', 29, 'Matara'),
    ('Kasun Priyankara', 'Male', 32, 'Ratnapura'),
    ('Sahan Tharanga', 'Male', 27, 'Colombo'),
    ('Kumari Wijesekara', 'Female', 34, 'Galle'),
    ('Tharindu Mendis', 'Male', 39, 'Puttalam'),
    ('Chami Wijeratne', 'Female', 33, 'Colombo'),
    ('Samitha Rajapakse', 'Female', 30, 'Kandy'),
    ('Gihan Kumara', 'Male', 42, 'Jaffna'),
    ('Ruvini Rajapaksha', 'Female', 26, 'Kurunegala'),
    ('Heshan Perera', 'Male', 28, 'Vavuniya'),
    ('Roshani Gunathilake', 'Female', 35, 'Gampaha'),
    ('Sanjaya Rajapakse', 'Male', 31, 'Colombo'),
    ('Chathuri Kumari', 'Female', 40, 'Matara'),
    ('Nilantha Wijeratne', 'Male', 33, 'Colombo'),
    ('Sushila Perera', 'Female', 39, 'Negombo'),
    ('Iresha Gunasekara', 'Female', 27, 'Kurunegala'),
    ('Suren Lakshan', 'Male', 36, 'Vavuniya'),
    ('Thivanka Perera', 'Male', 32, 'Puttalam'),
    ('Ravindra Weerasinghe', 'Male', 34, 'Galle'),
    ('Lakshitha Kumara', 'Male', 31, 'Jaffna'),
    ('Anjani Priyashan', 'Female', 26, 'Matara'),
    ('Pramod Rajapaksha', 'Male', 30, 'Colombo'),
    ('Yasoda Wijesuriya', 'Female', 33, 'Colombo'),
    ('Tharushika Kumari', 'Female', 25, 'Ratnapura'),
    ('Bishara Gunaratne', 'Female', 28, 'Kalutara'),
    ('Haritha Perera', 'Female', 35, 'Gampaha'),
    ('Dinesh Bandara', 'Male', 31, 'Puttalam'),
    ('Ananda Wijeratne', 'Male', 40, 'Kurunegala'),
    ('Chamari Jayasinghe', 'Female', 30, 'Vavuniya'),
    ('Ajith Perera', 'Male', 36, 'Colombo'),
    ('Ruvani Mendis', 'Female', 29, 'Colombo'),
    ('Lihini Wijesuriya', 'Female', 33, 'Matara'),
    ('Chandana Senanayake', 'Male', 41, 'Ratnapura'),
    ('Kalpana Gunasekara', 'Female', 28, 'Galle'),
    ('Damayanthi Fernando', 'Female', 32, 'Negombo'),
    ('Vishal Tharanga', 'Male', 27, 'Jaffna'),
    ('Dilmi Wijeratne', 'Female', 39, 'Colombo'),
    ('Sakina Mendis', 'Female', 25, 'Gampaha'),
    ('Kasun Senanayake', 'Male', 31, 'Kurunegala'),
    ('Nadeeshika Perera', 'Female', 35, 'Kalutara'),
    ('Kanishka Gunaratne', 'Male', 28, 'Vavuniya'),
    ('Tharindu Wijesekara', 'Male', 32, 'Matara'),
    ('Ayesha Mendis', 'Female', 38, 'Puttalam'),
    ('Chandima Senanayake', 'Male', 33, 'Ratnapura'),
    ('Kasun Gunasekara', 'Male', 40, 'Kandy'),
    ('Sahran Tharanga', 'Male', 27, 'Colombo'),
    ('Sashi Wijesuriya', 'Female', 41, 'Kurunegala'),
    ('Sachintha Lakshan', 'Male', 29, 'Jaffna'),
    ('Renuka Perera', 'Female', 34, 'Colombo'),
    ('Nimesh Rajapakse', 'Male', 38, 'Galle'),
    ('Sathya Gunaratne', 'Female', 30, 'Ratnapura'),
    ('Ashantha Kumara', 'Male', 27, 'Matara'),
    ('Nalani Wijesekara', 'Female', 39, 'Colombo'),
    ('Jayantha Perera', 'Male', 32, 'Kurunegala'),
    ('Dinesh Silva', 'Male', 34, 'Negombo'),
    ('Madhushika Wijeratne', 'Female', 28, 'Gampaha'),
    ('Shavindri Perera', 'Female', 35, 'Puttalam'),
    ('Chamari Rajapakse', 'Female', 31, 'Colombo'),
    ('Rajeev Mendis', 'Male', 33, 'Kandy'),
    ('Harshini Wijesuriya', 'Female', 38, 'Jaffna'),
    ('Iresh Fernando', 'Male', 26, 'Galle'),
    ('Dilrukshi Perera', 'Female', 29, 'Matara'),
    ('Gamini Perera', 'Male', 37, 'Kurunegala'),
    ('Anuradha Gunaratne', 'Female', 32, 'Kalutara'),
    ('Chaminda Rajapaksha', 'Male', 31, 'Colombo'),
    ('Jayanthi Mendis', 'Female', 30, 'Ratnapura'),
    ('Sarath Wijeratne', 'Male', 35, 'Negombo'),
    ('Chathurika Fernando', 'Female', 27, 'Vavuniya'),
    ('Vishwa Gunasekara', 'Male', 28, 'Colombo'),
    ('Ramani Wijesuriya', 'Female', 39, 'Kurunegala'),
    ('Dilani Weerasinghe', 'Female', 41, 'Galle'),
    ('Kasun Wijeratne', 'Male', 30, 'Colombo'),
    ('Nayana Rajapakse', 'Female', 33, 'Kandy'),
    ('Ravindra Fernando', 'Male', 34, 'Vavuniya'),
    ('Madhavi Perera', 'Female', 27, 'Jaffna'),
    ('Sanishka Perera', 'Male', 29, 'Colombo'),
    ('Hemantha Wijesekara', 'Male', 31, 'Puttalam'),
    ('Amira Rajapaksha', 'Female', 32, 'Matara'),
    ('Pavithra Perera', 'Female', 35, 'Colombo'),
    ('Chamila Gunaratne', 'Female', 39, 'Galle'),
    ('Upeksha Mendis', 'Female', 27, 'Kurunegala'),
    ('Sahan Perera', 'Male', 28, 'Vavuniya'),
    ('Tharuka Mendis', 'Female', 33, 'Puttalam'),
    ('Chandima Perera', 'Male', 35, 'Jaffna'),
    ('Kalpani Rajapaksha', 'Female', 31, 'Colombo'),
    ('Bimal Gunasekara', 'Male', 27, 'Ratnapura'),
    ('Lakmini Wijesuriya', 'Female', 39, 'Matara'),
    ('Dinesh Kumara', 'Male', 32, 'Negombo'),
    ('Renuka Wijesekara', 'Female', 34, 'Kandy'),
    ('Samantha Perera', 'Male', 30, 'Gampaha'),
    ('Isura Rajapakse', 'Male', 28, 'Vavuniya'),
    ('Lasith Gunasekara', 'Male', 30, 'Kandy'),
    ('Dinali Perera', 'Female', 26, 'Colombo'),
    ('Hirantha Weerasinghe', 'Male', 33, 'Galle'),
    ('Nirmala Jayasekara', 'Female', 35, 'Jaffna'),
    ('Ruwani Bandara', 'Female', 29, 'Kurunegala'),
    ('Asanka Kumara', 'Male', 32, 'Matara'),
    ('Chamath Wickramasinghe', 'Male', 28, 'Negombo'),
    ('Ishani Wijesuriya', 'Female', 30, 'Puttalam'),
    ('Kavinda Lakshan', 'Male', 27, 'Ratnapura'),
    ('Nadeesha Senanayake', 'Female', 34, 'Kegalle'),
    ('Ravindu Silva', 'Male', 29, 'Kalutara'),
    ('Chandima Jayasinghe', 'Female', 31, 'Colombo'),
    ('Samadhi Fernando', 'Female', 24, 'Gampaha'),
    ('Ruwanthi Kumari', 'Female', 33, 'Anuradhapura'),
    ('Dulan Perera', 'Male', 36, 'Trincomalee'),
    ('Amal Jayasundara', 'Male', 37, 'Colombo'),
    ('Kasun Bandara', 'Male', 35, 'Kurunegala'),
    ('Sushila Weeraratne', 'Female', 28, 'Jaffna'),
    ('Nuwan Rajapaksha', 'Male', 26, 'Galle'),
    ('Ishanka Wijeratne', 'Female', 25, 'Colombo'),
    ('Manoj Dissanayake', 'Male', 29, 'Kandy'),
    ('Heshani Samarasinghe', 'Female', 34, 'Matara'),
    ('Praveen Silva', 'Male', 31, 'Puttalam'),
    ('Kavitha Fernando', 'Female', 38, 'Colombo'),
    ('Rajeev Wickramasinghe', 'Male', 27, 'Kalutara'),
    ('Nisal Gunaratne', 'Male', 29, 'Vavuniya'),
    ('Dilrukshi Bandara', 'Female', 33, 'Gampaha'),
    ('Ravini Priyanka', 'Female', 28, 'Ratnapura'),
    ('Haritha Jayasuriya', 'Male', 32, 'Kegalle'),
    ('Yasoda Kumari', 'Female', 30, 'Jaffna'),
    ('Shenali Wijesekara', 'Female', 35, 'Kurunegala'),
    ('Ishara Senanayake', 'Female', 29, 'Colombo'),
    ('Thilina Kumara', 'Male', 27, 'Matara'),
    ('Pasan Perera', 'Male', 32, 'Anuradhapura'),
    ('Rashmi Fernando', 'Female', 30, 'Kandy'),
    ('Damith Weerasinghe', 'Male', 36, 'Galle'),
    ('Sashini Dissanayake', 'Female', 34, 'Trincomalee'),
    ('Sajith Bandara', 'Male', 28, 'Colombo'),
    ('Sanduni Jayawardena', 'Female', 31, 'Puttalam'),
    ('Dilshani Kumari', 'Female', 29, 'Kurunegala'),
    ('Ashantha Wickramaratne', 'Male', 30, 'Ratnapura'),
    ('Tharindu Perera', 'Male', 32, 'Galle'),
    ('Samanthi Wijeratne', 'Female', 26, 'Kandy'),
    ('Amal Priyadarshana', 'Male', 38, 'Matara'),
    ('Prasad Jayasinghe', 'Male', 27, 'Negombo'),
    ('Kaveesha Silva', 'Female', 25, 'Colombo'),
    ('Anoma Gunasekara', 'Female', 30, 'Puttalam'),
    ('Chamari Bandara', 'Female', 33, 'Vavuniya'),
    ('Bimal Kumara', 'Male', 29, 'Kalutara'),
    ('Tharaka Rajapakse', 'Male', 34, 'Gampaha'),
    ('Renuka Mendis', 'Female', 28, 'Colombo'),
    ('Janaka Perera', 'Male', 31, 'Kandy'),
    ('Madhushi Gunaratne', 'Female', 29, 'Matara'),
    ('Sahan Wijesuriya', 'Male', 27, 'Puttalam'),
    ('Iresha Senanayake', 'Female', 30, 'Anuradhapura'),
    ('Harsha Jayawardena', 'Male', 33, 'Galle'),
    ('Ruvini Rajapaksha', 'Female', 35, 'Trincomalee'),
    ('Dilan Weeraratne', 'Male', 36, 'Kurunegala'),
    ('Shanika Kumari', 'Female', 28, 'Ratnapura'),
    ('Sanjeewa Lakshan', 'Male', 29, 'Kegalle'),
    ('Ruwani Dissanayake', 'Female', 31, 'Colombo'),
    ('Amaya Perera', 'Female', 26, 'Kalutara'),
    ('Lasantha Gunasekara', 'Male', 30, 'Jaffna'),
    ('Dilini Wijesinghe', 'Female', 27, 'Colombo'),
    ('Ajith Mendis', 'Male', 34, 'Matara'),
    ('Chandima Jayasundara', 'Male', 38, 'Kandy'),
    ('Rashmi Wickramaratne', 'Female', 35, 'Puttalam'),
    ('Chamara Silva', 'Male', 36, 'Galle'),
    ('Lakmini Wijesekara', 'Female', 30, 'Negombo'),
    ('Shehan Dissanayake', 'Male', 27, 'Kegalle'),
    ('Amila Weerasinghe', 'Male', 28, 'Colombo'),
    ('Kumari Gunaratne', 'Female', 32, 'Trincomalee'),
    ('Buddhika Bandara', 'Male', 29, 'Kurunegala'),
    ('Naveen Senanayake', 'Male', 35, 'Matara'),
    ('Shenal Fernando', 'Male', 33, 'Jaffna'),
    ('Himasha Kumari', 'Female', 29, 'Kandy'),
    ('Charitha Jayasinghe', 'Female', 26, 'Colombo'),
    ('Ruvindi Priyashan', 'Female', 30, 'Kalutara'),
    ('Roshan Rajapakse', 'Male', 34, 'Puttalam'),
    ('Dilanka Perera', 'Male', 32, 'Gampaha'),
    ('Manjula Senaratne', 'Male', 37, 'Ratnapura'),
    ('Shalini Mendis', 'Female', 33, 'Colombo'),
    ('Ajith Wijeratne', 'Male', 28, 'Anuradhapura'),
    ('Kasun Rajapaksha', 'Male', 31, 'Galle'),
    ('Tharushi Silva', 'Female', 29, 'Kandy'),
    ('Lasitha Gunasekara', 'Male', 30, 'Matara'),
    ('Ashan Wijesinghe', 'Male', 35, 'Negombo'),
    ('Mihira Jayasundara', 'Male', 34, 'Trincomalee'),
    ('Sanjaya Kumara', 'Male', 27, 'Kalutara'),
    ('Dilumi Weeraratne', 'Female', 25, 'Gampaha'),
    ('Ashani Karunaratne', 'Female', 25, 'Kandy'),
    ('Pradeep Gunasekara', 'Male', 34, 'Matara'),
    ('Malitha Senanayake', 'Male', 29, 'Kurunegala'),
    ('Sanduni Priyashan', 'Female', 27, 'Jaffna'),
    ('Isuru Mendis', 'Male', 30, 'Ratnapura'),
    ('Thilini Gunathilaka', 'Female', 28, 'Galle'),
    ('Damith Wickramasinghe', 'Male', 35, 'Vavuniya'),
    ('Piumi Jayawardena', 'Female', 31, 'Colombo'),
    ('Kalum Dissanayake', 'Male', 32, 'Kegalle'),
    ('Ishara Samarasinghe', 'Female', 33, 'Kalutara'),
    ('Nuwan Perera', 'Male', 37, 'Negombo'),
    ('Chamathka Kumari', 'Female', 26, 'Trincomalee'),
    ('Ravindu Fernando', 'Male', 28, 'Batticaloa'),
    ('Anjali Wijesinghe', 'Female', 30, 'Puttalam'),
    ('Chinthaka Silva', 'Male', 29, 'Colombo'),
    ('Suhara Kumari', 'Female', 34, 'Anuradhapura'),
    ('Ruwanthi Perera', 'Female', 27, 'Kandy'),
    ('Lakshan Rajapaksha', 'Male', 40, 'Matara'),
    ('Sumith Bandara', 'Male', 41, 'Galle'),
    ('Dilki Jayasinghe', 'Female', 24, 'Colombo'),
    ('Malith Perera', 'Male', 31, 'Colombo'),
    ('Sachini Bandara', 'Female', 28, 'Gampaha'),
    ('Nuwan Jayasuriya', 'Male', 35, 'Kandy'),
    ('Thilini Kumari', 'Female', 27, 'Kurunegala'),
    ('Dhanushka Silva', 'Male', 33, 'Galle'),
    ('Harini Fernando', 'Female', 29, 'Matara'),
    ('Janith Wickramasinghe', 'Male', 34, 'Ratnapura'),
    ('Shanika Rajapaksa', 'Female', 30, 'Puttalam'),
    ('Roshan Weerasinghe', 'Male', 36, 'Jaffna'),
    ('Niluka Gunasekara', 'Female', 26, 'Kalutara'),
    ('Dushan Senanayake', 'Male', 29, 'Colombo'),
    ('Isuri Wijeratne', 'Female', 32, 'Anuradhapura'),
    ('Damith Lakshan', 'Male', 37, 'Galle'),
    ('Kasuni Jayasinghe', 'Female', 35, 'Trincomalee'),
    ('Nadeesha Samarasinghe', 'Female', 28, 'Kegalle'),
    ('Ravindu Gunaratne', 'Male', 27, 'Kandy'),
    ('Chamodi Wijesinghe', 'Female', 30, 'Matara'),
    ('Lakshan Perera', 'Male', 33, 'Colombo'),
    ('Supun Rajapakse', 'Male', 36, 'Negombo'),
    ('Dilani Bandara', 'Female', 31, 'Gampaha'),
    ('Sanjeewa Dissanayake', 'Male', 34, 'Kalutara'),
    ('Iresha Jayasundara', 'Female', 29, 'Ratnapura'),
    ('Heshan Wickramaratne', 'Male', 28, 'Kegalle'),
    ('Upeksha Silva', 'Female', 35, 'Colombo'),
    ('Buddhika Weerasinghe', 'Male', 27, 'Kurunegala'),
    ('Kalpa Priyadarshana', 'Male', 32, 'Galle'),
    ('Samudra Fernando', 'Female', 33, 'Kandy'),
    ('Janaka Perera', 'Male', 36, 'Matara'),
    ('Chamari Senaratne', 'Female', 30, 'Puttalam'),
    ('Ruwan Wijesinghe', 'Male', 29, 'Jaffna'),
    ('Amali Samarasinghe', 'Female', 27, 'Kalutara'),
    ('Ishan Kumara', 'Male', 34, 'Trincomalee'),
    ('Ashan Gunasekara', 'Male', 31, 'Colombo'),
    ('Tharushi Jayasuriya', 'Female', 28, 'Gampaha'),
    ('Mihiri Kumari', 'Female', 29, 'Ratnapura'),
    ('Tharaka Bandara', 'Male', 36, 'Kegalle'),
    ('Isanka Dissanayake', 'Male', 33, 'Galle'),
    ('Shehani Jayawardena', 'Female', 27, 'Anuradhapura'),
    ('Amith Weeraratne', 'Male', 35, 'Kurunegala'),
    ('Pasan Lakshan', 'Male', 28, 'Matara'),
    ('Sashini Silva', 'Female', 32, 'Kandy'),
    ('Ruwini Wijeratne', 'Female', 30, 'Negombo'),
    ('Nirmal Gunaratne', 'Male', 37, 'Colombo'),
    ('Chandima Rajapakse', 'Female', 29, 'Kalutara'),
    ('Rasika Senanayake', 'Male', 34, 'Puttalam'),
    ('Samanthi Wickramasinghe', 'Female', 28, 'Gampaha'),
    ('Anjana Perera', 'Male', 33, 'Ratnapura'),
    ('Nadeeka Wijesuriya', 'Female', 31, 'Kegalle'),
    ('Sudeera Samarasinghe', 'Male', 36, 'Galle'),
    ('Amal Perera', 'Male', 32, 'Trincomalee'),
    ('Samadhi Fernando', 'Female', 30, 'Kurunegala'),
    ('Harsha Gunasekara', 'Male', 27, 'Matara'),
    ('Dilumi Lakshan', 'Female', 34, 'Jaffna'),
    ('Shenal Bandara', 'Male', 29, 'Kandy'),
    ('Kasun Rajapakse', 'Male', 37, 'Colombo'),
    ('Ishani Wijesinghe', 'Female', 28, 'Puttalam'),
    ('Bimal Senaratne', 'Male', 35, 'Kalutara'),
    ('Rashmi Jayasundara', 'Female', 32, 'Kegalle'),
    ('Dineth Wijeratne', 'Male', 30, 'Negombo'),
    ('Damayanthi Perera', 'Female', 36, 'Gampaha'),
    ('Thilanka Weeraratne', 'Male', 31, 'Kandy'),
    ('Amila Samarasinghe', 'Male', 34, 'Matara'),
    ('Kumari Wickramaratne', 'Female', 27, 'Trincomalee'),
    ('Tharindu Silva', 'Male', 29, 'Ratnapura'),
    ('Dulani Gunaratne', 'Female', 33, 'Colombo'),
    ('Manoj Jayasuriya', 'Male', 28, 'Kurunegala'),
    ('Thilini Kumari', 'Female', 35, 'Galle'),
    ('Shehan Perera', 'Male', 37, 'Matara'),
    ('Praveen Senanayake', 'Male', 30, 'Puttalam'),
    ('Kasuni Rajapakse', 'Female', 28, 'Gampaha'),
    ('Ruwani Bandara', 'Female', 33, 'Kalutara'),
    ('Kaveesha Wickramasinghe', 'Female', 31, 'Colombo'),
    ('Ranjan Gunasekara', 'Male', 34, 'Ratnapura'),
    ('Chamath Kumara', 'Male', 29, 'Kandy'),
    ('Kumudu Fernando', 'Female', 26, 'Trincomalee'),
    ('Roshan Wijesekara', 'Male', 32, 'Matara'),
    ('Anusha Jayasundara', 'Female', 31, 'Kurunegala'),
    ('Hiruni Gunaratne', 'Female', 29, 'Puttalam'),
    ('Ravindu Weerasinghe', 'Male', 35, 'Galle'),
    ('Chamila Perera', 'Female', 27, 'Negombo'),
    ('Sandeep Wickramaratne', 'Male', 36, 'Colombo'),
    ('Amaya Senanayake', 'Female', 30, 'Kalutara'),
    ('Dilan Kumara', 'Male', 28, 'Gampaha'),
    ('Damith Gunasekara', 'Male', 33, 'Kandy'),
    ('Udaya Wijesinghe', 'Male', 34, 'Matara'),
    ('Ruwanthi Samarasinghe', 'Female', 29, 'Kurunegala'),
    ('Harini Jayasuriya', 'Female', 31, 'Trincomalee'),
    ('Sajith Lakshan', 'Male', 27, 'Ratnapura');

-- insert bookcart
INSERT INTO bookcart (customerid, bookid, amount) VALUES
    (1, 5, 2),
    (1, 8, 1),
    (1, 12, 1),
    (2, 6, 3),
    (2, 7, 1),
    (2, 10, 2),
    (3, 5, 2),
    (3, 9, 1),
    (3, 15, 1),
    (4, 11, 4),
    (4, 6, 2),
    (4, 12, 1),
    (5, 10, 3),
    (5, 13, 1),
    (5, 14, 2),
    (6, 8, 1),
    (6, 9, 4),
    (6, 7, 2),
    (7, 5, 2),
    (7, 15, 3),
    (7, 14, 1),
    (8, 16, 1),
    (8, 17, 2),
    (8, 12, 1),
    (9, 18, 1),
    (9, 19, 3),
    (9, 14, 2),
    (10, 21, 2),
    (10, 22, 1),
    (11, 23, 4),
    (11, 24, 1),
    (11, 5, 2),
    (12, 7, 3),
    (12, 25, 1),
    (12, 6, 2),
    (13, 28, 1),
    (13, 30, 2),
    (13, 17, 1),
    (14, 31, 1),
    (14, 32, 2),
    (14, 23, 3),
    (15, 18, 2),
    (15, 20, 1),
    (15, 25, 1),
    (16, 9, 1),
    (16, 14, 2),
    (16, 33, 1),
    (17, 6, 2),
    (17, 19, 1),
    (17, 5, 3),
    (18, 12, 2),
    (18, 20, 3),
    (18, 8, 1),
    (19, 25, 2),
    (19, 26, 1),
    (19, 14, 3),
    (20, 13, 1),
    (20, 7, 3),
    (20, 6, 2),
    (21, 21, 1),
    (21, 19, 2),
    (21, 5, 2),
    (22, 16, 1),
    (22, 17, 3),
    (22, 27, 2),
    (23, 4, 1),
    (23, 28, 2),
    (23, 6, 1),
    (24, 30, 1),
    (24, 9, 3),
    (24, 5, 1),
    (25, 20, 2),
    (25, 24, 3),
    (26, 1, 2),
    (26, 7, 1),
    (27, 9, 2),
    (27, 15, 1),
    (27, 13, 2),
    (28, 10, 3),
    (28, 5, 2),
    (28, 17, 1),
    (29, 14, 2),
    (29, 8, 3),
    (29, 4, 1),
    (30, 16, 1),
    (30, 22, 2),
    (30, 11, 1),
    (31, 21, 3),
    (31, 27, 1),
    (31, 6, 2),
    (32, 5, 1),
    (32, 10, 3),
    (32, 28, 1),
    (33, 2, 2),
    (33, 24, 1),
    (33, 13, 3),
    (34, 30, 1),
    (34, 14, 4),
    (34, 16, 2),
    (35, 9, 3),
    (35, 25, 2),
    (35, 18, 1),
    (36, 6, 4),
    (36, 12, 3),
    (36, 20, 1),
    (37, 15, 1),
    (37, 19, 3),
    (37, 9, 2),
    (38, 4, 3),
    (38, 13, 1),
    (38, 16, 2),
    (39, 5, 4),
    (39, 20, 3),
    (39, 18, 1),
    (40, 10, 2),
    (40, 11, 1),
    (40, 15, 3),
    (41, 8, 2),
    (41, 25, 1),
    (41, 5, 1),
    (42, 6, 1),
    (42, 7, 3),
    (42, 17, 2),
    (43, 24, 3),
    (43, 12, 1),
    (43, 19, 4),
    (44, 9, 1),
    (44, 22, 2),
    (44, 5, 2),
    (45, 14, 3),
    (45, 27, 1),
    (45, 10, 2),
    (46, 8, 4),
    (46, 7, 2),
    (47, 11, 3),
    (47, 25, 1),
    (47, 2, 4),
    (48, 21, 2),
    (48, 13, 1),
    (48, 12, 2),
    (49, 5, 2),
    (49, 14, 3),
    (49, 16, 1),
    (50, 10, 1),
    (50, 6, 4),
    (50, 27, 2),
    (51, 17, 1),
    (51, 8, 2),
    (51, 5, 3),
    (52, 13, 2),
    (52, 25, 1),
    (52, 6, 1),
    (53, 22, 3),
    (53, 18, 1),
    (53, 9, 4),
    (54, 5, 3),
    (54, 7, 2),
    (54, 15, 1),
    (55, 6, 1),
    (55, 10, 2),
    (55, 13, 3),
    (56, 1, 2),
    (56, 25, 1),
    (56, 7, 1),
    (57, 3, 2),
    (57, 12, 4),
    (57, 17, 2),
    (58, 14, 1),
    (58, 6, 3),
    (58, 9, 1),
    (59, 21, 3),
    (59, 10, 1),
    (59, 13, 2),
    (60, 20, 2),
    (60, 9, 1),
    (60, 5, 3),
    (61, 14, 3),
    (61, 25, 1),
    (61, 18, 2),
    (62, 3, 1),
    (62, 17, 4),
    (62, 7, 3),
    (63, 4, 2),
    (63, 13, 3),
    (63, 12, 2),
    (64, 6, 1),
    (64, 10, 3),
    (64, 16, 1),
    (65, 20, 2),
    (65, 18, 1),
    (65, 12, 3),
    (66, 5, 1),
    (66, 11, 4),
    (66, 2, 3),
    (67, 6, 2),
    (67, 25, 1),
    (67, 3, 2),
    (68, 7, 3),
    (68, 16, 1),
    (68, 9, 1),
    (69, 20, 2),
    (69, 18, 2),
    (69, 5, 1),
    (70, 12, 3),
    (70, 7, 2),
    (70, 25, 1),
    (71, 2, 1),
    (71, 16, 3),
    (71, 6, 2),
    (72, 25, 1),
    (72, 19, 3),
    (72, 5, 4),
    (73, 4, 2),
    (73, 5, 1),
    (73, 6, 3),
    (74, 7, 2),
    (74, 8, 1),
    (74, 9, 3),
    (75, 10, 4),
    (75, 11, 2),
    (75, 12, 1),
    (76, 13, 3),
    (76, 14, 2),
    (76, 15, 1),
    (77, 16, 4),
    (77, 17, 2),
    (77, 18, 3),
    (78, 19, 1),
    (78, 20, 2),
    (78, 21, 1),
    (79, 22, 3),
    (79, 23, 2),
    (79, 24, 1),
    (80, 25, 3),
    (80, 26, 2),
    (80, 27, 1),
    (81, 28, 4),
    (81, 29, 3),
    (81, 30, 1),
    (82, 31, 2),
    (82, 32, 4),
    (82, 33, 1),
    (83, 34, 3),
    (83, 35, 2),
    (83, 36, 1),
    (84, 37, 4),
    (84, 38, 3),
    (84, 39, 2),
    (85, 40, 1),
    (85, 41, 2),
    (85, 42, 4),
    (86, 43, 3),
    (86, 44, 1),
    (86, 45, 2),
    (87, 46, 4),
    (87, 47, 2),
    (87, 48, 1),
    (88, 49, 3),
    (88, 50, 1),
    (88, 51, 4),
    (89, 52, 2),
    (89, 53, 3),
    (89, 54, 1),
    (90, 55, 3),
    (90, 56, 2),
    (90, 57, 1),
    (91, 58, 4),
    (91, 59, 1),
    (91, 60, 2),
    (92, 61, 3),
    (92, 62, 4),
    (92, 63, 1),
    (93, 64, 2),
    (93, 65, 3),
    (93, 66, 4),
    (94, 67, 1),
    (94, 68, 3),
    (94, 69, 2),
    (95, 70, 4),
    (95, 71, 1),
    (95, 72, 3),
    (96, 73, 2),
    (96, 74, 4),
    (96, 75, 3),
    (97, 76, 1),
    (97, 77, 3),
    (97, 78, 2),
    (98, 79, 4),
    (98, 80, 1),
    (98, 81, 3),
    (99, 82, 2),
    (99, 83, 4),
    (99, 84, 1),
    (100, 85, 2),
    (100, 86, 3),
    (100, 87, 1),
    (101, 88, 4),
    (101, 89, 1),
    (101, 90, 2),
    (102, 91, 3),
    (102, 92, 2),
    (102, 93, 1),
    (103, 94, 4),
    (103, 95, 3),
    (103, 96, 2),
    (104, 97, 1),
    (104, 98, 4),
    (104, 99, 3),
    (105, 100, 2),
    (105, 101, 4),
    (105, 102, 1),
    (106, 103, 3),
    (106, 104, 2),
    (106, 105, 1),
    (107, 106, 4),
    (107, 107, 2),
    (107, 108, 3),
    (108, 109, 1),
    (108, 110, 3),
    (108, 111, 2),
    (109, 112, 4),
    (109, 113, 1),
    (109, 114, 2),
    (110, 115, 3),
    (110, 116, 1),
    (110, 117, 2),
    (111, 118, 4),
    (111, 119, 3),
    (111, 120, 1);

select  count(*) from bookcart;

select * from payment;



--queries

--daily sales
SELECT DATE(paid_date) AS sale_date, SUM(totalprice) AS total_sales
FROM paid
GROUP BY DATE(paid_date)
ORDER BY sale_date;

--top selling books
SELECT b.title, SUM(bc.amount) AS total_sold
FROM bookcart bc
JOIN books b ON bc.bookid = b.id
GROUP BY b.title
ORDER BY total_sold DESC
LIMIT 5;

--active customers
SELECT DISTINCT c.id, c.name
FROM customers c
JOIN bookcart bc ON c.id = bc.customerid
WHERE bc.bookid IS NOT NULL;

--purchase history
SELECT p.customerid, SUM(p.totalamount) AS total_spent
FROM payment p
GROUP BY p.customerid
ORDER BY total_spent DESC;

--low stock
SELECT b.title, b.price, b.availability
FROM books b
WHERE b.availability = FALSE;

--books by author
SELECT a.name AS author_name, b.title, b.price
FROM books b
JOIN authors a ON b.authorid = a.id
WHERE a.name = 'Amal Perera';

--sales lang
SELECT l.language, SUM(bc.amount * b.price) AS total_sales
FROM bookcart bc
JOIN books b ON bc.bookid = b.id
JOIN languages l ON b.languageid = l.id
GROUP BY l.language;

--author perform
SELECT a.name AS author_name, SUM(bc.amount * b.price) AS total_sales
FROM bookcart bc
JOIN books b ON bc.bookid = b.id
JOIN authors a ON b.authorid = a.id
GROUP BY a.name;

--customer payment
SELECT p.customerid, SUM(p.totalamount) AS total_paid
FROM payment p
GROUP BY p.customerid;


--gender base
SELECT c.gender, COUNT(bc.bookid) AS total_books_bought, SUM(bc.amount * b.price) AS total_spent
FROM bookcart bc
JOIN books b ON bc.bookid = b.id
JOIN customers c ON bc.customerid = c.id
GROUP BY c.gender;







-- secondary indexes
CREATE INDEX idx_author_name ON authors (name);

EXPLAIN SELECT * FROM authors WHERE name = 'J.K. Rowling';


CREATE INDEX idx_bookcart_customer ON bookcart (customerid);

EXPLAIN SELECT * FROM bookcart WHERE customerid = 100;



-- multi indexes
CREATE INDEX idx_age_city ON customers (age, city);

EXPLAIN SELECT * FROM customers WHERE age = 25 AND city = 'Galle';


CREATE INDEX idx_payment_customer_date ON payment (customerid, payment_date);

SELECT * FROM payment WHERE customerid = 60 AND payment_date = '2024-12-29';


CREATE INDEX idx_book_qty ON bookcart (bookid, amount);

EXPLAIN SELECT * FROM bookcart WHERE bookid = 10 AND amount > 1;







-- function insert bookcart

CREATE OR REPLACE FUNCTION check_book_availability() 
RETURNS TRIGGER AS $$
BEGIN
    -- Check if the book is available
    IF NOT EXISTS (SELECT 1 FROM books WHERE id = NEW.bookid AND availability = TRUE) THEN
        RAISE EXCEPTION 'Book ID % is not available.', NEW.bookid;
    END IF;

    RAISE NOTICE 'Book added to cart successfully.';
	
    -- Allow the insert to proceed
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_bookcart
BEFORE INSERT ON bookcart
FOR EACH ROW
EXECUTE FUNCTION check_book_availability();

INSERT INTO bookcart (customerid, bookid, amount) VALUES (401, 906, 1);






-- function for total amount
CREATE OR REPLACE FUNCTION calculate_total_amount() 
RETURNS TRIGGER AS $$
DECLARE
    total NUMERIC(10, 2);
BEGIN
    -- Calculate total amount for the customer
    SELECT SUM(b.price * bc.amount) 
    INTO total
    FROM bookcart bc
    JOIN books b ON bc.bookid = b.id
    WHERE bc.customerid = NEW.customerid;

    -- If the payment record exists, update it
    IF EXISTS (SELECT 1 FROM payment WHERE customerid = NEW.customerid) THEN
        UPDATE payment
        SET totalamount = total
        WHERE customerid = NEW.customerid;
    ELSE
        -- If the payment record doesn't exist, insert a new one
        INSERT INTO payment (customerid, totalamount)
        VALUES (NEW.customerid, total);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_payment_total
AFTER INSERT OR UPDATE ON bookcart
FOR EACH ROW
EXECUTE FUNCTION calculate_total_amount();




-- procedure for bookcart inser
CREATE OR REPLACE PROCEDURE insert_book_to_cart(
    p_customerid INT,
    p_bookid INT,
    p_amount INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Check if the book is available
    IF NOT EXISTS (SELECT 1 FROM books WHERE id = p_bookid AND availability = TRUE) THEN
        -- If the book is not available, raise a notice (not an exception)
        RAISE NOTICE 'Book ID % is not available.', p_bookid;
        -- Exit the procedure without inserting the record
        RETURN;
    END IF;

    -- If the book is available, insert into the bookcart
    INSERT INTO bookcart (customerid, bookid, amount)
    VALUES (p_customerid, p_bookid, p_amount);

    -- Optionally, you could return a message or the inserted row
    RAISE NOTICE 'Book added to cart: % (Amount: %)', p_bookid, p_amount;
END;
$$;

CALL insert_book_to_cart(100,13,1);





-- paid transaction
CREATE OR REPLACE PROCEDURE paid_transaction(p_customerid INT)
LANGUAGE plpgsql
AS $$
DECLARE
    total_amount NUMERIC(10, 2);
BEGIN
    -- Start transaction explicitly
    BEGIN 
        -- Step 1: Retrieve total amount
        SELECT totalamount 
        INTO total_amount
        FROM payment
        WHERE customerid = p_customerid;

        -- Check if payment exists
        IF NOT FOUND THEN
            RAISE NOTICE 'No payment record found for customer ID %.', p_customerid;
            RETURN;
        END IF;
        RAISE NOTICE 'Total amount for customer ID %: %', p_customerid, total_amount;

        -- Step 2: Insert into paid table
        INSERT INTO paid (customerid, totalprice, paid_date) 
        VALUES (p_customerid, total_amount, NOW());

        -- Step 3: Delete from payment table
        DELETE FROM payment WHERE customerid = p_customerid;

        -- Step 4: Delete from bookcart table
        DELETE FROM bookcart WHERE customerid = p_customerid;

        -- Commit transaction
        RAISE NOTICE 'Transaction completed successfully for customer ID %.', p_customerid;
		

    EXCEPTION WHEN OTHERS THEN
        -- Rollback transaction if any error occurs
        RAISE NOTICE 'Transaction failed.';
        ROLLBACK;
    END;
END;
$$;

CALL paid_transaction(151);

SELECT * FROM paid;





-- author insert
CREATE OR REPLACE PROCEDURE insert_author(
    p_name VARCHAR(50),
    p_gender VARCHAR(10),
    p_city VARCHAR(25)
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Attempt to insert the author
    BEGIN
        INSERT INTO authors (name, gender, city)
        VALUES (p_name, p_gender, p_city);

        -- Success notice
        RAISE NOTICE 'Author "%" inserted successfully.', p_name;
    EXCEPTION WHEN UNIQUE_VIOLATION THEN
        -- Handle unique 
        RAISE NOTICE 'Insertion failed. Author "% already exists.', p_name;
    WHEN OTHERS THEN
        -- Handle other unexpected errors
        RAISE NOTICE 'An error occurred';
    END;
END;
$$;

CALL insert_author('Kumuduni Ariyawansha', 'Female', 'Polonnaruwa');

select * from authors;


-- author update
CREATE OR REPLACE PROCEDURE update_author(
    p_id INT,
    p_name VARCHAR(50) DEFAULT NULL,
    p_gender VARCHAR(10) DEFAULT NULL,
    p_city VARCHAR(25) DEFAULT NULL
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Attempt to update the author
    BEGIN
        -- Check if the author exists
        IF NOT EXISTS (SELECT 1 FROM authors WHERE id = p_id) THEN
            RAISE NOTICE 'Update failed. Author with ID % does not exist.', p_id;
            RETURN;
        END IF;

        -- Update the author's details (only non-NULL values)
        UPDATE authors
        SET 
            name = COALESCE(p_name, name),
            gender = COALESCE(p_gender, gender),
            city = COALESCE(p_city, city)
        WHERE id = p_id;

        -- Success notice
        RAISE NOTICE 'Author with ID % updated successfully.', p_id;
    EXCEPTION WHEN UNIQUE_VIOLATION THEN
        -- Handle unique constraint violation for the name field
        RAISE NOTICE 'Update failed. Author name "%" already exists.', p_name;
    WHEN OTHERS THEN
        -- Handle other unexpected errors
        RAISE NOTICE 'An error occurred';
    END;
END;
$$;

CALL update_author(271, 'Kumuduni Ariyawansha', 'Female', 'kakirawa');




-- book delete
CREATE OR REPLACE PROCEDURE delete_book(p_bookid INT)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Check if the book exists
    IF NOT EXISTS (SELECT 1 FROM books WHERE id = p_bookid) THEN
        RAISE NOTICE 'Book with ID % does not exist.', p_bookid;
        RETURN;
    END IF;

    -- Optionally, delete related entries in the bookcart table
    DELETE FROM bookcart
    WHERE bookid = p_bookid;

    -- Delete the book from the books table
    DELETE FROM books
    WHERE id = p_bookid;

    RAISE NOTICE 'Book with ID % deleted successfully.', p_bookid;
END;
$$;

CALL delete_book(3);




CREATE OR REPLACE FUNCTION get_sales_by_date()
RETURNS TABLE (sale_date DATE, total_sales NUMERIC) AS $$
BEGIN
    RETURN QUERY
    SELECT DATE(paid_date) AS sale_date, SUM(totalprice) AS total_sales
    FROM paid
    GROUP BY DATE(paid_date)
    ORDER BY sale_date;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_sales_by_date();




CREATE OR REPLACE PROCEDURE calculate_author_sales()
LANGUAGE plpgsql AS $$
DECLARE
    author_name TEXT;
    total_sales NUMERIC;
BEGIN
    -- RAISE NOTICE for clarity
    RAISE NOTICE 'Calculating Author Sales...';

    FOR author_name, total_sales IN 
        SELECT a.name, SUM(bc.amount * b.price)
        FROM bookcart bc
        JOIN books b ON bc.bookid = b.id
        JOIN authors a ON b.authorid = a.id
        GROUP BY a.name
    LOOP
        RAISE NOTICE 'Author: % ==> Total: %', author_name, total_sales;
    END LOOP;
END;
$$;

CALL calculate_author_sales();




-- Select total sales grouped by language
CREATE OR REPLACE PROCEDURE calculate_sales_by_language()
LANGUAGE plpgsql
AS $$
DECLARE
    language TEXT;  
    total_sales NUMERIC; 
BEGIN
    
    RAISE NOTICE 'Sales by language:';
    FOR language, total_sales IN 
        SELECT l.language, SUM(bc.amount * b.price)
        FROM bookcart bc
        JOIN books b ON bc.bookid = b.id
        JOIN languages l ON b.languageid = l.id
        GROUP BY l.language
    LOOP
        RAISE NOTICE 'Language: %           Total Sales: %', language, total_sales;
    END LOOP;
END;
$$;

CALL calculate_sales_by_language();





-- language transaction
DO $$
BEGIN
    -- Check if the language exists in the table
    IF NOT EXISTS (SELECT 1 FROM languages WHERE language = 'Hindi') THEN

        INSERT INTO languages (language)
        VALUES ('Hindi');

        COMMIT;
        RAISE NOTICE 'Language inserted and transaction committed successfully.';
    ELSE
        ROLLBACK;
        RAISE NOTICE 'Transaction rolled back: Language already exists.';
    END IF;
END;
$$;

select * from languages;

