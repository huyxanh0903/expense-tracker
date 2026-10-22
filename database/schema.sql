-- =============================================
-- Database: Expense Tracker (Quản Lý Chi Tiêu)
-- RDBMS: Microsoft SQL Server
-- =============================================

-- Tạo Database nếu chưa tồn tại
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'expense_tracker_db')
BEGIN
    CREATE DATABASE expense_tracker_db;
END
GO

USE expense_tracker_db;
GO

-- 1. Bảng Users (Người dùng)
IF OBJECT_ID('dbo.Transactions', 'U') IS NOT NULL DROP TABLE dbo.Transactions;
IF OBJECT_ID('dbo.Budgets', 'U') IS NOT NULL DROP TABLE dbo.Budgets;
IF OBJECT_ID('dbo.Wallets', 'U') IS NOT NULL DROP TABLE dbo.Wallets;
IF OBJECT_ID('dbo.Categories', 'U') IS NOT NULL DROP TABLE dbo.Categories;
IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL DROP TABLE dbo.Users;
GO

CREATE TABLE Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(50) NOT NULL UNIQUE,
    email NVARCHAR(100) NOT NULL UNIQUE,
    password_hash NVARCHAR(255) NOT NULL,
    full_name NVARCHAR(100),
    avatar_url NVARCHAR(500),
    created_at DATETIME2 DEFAULT GETDATE(),
    updated_at DATETIME2 DEFAULT GETDATE()
);
GO

-- 2. Bảng Categories (Danh mục thu / chi)
CREATE TABLE Categories (
    category_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    type NVARCHAR(10) NOT NULL CHECK (type IN ('INCOME', 'EXPENSE')), -- Thu nhập hoặc Chi tiêu
    icon NVARCHAR(50),      -- Mã icon (FontAwesome hoặc Lucide-react)
    color NVARCHAR(20),     -- Mã màu hiển thị trên biểu đồ (#FF5733)
    user_id INT NULL,       -- NULL: danh mục mặc định của hệ thống; NOT NULL: danh mục cá nhân
    created_at DATETIME2 DEFAULT GETDATE(),
    CONSTRAINT FK_Categories_Users FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
GO

-- 3. Bảng Wallets (Ví / Tài khoản ngân hàng / Tiền mặt)
CREATE TABLE Wallets (
    wallet_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    name NVARCHAR(100) NOT NULL,                    -- Ví dụ: Tiền mặt, Techcombank, Momo
    balance DECIMAL(18, 2) NOT NULL DEFAULT 0.00,  -- Số dư hiện tại
    currency NVARCHAR(10) DEFAULT 'VND',
    created_at DATETIME2 DEFAULT GETDATE(),
    CONSTRAINT FK_Wallets_Users FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
GO

-- 4. Bảng Transactions (Giao dịch thu / chi)
CREATE TABLE Transactions (
    transaction_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    wallet_id INT NOT NULL,
    category_id INT NOT NULL,
    amount DECIMAL(18, 2) NOT NULL,                 -- Số tiền giao dịch
    transaction_date DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    note NVARCHAR(500),                             -- Ghi chú (VD: Mua trà sữa, Trả tiền phòng)
    image_url NVARCHAR(500),                        -- Ảnh hóa đơn nếu có
    created_at DATETIME2 DEFAULT GETDATE(),
    CONSTRAINT FK_Transactions_Users FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE NO ACTION,
    CONSTRAINT FK_Transactions_Wallets FOREIGN KEY (wallet_id) REFERENCES Wallets(wallet_id) ON DELETE CASCADE,
    CONSTRAINT FK_Transactions_Categories FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE NO ACTION
);
GO

-- 5. Bảng Budgets (Hạn mức chi tiêu theo tháng)
CREATE TABLE Budgets (
    budget_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    amount_limit DECIMAL(18, 2) NOT NULL,           -- Hạn mức tối đa
    month INT NOT NULL CHECK (month BETWEEN 1 AND 12),
    year INT NOT NULL,
    created_at DATETIME2 DEFAULT GETDATE(),
    CONSTRAINT FK_Budgets_Users FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    CONSTRAINT FK_Budgets_Categories FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE CASCADE,
    CONSTRAINT UQ_User_Category_Month_Year UNIQUE (user_id, category_id, month, year)
);
GO
