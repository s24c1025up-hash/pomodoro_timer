#!/bin/bash
# 3条項BSDライセンス © 2026 Ryuse Oshiba

# ROS 2環境の読み込み
source /opt/ros/humble/setup.bash

# ワークスペースのルートを探す（なければ作成）
WS_ROOT="$HOME/ros2_ws"
cd $WS_ROOT

# 自分のワークスペースの設定を読み込む
[ -f install/setup.bash ] && source install/setup.bash

# ノードをバックグラウンドで起動（ログを/tmpに保存）
timeout 15s ros2 run pomodoro_timer timer > /tmp/pomodoro_test.log 2>&1 &
sleep 10

# ログを画面に出力（エラー時に原因をGitHub Actionsで見られるようにするため）
echo "--- Output Log ---"
cat /tmp/pomodoro_test.log
echo "------------------"

# ログの中に「残り」という日本語があるかチェック
if grep -q "残り" /tmp/pomodoro_test.log; then
    echo "テスト成功：タイマーの動作を確認しました。"
    exit 0
else
    echo "テスト失敗：タイマーの出力（'残り'）が確認できませんでした。"
    exit 1
fi
