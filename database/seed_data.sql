-- =============================================
-- Seed Data: Dữ liệu mẫu ban đầu
-- =============================================

USE expense_tracker_db;
GO

-- 1. Danh mục mặc định hệ thống (user_id = NULL)
-- Chi tiêu (EXPENSE)
INSERT INTO Categories (name, type, icon, color, user_id) VALUES
(N'Ăn uống', 'EXPENSE', 'utensils', '#EF4444', NULL),
(N'Thuê nhà & Tiện ích', 'EXPENSE', 'home', '#F59E0B', NULL),
(N'Di chuyển & Xăng xe', 'EXPENSE', 'car', '#10B981', NULL),
(N'Mua sắm', 'EXPENSE', 'shopping-bag', '#8B5CF6', NULL),
(N'Giải trí & Du lịch', 'EXPENSE', 'film', '#EC4899', NULL),
(N'Y tế & Sức khỏe', 'EXPENSE', 'heart-pulse', '#06B6D4', NULL),
(N'Học tập & Sách vở', 'EXPENSE', 'book-open', '#3B82F6', NULL);

-- Thu nhập (INCOME)
INSERT INTO Categories (name, type, icon, color, user_id) VALUES
(N'Lương hàng tháng', 'INCOME', 'wallet', '#10B981', NULL),
(N'Thưởng', 'INCOME', 'gift', '#F59E0B', NULL),
(N'Làm thêm (Freelance)', 'INCOME', 'laptop', '#3B82F6', NULL),
(N'Đầu tư', 'INCOME', 'trending-up', '#8B5CF6', NULL);
GO

-- 2. Tài khoản mẫu để test (mật khẩu mẫu hash)
INSERT INTO Users (username, email, password_hash, full_name) VALUES
('testuser', 'user@example.com', '$2a$10$7EqJtq98hPqEX7fNZaFWoOhi5kLw.5x8pZ0l75gE3Q8f1L1S2hP.K', N'Nguyễn Văn A');
GO

-- 3. Ví mẫu cho tài khoản test
DECLARE @UserId INT = (SELECT TOP 1 user_id FROM Users WHERE username = 'testuser');

INSERT INTO Wallets (user_id, name, balance, currency) VALUES
(@UserId, N'Tiền mặt', 1500000, 'VND'),
(@UserId, N'Tài khoản Ngân hàng (MB Bank)', 12500000, 'VND'),
(@UserId, N'Ví MoMo', 450000, 'VND');
GO
