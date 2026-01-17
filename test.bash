#!/bin/bash
# 3条項BSDライセンス © 2026 Ryuse Oshiba

# ROS 2環境の読み込み
source /opt/ros/humble/setup.bash

# ワークスペースの場所を特定（GitHub Actionsかローカルか）
if [ -d "$GITHUB_WORKSPACE" ]; then
    WORKSPACE_ROOT=$HOME/ros2_ws
else
    WORKSPACE_ROOT=$HOME/ros2_ws
fi

cd $WORKSPACE_ROOT
source install/setup.bash

# ノードをバックグラウンドで起動し、ログをファイルに保存
timeout 10s ros2 run pomodoro_timer timer > /tmp/pomodoro_test.log 2>&1 &
sleep 7

# ログの中に「残り」という文字があるかチェック
if grep -q "残り" /tmp/pomodoro_test.log; then
    echo "テスト成功：タイマーの動作を確認しました。"
    exit 0
else
    echo "テスト失敗：タイマーの出力が確認できませんでした。"
    cat /tmp/pomodoro_test.log
    exit 1
fi
