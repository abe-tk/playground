# Playground

Flutter の技術検証用リポジトリ。
新しいパッケージや設計パターンを試すための sandbox として使用する。

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
