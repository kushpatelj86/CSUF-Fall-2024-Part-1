--CREATE DATABASE Library--
--USE Library

		--CREATE TABLES--
CREATE TABLE LIBRARY_BRANCH(
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BranchName varchar(50) NOT NULL,
	[Address] varchar(100)
);

CREATE TABLE PUBLISHER(
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(50),
	Phone VARCHAR(20)
);

CREATE TABLE BOOKS(
	BookID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Title VARCHAR(100) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT
		fk_PublisherName FOREIGN KEY REFERENCES PUBLISHER(PublisherName)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE BOOK_AUTHORS(
	BookID INT NOT NULL CONSTRAINT
		fk_BookID FOREIGN KEY REFERENCES BOOKS(BookID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE BOOK_COPIES(
	BookID INT NOT NULL CONSTRAINT
		fk_BookID1 FOREIGN KEY REFERENCES BOOKS(BookID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT
		fk_BranchID FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);

CREATE TABLE BORROWER(
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(100,1),
	[Name] VARCHAR(50) NOT NULL,
	[Address] VARCHAR(50),
	Phone VARCHAR(20) NOT NULL
);

CREATE TABLE BOOK_LOANS(
	BookID INT NOT NULL CONSTRAINT
		fk_BookID2 FOREIGN KEY REFERENCES BOOKS(BookID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT
		fk_BranchID1 FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT
		fk_CardNo FOREIGN KEY REFERENCES BORROWER(CardNo)
		ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE,
	DateDue DATE
);

		--INSERTS--
INSERT INTO LIBRARY_BRANCH
	(BranchName, [Address])
VALUES 
	('Sharpstown', '7660 Clarewood Dr, Houston, TX'),
	('Central', '801 SW 10th Ave, Portland, OR'),
	('Bethany', '15325 Northwest Central Drive, Portland, OR'),
	('Camas', '625 NE 4th Ave, Camas, WA')
;

INSERT INTO PUBLISHER
	(PublisherName, [Address], Phone)
VALUES
	('Thomas Nelson', '501 Nelson Pl, Nashville, TN', '(615) 889-9000'),
	('Anchor', '255 Newport Dr BC Canada', '+1 604-461-8521'),
	('Algonquin Books', 'Chapel Hill, NC 27515', '919-967-0108'),
	('Little, Brown and Company', '1290 6th Ave, New York, NY 10104', '1 (800) 759-0190'),
	('Knopf Doubleday Publishing Group', '1745 Broadway New York, NY 10019', '(212) 940-7390'),
	('Simon & Schuster', '1230 6th Ave, New York, NY 10020', '1 (800) 223-2336'),
	('Henry Holt and Company', '175 Fifth Avenue New York, NY 10010', '646-307-5095'),
	('Penguin Books', '375 Hudson St, New York, NY 10014', '(212) 366-2000'),
	('Farrar, Straus and Giroux', '175 Varick St, New York, NY 10014', '(212) 741-6900'),
	('St. Martin’s Press', '175 5th Ave, New York, NY 10010', '(646) 307-5151'),
	('Macmillan Publishers', '4 Crinan St, London N1 9XW, UK', '+44 20 7843 3600'),
	('HarperCollins', '195 Broadway, New York, NY 10007', '(212) 207-7000'),
	('Picador USA', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('Flatiron Books', '4 Crinan St, London N1 9XW, UK', '+44 20 7843 3600'),
	('Crown Archetype', '80 Strand, London WC2R 0RL, UK', '+44 20 7139 3000'),
	('Random House', '375 Hudson St, New York, NY 10014', '(212) 366-2000'),
	('Counterpoint Press', '2560 Ninth Street #318, Berkeley, CA 94710', '(510) 704-0230')
;

INSERT INTO BOOKS
	(Title, PublisherName)
VALUES
	('Girl, Wash Your Face', 'Thomas Nelson'),
	('Crazy Rich Asians', 'Anchor'),
	('An American Marriage', 'Algonquin Books'),
	('CIRCE', 'Little, Brown and Company'),
	('There There', 'Knopf Doubleday Publishing Group'),
	('The Mars Room', 'Simon & Schuster'),
	('Children of Blood and Bone', 'Henry Holt and Company'),
	('The President Is Missing', 'Little, Brown and Company'),
	('The Incendiaries', 'Penguin Books'),
	('The Immortalists', 'Penguin Books'),
	('The Kiss Quotient', 'Penguin Books'),
	('Look Alive Out There', 'Farrar, Straus and Giroux'),
	('The Recovering', 'Little, Brown and Company'),
	('The Great Alone', 'St. Martin’s Press'),
	('Girls Burn Brighter', 'Macmillan Publishers'),
	('The Woman in the Window', 'HarperCollins'),
	('When Life Gives You Lululemons', 'Simon & Schuster'),
	('My Year of Rest and Relaxation', 'Penguin Books'),
	('Red Clocks', 'Little, Brown and Company'),
	('The Lost Tribe', 'Picador USA'),
	('A Higher Loyalty', 'Flatiron Books'),
	('Florida', 'Penguin Books'),
	('I'+'''ll Be Gone in the Dark', 'HarperCollins'),
	('Bad Blood', 'Knopf Doubleday Publishing Group'),
	('Clock Dance', 'Knopf Doubleday Publishing Group'),
	('IT', 'Simon & Schuster'),
	('Not That Bad', 'HarperCollins'),
	('The Pisces', 'Crown Archetype'),
	('The Line Becomes a River', 'Penguin Books'),
	('Warlight', 'Knopf Doubleday Publishing Group'),
	('The Long Walk', 'Simon & Schuster'),
	('White Houses', 'Random House'),
	('All We Ever Wanted', 'Random House'),
	('The Outsider', 'Simon & Schuster'),
	('The Ensemble', 'Penguin Books'),
	('That Kind of Mother', 'HarperCollins'),
	('The Wedding Date', 'Penguin Books'),
	('Heart Berries', 'Counterpoint Press'),
	('Give Me Your Hand', 'Little, Brown and Company'),
	('What We Were Promised', 'Little, Brown and Company')
;

INSERT INTO BOOK_AUTHORS
	(BookID, AuthorName)
VALUES
	(1, 'Rachel Hollis'),
	(2, 'Kevin Kwan'),
	(3, 'Tayari Jones'),
	(4, 'Madeline Miller'),
	(5, 'Tommy Orange'),
	(6, 'Rachel Kushner'),
	(7, 'Tomi Adeyemi'),
	(8, 'James Patterson & Bill Clinton'),
	(9, 'R. O. Kwon'),
	(10, 'Chloe Benjamin'),
	(11, 'Helen Hoang'),
	(12, 'Sloane Crosley'),
	(13, 'Leslie Jamison'),
	(14, 'Kristin Hannah'),
	(15, 'Shobha Rao'),
	(16, 'A. J. Finn'),
	(17, 'Lauren Weisberger'),
	(18, 'Ottessa Moshfegh'),
	(19, 'Leni Zumas'),
	(20, 'Mark Lee'),
	(21, 'James Comey'),
	(22, 'Lauren Groff'),
	(23, 'Michelle McNamara'),
	(24, 'John Carreyrou'),
	(25, 'Anne Tyler'),
	(26, 'Stephen King'),
	(27, 'Roxane Gay'),
	(28, 'Melissa Broder'),
	(29, 'Francisco Cantú'),
	(30, 'Michael Ondaatje'),
	(31, 'Stephen King'),
	(32, 'Amy Bloom'),
	(33, 'Emily Giffin'),
	(34, 'Stephen King'),
	(35, 'Aja Gabel'),
	(36, 'Rumaan Alam'),
	(37, 'Jasmine Guillory'),
	(38, 'Terese Marie Mailhot'),
	(39, 'Megan Abbott'),
	(40, 'Lucy Tan')
;

INSERT INTO BOOK_COPIES
	(BookID, BranchID, Number_Of_Copies)
VALUES
	(1, 1, 2),
	(2, 2, 2),
	(3, 3, 2),
	(4, 4, 2),
	(5, 1, 2),
	(6, 2, 2),
	(7, 3, 2),
	(8, 4, 2),
	(9, 1, 2),
	(10, 2, 2),
	(11, 3, 2),
	(12, 4, 2),
	(13, 1, 2),
	(14, 2, 2),
	(15, 3, 2),
	(16, 4, 2),
	(17, 4, 2),
	(18, 2, 2),
	(19, 3, 2),
	(20, 1, 2),
	(21, 1, 2),
	(22, 2, 2),
	(23, 3, 2),
	(24, 4, 2),
	(25, 1, 2),
	(26, 2, 2),
	(27, 3, 2),
	(28, 4, 2),
	(29, 3, 2),
	(30, 1, 2),
	(31, 2, 2),
	(32, 4, 2),
	(33, 1, 2),
	(34, 2, 2),
	(35, 3, 2),
	(36, 4, 2),
	(37, 1, 2),
	(38, 2, 2),
	(39, 3, 2),
	(40, 4, 2)
;

INSERT INTO BORROWER
	([Name], [Address], Phone)
VALUES
	('Gregg S. Deangelo', '3267 Edwards St. Rocky Mount, NC 27801', '252-651-1787'),
	('Toni A. Wolfe', '2627 Lightning Point Dr. Covington, TN 38019', '901-475-0706'),
	('Irfan Ubaida Baba', '2532 Riverside Dr. Summerville, GA 30747', '706-859-6998'),
	('Zarina Arévalo Puga', '4295 Big Indian Metairie, LA 70001', '504-609-6106'),
	('Kristinn Emilsson', '3452 Queens Ln. Danville, VA 23851', '434-835-5846'),
	('Shizuya Kurokawa', '4508 Viking Dr. Westerville, OH 43081', '740-684-9722'),
	('Praskovya Tikhonova', '361 Argonne St. Philadelphia, DE 19103', '302-341-0159'),
	('Connor Fox', '891 Trouser Leg Rd Springfield, MA 01103', '413-814-8722'),
	('Pam R. Blalock', '1718 Wayback L. White Plains, NY 10606', '631-392-3888'),
	('Kimberly A. Vanness', '3827 Clousson Rd Mapleton, IA 51034', '712-881-0305')
;

INSERT INTO BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut, DateDue)
VALUES
	(8, 4, 109, '2018-07-14', '2018-08-14'),
	(4, 4, 106, '2018-07-14', '2018-08-14'),
	(5, 1, 107, '2018-07-14', '2018-08-14'),
	(10, 2, 107, '2018-07-14', '2018-08-14'),
	(1, 1, 104, '2018-07-14', '2018-08-14'),
	(9, 1, 102, '2018-07-14', '2018-08-14'),
	(2, 2, 109, '2018-07-15', '2018-08-15'),
	(6, 2, 107, '2018-07-15', '2018-08-15'),
	(3, 3, 109, '2018-07-15', '2018-08-15'),
	(7, 3, 108, '2018-07-15', '2018-08-15'),
	(18, 2, 103, '2018-07-16', '2018-08-16'),
	(17, 4, 100, '2018-07-16', '2018-08-16'),
	(15, 3, 107, '2018-07-16', '2018-08-16'),
	(16, 4, 103, '2018-07-16', '2018-08-16'),
	(13, 1, 104, '2018-07-16', '2018-08-16'),
	(19, 3, 102, '2018-07-16', '2018-08-16'),
	(11, 3, 100, '2018-07-17', '2018-08-17'),
	(14, 2, 106, '2018-07-17', '2018-08-17'),
	(12, 4, 108, '2018-07-17', '2018-08-17'),
	(20, 1, 100, '2018-07-17', '2018-08-17'),
	(23, 3, 109, '2018-07-18', '2018-08-18'),
	(24, 4, 104, '2018-07-18', '2018-08-18'),
	(30, 1, 106, '2018-07-18', '2018-08-18'),
	(27, 3, 108, '2018-07-19', '2018-08-19'),
	(25, 1, 100, '2018-07-19', '2018-08-19'),
	(21, 1, 103, '2018-07-20', '2018-08-20'),
	(26, 2, 109, '2018-07-21', '2018-08-21'),
	(22, 2, 104, '2018-07-22', '2018-08-22'),
	(29, 3, 102, '2018-07-22', '2018-08-22'),
	(28, 4, 109, '2018-07-23', '2018-08-23'),
	(34, 2, 103, '2018-07-24', '2018-08-24'),
	(37, 1, 107, '2018-07-25', '2018-08-25'),
	(31, 2, 100, '2018-07-26', '2018-08-26'),
	(38, 2, 103, '2018-07-27', '2018-08-27'),
	(39, 3, 106, '2018-07-27', '2018-08-27'),
	(32, 4, 100, '2018-07-30', '2018-08-30'),
	(35, 3, 106, '2018-07-30', '2018-08-30'),
	(40, 4, 102, '2018-07-30', '2018-08-30'),
	(33, 1, 108, '2018-08-01', '2018-09-01'),
	(36, 4, 104, '2018-08-03', '2018-09-03'),
	(12, 4, 107, '2018-08-04', '2018-09-04'),
	(26, 2, 109, '2018-08-05', '2018-09-05'),
	(3, 3, 102, '2018-08-06', '2018-09-06'),
	(8, 4, 100, '2018-08-06', '2018-09-06'),
	(35, 3, 100, '2018-08-07', '2018-09-07'),
	(23, 3, 109, '2018-08-07', '2018-09-07'),
	(16, 4, 109, '2018-08-07', '2018-09-07'),
	(2, 2, 108, '2018-08-08', '2018-09-08'),
	(31, 2, 103, '2018-08-08', '2018-09-08'),
	(29, 3, 109, '2018-08-08', '2018-09-08')
;


INSERT INTO BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut, DateDue)
VALUES
	(8, 4, 109, '2018-07-14', '2018-08-14'),
	(4, 1, 101, '2019-06-12', '2019-07-12'),
	(15, 2, 105, '2020-10-05', '2020-11-05'),
	(23, 3, 107, '2021-03-21', '2021-04-21'),
	(19, 2, 104, '2022-01-15', '2022-02-15')
;



SELECT * FROM LIBRARY_BRANCH;
SELECT * FROM PUBLISHER;
SELECT * FROM BOOKS;
SELECT * FROM BOOK_AUTHORS;
SELECT * FROM BOOK_COPIES;
SELECT * FROM BORROWER;
SELECT * FROM BOOK_LOANS;





SELECT No_Of_Copies
FROM BOOK, BOOK_COPIES, LIBRARY_BRANCH
WHERE Title='The Lost Tribe' AND BranchName='Sharpstown'



SELECT BranchId, NoOfCopies
FROM BOOK, BOOK_COPIES
WHERE Title='The Lost Tribe'
GROUP BY BranchId


SELECT Name
FROM BORROWER B
WHERE NOT EXIST ( SELECT *
FROM BOOK_LOANS L
WHERE B.CardNo = L.CardNo )



SELECT B.Title, R.Name, R.Address
FROM BOOK B, BORROWER R, BOOK_LOANS BL, LIBRARY_BRANCH LB
WHERE LB.BranchName='Sharpstown' AND LB.BranchId=BL.BranchId AND
BL.DueDate='today' AND BL.CardNo=R.CardNo AND BL.BookId=B.BookId






SELECT L.BranchName, COUNT(*)
FROM BOOK_COPIES B, LIBRARY_BRANCH L
WHERE B.BranchId = L.BranchId
GROUP BY L.BranchName



SELECT B.CardNo, B.Name, B.Address, COUNT(*)
FROM BORROWER B, BOOK_LOANS L
WHERE B.CardNo = L.CardNo
GROUP BY B.CardNo
HAVING COUNT(*) > 5





SELECT Title, NoOfCopies
FROM ( ( (BOOK_AUTHORS NATURAL JOIN BOOK) NATURAL JOIN BOOK_COPIES)
NATURAL JOIN LIBRARY_BRANCH)
WHERE Author_Name = 'Stephen King' and BranchName = 'Central'