#!/bin/bash
# 3条項BSDライセンス © 2026 Ryuse Oshiba

# 環境読み込み（パスがあれば読み込む）
[ -f /opt/ros/humble/setup.bash ] && source /opt/ros/humble/setup.bash
[ -f ~/ros2_ws/install/setup.bash ] && source ~/ros2_ws/install/setup.bash

# ノードをバックグラウンドで起動
timeout 15s ros2 run pomodoro_timer timer > /tmp/test.log 2>&1 &
sleep 10

# 判定
if grep -q "残り" /tmp/test.log; then
    echo "TEST PASSED"
    exit 0
else
    echo "TEST FAILED: Output was..."
    cat /tmp/test.log
    exit 1
fi
