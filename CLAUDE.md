# Playground

Flutter のマルチプラットフォームアプリ。技術検証用リポジトリ。

## 技術スタック

- Flutter (FVM: stable チャネル)
- 状態管理: Riverpod (hooks_riverpod + riverpod_annotation + riverpod_generator)
- ローカル状態: flutter_hooks
- ルーティング: go_router + go_router_builder（型安全ルート定義）
- データクラス: freezed + freezed_annotation
- Lint: very_good_analysis
- テスト: mocktail

## コマンド

- 実行: `flutter run --flavor dev` または `flutter run --flavor prod`
- テスト: `flutter test`
- 単一テスト: `flutter test <file_path>`
- コード生成: `dart run build_runner build --delete-conflicting-outputs`
- フォーマット: `dart format .`
- 静的解析: `dart analyze`

## Flavor

- `dev` と `prod` の 2環境。`--flavor` は必須（default flavor は設定しない）
- 環境値は `lib/core/env.dart` の `Env` クラスで `Flavor.current` を switch して取得

## ルーティング

- `go_router_builder` で型安全なルート定義（`GoRouteData` + `@TypedGoRoute`）
- ルート定義: `lib/router/route.dart`、GoRouter 生成: `lib/router/router.dart`
- `routerProvider` を Riverpod で提供し `ref.watch` で参照
- 遷移は生成されたルートクラスの `.go()` / `.push()` を使う

## コード生成

- `*.g.dart`（Riverpod, go_router_builder）と `*.freezed.dart` は自動生成
- `analysis_options.yaml` で `**/*.g.dart`, `**/*.freezed.dart`, `**/*.mocks.dart` を解析除外済み
- Provider、ルート、freezed クラスを変更したら `build_runner` を実行する

## ディレクトリ構成

`lib/feature/{feature_name}/` 配下に技術検証する feature ごとのフォルダを切る。
各 feature 内は Clean Architecture ベースの4層レイヤー構成に従う。

```
lib/feature/{feature_name}/
├── ui/            # View（Widget）、Hooks
├── application/   # State（Provider）、UseCase
├── domain/        # Entity、Repository Interface
└── infra/         # Repository 実装、DataSource、DTO
```

- 依存の方向: `ui → application → domain ← infra`
- `domain/` は外側のいかなる層にも依存しない
- DTO は `infra/` の外に出さない
- Repository Interface は `domain/` に、実装 + DI Provider は `infra/` に置く

## コーディング規約

- Lint ルールは `very_good_analysis` に従う（`public_member_api_docs` のみ無効化）
- Provider は `@riverpod` アノテーション + コード生成で定義
- ローカル状態は `flutter_hooks`（useState, useEffect 等）を使用
- データクラスは `freezed` で定義（copyWith, ==, toJson 等の自動生成）
