#!/bin/bash
# 3条項BSDライセンス © 2026 Ryuse Oshiba

# ROS 2環境の読み込み
source /opt/ros/humble/setup.bash
source install/setup.bash

# 1. ビルドの成否確認
colcon build --packages-select pomodoro_timer
if [ $? -ne 0 ]; then
    echo "Build failed"
    exit 1
fi

# 2. ノードが起動し、トピックが配信されるか確認
# 5秒間ノードを動かして、トピックリストに /timer_status が出るかチェック
timeout 5s ros2 run pomodoro_timer timer &
sleep 2

ros2 topic list | grep /timer_status
if [ $? -ne 0 ]; then
    echo "Topic /timer_status not found"
    exit 1
fi

echo "Test passed!"
exit 0
