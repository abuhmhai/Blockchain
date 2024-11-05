// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0; 

contract coin {
    uint public playerCount = 0; // Biến công khai đếm số lượng người chơi
    mapping(address => Player) public players; // Mapping để lưu thông tin người chơi, địa chỉ -> Cấu trúc Player

    // Enum để xác định cấp độ của người chơi
    enum Level { Beginner, Intermediate, Advanced }

    // Cấu trúc Player lưu trữ thông tin chi tiết của mỗi người chơi
    struct Player {
        address playerAddress; // Địa chỉ ví của người chơi
        Level playerLevel; // Cấp độ hiện tại của người chơi
        string firstName; // Tên của người chơi
        string lastName; // Họ của người chơi
        uint createTime; // Thời gian tạo tài khoản của người chơi (tính bằng block timestamp)
    }

    // Hàm để thêm một người chơi mới
    function addPlayer(string memory firstName, string memory lastName) public {
        // Thêm một đối tượng Player mới vào mapping "players" với khóa là địa chỉ của người gửi
        players[msg.sender] = Player(msg.sender, Level.Beginner, firstName, lastName, block.timestamp);
        // Tăng biến đếm số lượng người chơi lên 1
        playerCount += 1;
    }

    // Hàm trả về cấp độ của người chơi dựa trên địa chỉ ví
    function getPlayerLevel(address playerAddress) public view returns (Level) {
        // Trả về cấp độ của người chơi được chỉ định
        return players[playerAddress].playerLevel;
    }

    // Hàm để thay đổi cấp độ của người chơi dựa trên thời gian đã trôi qua
    function changePlayerLevel(address playerAddress) public {
        // Lấy tham chiếu đến đối tượng Player trong storage
        Player storage player = players[playerAddress];
        
        // Kiểm tra nếu thời gian hiện tại >= thời gian tạo + 15 giây
        if (block.timestamp >= player.createTime + 15) {
            // Thay đổi cấp độ của người chơi lên Intermediate (Trung cấp)
            player.playerLevel = Level.Intermediate;
        }
    }
}