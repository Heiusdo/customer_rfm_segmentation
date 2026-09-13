# Phân tích Hành vi Khách hàng (RFM Segmentation)

Project phân tích dữ liệu end-to-end: xử lý dữ liệu giao dịch bán lẻ thực, tính toán RFM, phân khúc khách hàng, lưu trữ bằng MySQL, trực quan hóa bằng Power BI.

## Mục tiêu
Phân loại khách hàng thành các nhóm dựa trên hành vi mua hàng (Recency - Frequency - Monetary) để xác định nhóm khách hàng cần ưu tiên chăm sóc, nhóm có nguy cơ rời bỏ, và nhóm cần nuôi dưỡng.

## Nguồn dữ liệu
Dataset "Online Retail II" - dữ liệu giao dịch thật của một công ty bán lẻ trực tuyến tại Anh, từ 01/12/2009 đến 09/12/2011.
- Tải tại: https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci

## Công nghệ sử dụng
- Python (pandas) - làm sạch dữ liệu, tính toán RFM, phân khúc khách hàng
- MySQL - lưu trữ dữ liệu quan hệ (transactions và customer_rfm), viết truy vấn kiểm tra
- Power BI - trực quan hóa dashboard, DAX measures

## Quy trình thực hiện
1. Khám phá dữ liệu: dùng Data Wrangler phát hiện vấn đề (Customer ID thiếu 23%, Quantity/Price âm bất thường)
2. Điều tra và làm sạch: xác định và loại bỏ bút toán kế toán, xử lý đơn hàng bị hủy, loại bỏ trùng lặp - `clean_and_rfm.ipynb`
3. Tính RFM: Recency, Frequency, Monetary cho từng khách hàng, với logic xử lý riêng cho đơn hàng bị hủy
4. Phân khúc khách hàng: chấm điểm RFM theo ngũ phân vị, gán nhãn phân khúc (VIP, khách mới, có nguy cơ rời bỏ, đã rời bỏ, trung bình) - `rfm_segmentation.ipynb`
5. Thiết kế database: 2 bảng quan hệ (transactions, customer_rfm) - `database.sql`, `load_data.sql`
6. Trực quan hóa: DAX measures và dashboard Power BI - `dax_measures.txt`

## Insight chính

- Cơ cấu khách hàng: nhóm VIP/trung thành chiếm 22.14% tổng số khách hàng, nhưng nhóm đã rời bỏ cũng chiếm tỷ lệ gần tương đương (21.77%) - công ty đang "được vào, mất ra" với tốc độ gần cân bằng.
- Hiệu ứng Pareto: nhóm VIP (22% khách hàng) đóng góp doanh thu vượt trội so với tất cả các nhóm còn lại cộng lại.
- Hành vi trung bình: một khách hàng trung bình đã 200.55 ngày không quay lại mua hàng, và trung bình chỉ mua 6.3 đơn hàng trong toàn bộ thời gian dữ liệu.
- Tổng doanh thu ròng ghi nhận đạt 16.38 triệu bảng Anh, với phần lớn giá trị đến từ chưa đến một phần tư tổng số khách hàng.

## Dashboard

<p align="center">
  <img src="/images/dashboard_page-0001.jpg" alt="Power BI Dashboard" width="80%">
</p>

## Cách chạy lại project
1. Tải dataset từ link Kaggle ở mục "Nguồn dữ liệu" phía trên
2. Chạy `clean_and_rfm.ipynb` để làm sạch dữ liệu và tính RFM
3. Chạy `rfm_segmentation.ipynb` để phân khúc khách hàng
4. Chạy `database.sql` để tạo database và các bảng
5. Chạy `load_data.sql` để nạp dữ liệu (nhớ sửa đường dẫn file CSV cho đúng máy bạn)
6. Mở file .pbix bằng Power BI Desktop, kết nối lại nguồn dữ liệu nếu cần

## Tác giả
Hieu — Data Analyst Portfolio Project
