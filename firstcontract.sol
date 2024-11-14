// SPDX-License-Identifier: MIT
// Khai báo giấy phép MIT cho hợp đồng, cho phép mã nguồn này được sử dụng và phân phối tự do.

pragma solidity >=0.8.2 <0.9.0;
// Xác định phiên bản Solidity cho hợp đồng. 
// Điều này giúp đảm bảo tính tương thích của mã với phiên bản cụ thể của trình biên dịch Solidity.

contract FirstContract {

    uint public saveData;
    // `public` cho phép biến này có thể được truy cập từ bên ngoài hợp đồng, tạo ra một hàm `getter` tự động cho `saveData`.
    
    // Hàm để đặt giá trị của saveData
    function set(uint x) public {
        saveData = x;
        // Gán giá trị của tham số x vào biến trạng thái saveData, lưu giá trị x vào blockchain.
    }

    // Hàm để lấy giá trị của saveData
    function get() public view returns (uint) {
        // Hàm get không nhận tham số nào và trả về một giá trị kiểu uint.
        // `view` nghĩa là hàm này chỉ đọc dữ liệu mà không thay đổi trạng thái của hợp đồng.
        
        return saveData;
    }
}