# GreenTech Infrastructure Mini Project

> Dự án mẫu quản lý hạ tầng Startup GreenTech: tổ chức dữ liệu, lọc log, hướng dẫn vận hành và đối soát phần cứng cho 100 trạm IoT.

## 1. Mô hình IPO
| Thành phần | Nội dung |
|---|---|
| Input | `log-he-thong.log`, mã linh kiện, dữ liệu 100 trạm |
| Process | Pipe + `findstr`, `TRIM`, `VLOOKUP` |
| Output | `bao-cao-su-co.txt`, bảng thiết bị đã đối soát |

## 2. Tư duy DIKW
- **Data:** dòng log thô, mã linh kiện, dung lượng RAM.
- **Information:** log `CRITICAL`/`ERROR` đã lọc.
- **Knowledge:** nhận diện lỗi lặp hoặc mã linh kiện không hợp lệ.
- **Wisdom:** ưu tiên khắc phục lỗi nghiêm trọng và thay thiết bị không đạt.

## 3. Cây thư mục 3 cấp
```text
Lop_CNTT_MiniProject_GreenTech/
├── docs/
│   ├── README.md
│   └── srs-he-thong.docx
├── scripts/
│   └── auto_report.bat
├── data/
│   ├── log-he-thong.log
│   └── quan-ly-thiet-bi.xlsx
├── backup/
│   └── bao-cao-su-co.txt
└── .env
```
Bốn trụ cột: `docs/` tài liệu, `scripts/` tự động hóa, `data/` dữ liệu, `backup/` báo cáo.

## 4. Khởi tạo bằng một dòng lệnh (Windows CMD)
```bat
mkdir "Lop_CNTT_MiniProject_GreenTech\docs" "Lop_CNTT_MiniProject_GreenTech\scripts" "Lop_CNTT_MiniProject_GreenTech\data" "Lop_CNTT_MiniProject_GreenTech\backup"
```
```bat
cd Lop_CNTT_MiniProject_GreenTech
```
`.env` chỉ có cấu hình giả định, không chứa mật khẩu thật.

## 5. Robot lọc log
Đặt log ở `data\log-he-thong.log`, mở CMD tại thư mục gốc và chạy:
```bat
scripts\auto_report.bat
```
Script dùng `type` + `findstr` qua Pipe để lọc theo luồng và `>>` để nối báo cáo.

### Audit an toàn
- [ ] Kiểm tra đường dẫn input/output.
- [ ] Xác nhận file log tồn tại.
- [ ] Đọc script trước khi chạy.
- [ ] Xác nhận không có `del /f /s /q` hoặc lệnh xóa khác.
- [ ] Thử trên log nhỏ trước khi xử lý log lớn.

## 6. Bảng thông số phần cứng
| Mã linh kiện | Tên thiết bị | Đơn giá giả định (VNĐ) | Loại lưu trữ |
|---|---|---:|---|
| CPU-001 | CPU IoT tiết kiệm điện | 1.250.000 | N/A |
| RAM-008 | RAM 8GB công nghiệp | 620.000 | N/A |
| SSD-256 | SSD 256GB chịu nhiệt | 890.000 | SSD |
| HDD-1T | HDD 1TB giám sát | 1.050.000 | HDD |

## 7. Công thức Excel
```excel
=IFERROR(VLOOKUP(TRIM(B2),'danh-muc-linh-kien'!$A$2:$D$10,2,FALSE),"KIEM_TRA_MA")
```
`FALSE` là khớp chính xác, `$` cố định vùng. `TRIM` xử lý khoảng trắng thông thường. Nếu vẫn lỗi, kiểm tra mã có tồn tại, kiểu dữ liệu và ký tự khoảng trắng đặc biệt.

## 8. Quy đổi mạng
`MB/s = Mbps / 8`. Ví dụ 80 Mbps tương đương lý thuyết 10 MB/s; tệp 500 MB mất tối thiểu khoảng 50 giây trong điều kiện lý tưởng.

## 9. Checklist thiết bị
- [ ] Đối chiếu mã linh kiện.
- [ ] Kiểm tra RAM và ngày lắp đặt.
- [ ] Lọc trạm bằng AutoFilter.
- [ ] Xác minh mã không khớp.
- [ ] Lưu báo cáo vào `backup/`.

## 10. GitHub
Không đưa mật khẩu/token thật lên GitHub. Với repository thật, thêm `.env` vào `.gitignore`.
