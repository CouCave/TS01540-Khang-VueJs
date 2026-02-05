-- Create Database
USE master;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PolyOE')
BEGIN
    CREATE DATABASE PolyOE;
END
GO

USE PolyOE;
GO

-- 1. Create Users Table
IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL DROP TABLE dbo.Users;
CREATE TABLE Users (
    Id          VARCHAR(50) PRIMARY KEY,
    Password    VARCHAR(50) NOT NULL,
    Fullname    NVARCHAR(50) NOT NULL,
    Email       VARCHAR(100) NOT NULL,
    Admin       BIT DEFAULT 0
);
GO

-- 2. Create Videos Table
IF OBJECT_ID('dbo.Videos', 'U') IS NOT NULL DROP TABLE dbo.Videos;
CREATE TABLE Videos (
    Id          VARCHAR(50) PRIMARY KEY, -- YouTube ID
    Title       NVARCHAR(255) NOT NULL,
    Poster      VARCHAR(255),
    Views       INT DEFAULT 0,
    Description NVARCHAR(MAX),
    Active      BIT DEFAULT 1
);
GO

-- 3. Create Favorites Table
IF OBJECT_ID('dbo.Favorites', 'U') IS NOT NULL DROP TABLE dbo.Favorites;
CREATE TABLE Favorites (
    Id          BIGINT IDENTITY(1,1) PRIMARY KEY,
    UserId      VARCHAR(50) NOT NULL,
    VideoId     VARCHAR(50) NOT NULL,
    LikeDate    DATE DEFAULT GETDATE(),
    UNIQUE (UserId, VideoId),
    FOREIGN KEY (UserId) REFERENCES Users(Id) ON DELETE CASCADE,
    FOREIGN KEY (VideoId) REFERENCES Videos(Id) ON DELETE CASCADE
);
GO

-- 4. Create Shares Table
IF OBJECT_ID('dbo.Shares', 'U') IS NOT NULL DROP TABLE dbo.Shares;
CREATE TABLE Shares (
    Id          BIGINT IDENTITY(1,1) PRIMARY KEY,
    UserId      VARCHAR(50) NOT NULL,
    VideoId     VARCHAR(50) NOT NULL,
    Emails      NVARCHAR(MAX) NOT NULL,
    ShareDate   DATE DEFAULT GETDATE(),
    FOREIGN KEY (UserId) REFERENCES Users(Id) ON DELETE CASCADE,
    FOREIGN KEY (VideoId) REFERENCES Videos(Id) ON DELETE CASCADE
);
GO

-- SAMPLE DATA INSERTION

-- Users (Password: 123)
INSERT INTO Users (Id, Password, Fullname, Email, Admin) VALUES 
('admin', '123', N'Administrator', 'admin@poly.edu.vn', 1),
('user', '123', N'Nguyen Van User', 'user@poly.edu.vn', 0),
('teonv', '123', N'Nguyen Van Teo', 'teonv@gmail.com', 0);
GO

-- Videos
INSERT INTO Videos (Id, Title, Poster, Views, Description, Active) VALUES 
('XqZsoesa55w', N'Baby Shark Dance', 'https://img.youtube.com/vi/XqZsoesa55w/maxresdefault.jpg', 12000, N'Baby Shark Dance | #babyshark Most Viewed Video | Animal Songs | PINKFONG Songs for Children', 1),
('kJQP7kiw5Fk', N'Luis Fonsi - Despacito ft. Daddy Yankee', 'https://img.youtube.com/vi/kJQP7kiw5Fk/maxresdefault.jpg', 8000, N'Despacito by Luis Fonsi', 1),
('JGwWNGJdvx8', N'Ed Sheeran - Shape of You', 'https://img.youtube.com/vi/JGwWNGJdvx8/maxresdefault.jpg', 6000, N'Shape of You - Official Video', 1),
('OPf0YbXqDm0', N'Mark Ronson - Uptown Funk ft. Bruno Mars', 'https://img.youtube.com/vi/OPf0YbXqDm0/maxresdefault.jpg', 5000, N'Uptown Funk - Official Video', 1),
('9bZkp7q19f0', N'PSY - GANGNAM STYLE', 'https://img.youtube.com/vi/9bZkp7q19f0/maxresdefault.jpg', 4500, N'Gangnam Style M/V', 1),
('09R8_2nJtjg', N'Maroon 5 - Sugar', 'https://img.youtube.com/vi/09R8_2nJtjg/maxresdefault.jpg', 3000, N'Sugar - Official Music Video', 1);
GO

-- Favorites
INSERT INTO Favorites (UserId, VideoId, LikeDate) VALUES 
('user', 'XqZsoesa55w', '2025-01-01'),
('user', 'kJQP7kiw5Fk', '2025-01-02'),
('teonv', 'XqZsoesa55w', '2025-01-03');
GO

-- Shares
INSERT INTO Shares (UserId, VideoId, Emails, ShareDate) VALUES 
('user', 'XqZsoesa55w', 'friend1@gmail.com, friend2@yahoo.com', '2025-01-05');
GO
