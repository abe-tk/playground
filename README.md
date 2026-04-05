# Playground

**ここは実験場です!**
新しいパッケージや設計パターンを気軽に試すための sandbox です。
「まず動かしてみる」を優先しているので、コード品質はゆるめ。
本番に持っていくなら書き直し推奨。

## セットアップ

```bash
fvm install
fvm flutter pub get
fvm dart run build_runner build --delete-conflicting-outputs
```

## 実行

```bash
# --flavor は必須（dev / prod）
fvm flutter run --flavor dev
```
