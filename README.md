# 💰 Expense Tracker (Hệ Thống Quản Lý Chi Tiêu Cá Nhân)

Ứng dụng web Fullstack hỗ trợ theo dõi thu chi cá nhân, phân loại danh mục, quản lý nguồn tiền (ví) và đặt ngân sách chi tiêu hàng tháng.

---

## 🛠 Công Nghệ Sử Dụng (Tech Stack)

| Thành phần | Công nghệ | Mô tả |
| :--- | :--- | :--- |
| **Frontend** | React.js, TailwindCSS / Lucide Icons, Axios | Giao diện người dùng phản hồi nhanh, trực quan |
| **Backend** | Java Spring Boot (Spring Web, Spring Data JPA, Spring Security) | RESTful API xử lý nghiệp vụ và xác thực JWT |
| **Database** | Microsoft SQL Server | Cơ sở dữ liệu quan hệ lưu trữ giao dịch & người dùng |
| **Công cụ** | Git, Maven, Postman, VS Code / IntelliJ | Quản lý mã nguồn và phát triển dự án |

---

## 📂 Cấu Trúc Dự Án (Project Structure)

```text
expensive-tracker/
├── backend/                  # Mã nguồn Spring Boot REST API
│   ├── src/                  # Controllers, Services, Repositories, Entities
│   ├── application.properties.example # Mẫu cấu hình database
│   └── README.md
├── frontend/                 # Mã nguồn React.js
│   ├── src/                  # Components, Pages, Hooks, Services
│   ├── .env.example          # Mẫu biến môi trường API URL
│   └── README.md
├── database/                 # Script Microsoft SQL Server
│   ├── schema.sql            # Script tạo bảng và quan hệ
│   └── seed_data.sql         # Dữ liệu khởi tạo mẫu
├── docs/                     # Tài liệu thiết kế & sơ đồ
│   └── DATABASE_DESIGN.md
├── .gitignore
└── README.md
```

---

## 🚀 Hướng Dẫn Cài Đặt & Khởi Chạy (Local Setup)

### 1. Cơ sở dữ liệu (Microsoft SQL Server)
1. Mở **SQL Server Management Studio (SSMS)** hoặc **Azure Data Studio**.
2. Mở và chạy file [database/schema.sql](file:///f:/Ki5SE/duAnMa/expensive-tracker/database/schema.sql) để tạo bảng.
3. Mở và chạy file [database/seed_data.sql](file:///f:/Ki5SE/duAnMa/expensive-tracker/database/seed_data.sql) để nạp danh mục và dữ liệu mẫu.

### 2. Backend (Spring Boot)
1. Di chuyển vào thư mục `backend`:
   ```bash
   cd backend
   ```
2. Tạo file `src/main/resources/application.properties` (sao chép từ `application.properties.example`) và cập nhật mật khẩu sa của SQL Server.
3. Chạy ứng dụng:
   ```bash
   ./mvnw spring-boot:run
   ```
   API sẽ khả dụng tại: `http://localhost:8080`

### 3. Frontend (React.js)
1. Mở terminal mới, di chuyển vào thư mục `frontend`:
   ```bash
   cd frontend
   ```
2. Cài đặt các thư viện:
   ```bash
   npm install
   ```
3. Chạy giao diện:
   ```bash
   npm run dev
   ```
   Truy cập tại: `http://localhost:5173`

---

## 📌 Các Tính Năng Chính
- [x] Đăng ký / Đăng nhập (Xác thực qua JWT).
- [x] Quản lý ví tiền (Tiền mặt, Tài khoản ngân hàng, Ví điện tử).
- [x] Ghi chép thu / chi nhanh chóng theo danh mục.
- [x] Thiết lập hạn mức chi tiêu (Budget) theo tháng.
- [x] Thống kê, biểu đồ phân tích tỷ trọng chi tiêu.
