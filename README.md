# ----- VỀ GIT ---------

- Nhánh master chứa source code đã hoàn thiện
- Nhánh develop, nơi đây để ae thêm sửa xóa những đoạn code từ nhánh master (nếu có vấn đề). Sau khi test ok, mình sẽ merge vào master.
- Nhánh feature, nếu nhánh develop có một số lỗi nhỏ, các ae có thể tạo thêm nhánh nhỏ này.

# ---- VỀ CÂU LỆNH GIT --

- git init (nếu chưa khởi tạo git)
- git clone https://github.com/minh120499/GIFTSHOP.git
  -> Clone code trên git hub về máy

- git branch [tên branch]
  -> Tạo nhánh mới nếu cần

- git checkout [tên branch]
  -> Để chuyển sang nhánh khác

--- Cách bước đưa code lên github --

- git add [tên file] [tên file] ....
  -> Dùng để add, có thể viết [ git add . ] để commit toàn bộ file

- git commit -m "[nội dung commit]"
  -> Để commit

- git push
  -> Đẩy code lên github

---

- git merge [tên nhánh]
  -> Hợp nhất 2 nhánh

- git branch -d [tên nhánh]
  -> Xóa nhánh

- git pull
  -> Đồng bộ code trên github và code máy mình (Kiểu đưa code về)

BỔ SUNG:

- git status (Xem trạng thái)
- git log (Xem lịch sử)
- git branch (xem danh sách branch)

# ----- VỀ CẤU TRÚC ----

- Có 3 Folder chính là BE, DB, FE. Các ae có thể tải cả 3 folder về máy và test.
- Trong BE, FE mình sẽ chia ra thành từ module nhỏ. Mỗi module là một folder, trong mỗi folder sẽ gồm các file html, css, js,... tương ứng. (Sẽ rất tốt nếu mỗi folder có file readme).
  VD: FE
  layout
  index.html
  aboutus.html
  readme.md
  css
  style.css
  header.css
  js
  main.js
  validation.js

# Về công việc

Nam:

- Trang chủ
- Danh sách (Tìm kiếm, bộ lọc)
- Login/Res
- Thông tin người dùng
- Danh sách các shop -> để liệt kê ra sản phẩm có sẵn ở shop
- Admin

Thành:

- Chi tiết sản phẩm
- Thanh toán
- About
- Contact
- Wishlist

Hương Giang (Viết API):

- Trang chủ
- Danh sách (Tìm kiếm, bộ lọc) 50%
- Login/Res 90%
- Thông tin người dùng
- Admin
- Chi tiết sản phẩm 
- Thanh toán
- About 99%
- Contact 99%
- Wishlist

Minh:

- Database

# Anh em có ý tưởng gì mới thì note dưới này nhé

- Ý tưởng mới nèeeee
