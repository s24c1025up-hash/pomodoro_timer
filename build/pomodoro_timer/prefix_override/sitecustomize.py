import sys
if sys.prefix == '/usr':
    sys.real_prefix = sys.prefix
    sys.prefix = sys.exec_prefix = '/home/shiba/ros2_ws/src/pomodoro_timer/install/pomodoro_timer'
