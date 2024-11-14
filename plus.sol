// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
// Xác định phiên bản Solidity từ 0.7.0 đến dưới 0.9.0.

contract Count {
    uint public value = 0;
    // Biến trạng thái `value`, khởi tạo bằng 0, được khai báo công khai (public) nên có thể truy cập từ bên ngoài hợp đồng.

    event Changed(uint _value);
    // Khai báo một sự kiện (event) tên là `Changed`, nhận tham số `_value` kiểu uint.
    // Sự kiện này được dùng để thông báo khi giá trị `value` thay đổi.

    function plus() public returns (uint) {
        // Định nghĩa hàm `plus`, có thể gọi từ bên ngoài hợp đồng.
        // Hàm trả về một giá trị kiểu uint.

        value++;
        // Tăng giá trị của `value` lên 1.

        emit Changed(value);
        // Kích hoạt sự kiện `Changed`, truyền giá trị hiện tại của `value` vào sự kiện.

        return value;
        // Trả về giá trị mới của `value`.
    }
}