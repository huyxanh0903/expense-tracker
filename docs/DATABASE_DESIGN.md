# Thiết Kế Cơ Sở Dữ Liệu (Database Design)

Dự án sử dụng **Microsoft SQL Server**.

## 📊 Sơ đồ thực thể quan hệ (ERD Overview)

```
[Users] 1 ──── N [Wallets]
   │                │
   │ 1              │ 1
   │                │
   ├────── N [Transactions] N ──── 1 [Categories]
   │                                     │ 1
   └────── N [Budgets]      N ───────────┘
```

## 📝 Danh sách các bảng

1. **`Users`**: Quản lý thông tin tài khoản người dùng, email, mật khẩu đã mã hóa.
2. **`Categories`**: Quản lý các hạng mục thu/chi (Ăn uống, Lương, Mua sắm...). Hỗ trợ danh mục mặc định của hệ thống (`user_id = NULL`) và danh mục tùy biến của từng người dùng.
3. **`Wallets`**: Quản lý các nguồn tiền của người dùng (Tiền mặt, Tài khoản ngân hàng, Ví điện tử...).
4. **`Transactions`**: Ghi nhận các giao dịch thu/chi, liên kết với ví và danh mục tương ứng.
5. **`Budgets`**: Đặt hạn mức chi tiêu hàng tháng cho từng danh mục để cảnh báo khi chi tiêu vượt mức.
