#  pomodoro_timer
[![test](https://github.com/s24c1025up-hash/pomodoro_timer/actions/workflows/test.yml/badge.svg)](https://github.com/s24c1025up-hash/pomodoro_timer/actions/workflows/test.yml)

**集中力を最大化させるための、ROS 2ポモドーロ・タイマーパッケージです。**

---

##  概要
このパッケージは、ROS 2のトピック通信を利用して、**25分の作業時間**と**5分の休憩時間**を自動で管理し、現在の状態と残り時間を配信します。
開発中にターミナルを確認するだけで、適切なタイミングで休憩を取ることができ、燃え尽き症候群を防ぐのに役立ちます。

## インストール方法
以下のコマンドをワークスペース（例: \`~/ros2_ws/src\`）で実行してください。

```bash
$ cd ~/ros2_ws/src
$ git clone https://github.com/s24c1025up-hash/pomodoro_timer.git
$ cd ~/ros2_ws
$ colcon build --symlink-install
$ source install/setup.bash
```

---

## 実行例

### 1. ノードの起動
ターミナルで以下のコマンドを実行すると、タイマーが開始されます。

```bash
$ ros2 run pomodoro_timer timer
```

### 2. 出力内容の確認
実行すると、1秒ごとに現在の状態（作業中/休憩中）と残り時間が表示されます。

```bash
[INFO] [pomodoro_timer]: 【作業中】 残り 25:00

[INFO] [pomodoro_timer]: 【作業中】 残り 24:59

[INFO] [pomodoro_timer]: ★★★ 休憩/作業が切り替わりました ★★★

[INFO] [pomodoro_timer]: 【休憩中】 残り 05:00
```

---

##  配信トピック
  - **内容**: 現在のモード（作業/休憩）と残り時間を文字列で配信します。
  - 他のノード（音を鳴らす、LEDを光らせる等）と連携するためのデータソースとして利用可能です。

##  必要な環境
- **OS**: Ubuntu 22.04 LTS
- **ROS 2**: Humble
- **Python**: 3.10以上

## ライセンス
- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
- © 2026 Ryuse Oshiba

##  謝辞
- このパッケージのディレクトリ構成およびテスト環境は、千葉工業大学 ロボットシステム学2025の講義資料を参考にしています。
    - [ryuichiueda/slides_marp/robosys2025](https://github.com/ryuichiueda/slides_marp/tree/master/robosys2025)

