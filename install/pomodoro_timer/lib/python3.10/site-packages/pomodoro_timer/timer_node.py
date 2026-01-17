import rclpy
from rclpy.node import Node
from std_msgs.msg import String

class PomodoroNode(Node):
    def __init__(self):
        super().__init__('pomodoro_timer')
        # トピックの配信設定
        self.pub = self.create_publisher(String, 'timer_status', 10)
        # 1秒ごとに実行するタイマー
        self.timer = self.create_timer(1.0, self.timer_callback)
        
        # 設定：作業25分、休憩5分
        self.work_sec = 25 * 60
        self.rest_sec = 5 * 60
        self.remaining = self.work_sec
        self.is_working = True

    def timer_callback(self):
        msg = String()
        mode = "【作業中】" if self.is_working else "【休憩中】"
        
        # 分:秒に変換
        minutes = self.remaining // 60
        seconds = self.remaining % 60
        msg.data = f"{mode} 残り {minutes:02d}:{seconds:02d}"
        
        # トピックを配信
        self.pub.publish(msg)
        self.get_logger().info(msg.data)

        if self.remaining > 0:
            self.remaining -= 1
        else:
            # 切り替え
            self.is_working = not self.is_working
            self.remaining = self.work_sec if self.is_working else self.rest_sec
            self.get_logger().info("★★★ 休憩/作業が切り替わりました ★★★")

def main():
    rclpy.init()
    node = PomodoroNode()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
