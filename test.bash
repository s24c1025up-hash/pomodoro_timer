#!/bin/bash
# 3条項BSDライセンス © 2026 Ryuse Oshiba

# 環境読み込み（GitHub Actions用）
[ -f /opt/ros/humble/setup.bash ] && source /opt/ros/humble/setup.bash
[ -f ~/ros2_ws/install/setup.bash ] && source ~/ros2_ws/install/setup.bash

# ノードをバックグラウンドで10秒間起動
timeout 10s ros2 run pomodoro_timer timer > /tmp/test.log 2>&1 &
sleep 8

# ログを表示して中身を確認
cat /tmp/test.log

# 「残り」または「pomodoro」という文字があれば成功とみなす
if grep -e "残り" -e "pomodoro" /tmp/test.log; then
    echo "TEST PASSED"
    exit 0
else
    echo "TEST FAILED"
    exit 1
fi
