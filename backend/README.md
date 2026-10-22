# Backend - Spring Boot REST API

## 📋 Yêu cầu môi trường
- Java 17 hoặc Java 21
- Maven 3.8+
- Microsoft SQL Server 2019+

## 🚀 Hướng dẫn khởi chạy
1. Tạo database trên SQL Server bằng script tại `../database/schema.sql`.
2. Tạo file `src/main/resources/application.properties` dựa theo mẫu `application.properties.example`.
3. Điền mật khẩu SQL Server của bạn vào.
4. Chạy lệnh:
   ```bash
   ./mvnw spring-boot:run
   ```
API sẽ lắng nghe tại `http://localhost:8080`.
