# SwiftUI Projects

## [AppShortcuts](https://github.com/munsangu/SwiftUI/tree/master/AppShortcuts/AppShortcuts)

<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>

<p align="center"><img src="https://github.com/user-attachments/assets/0b19fd11-322b-4844-a3d0-f52f72af1fb0"></p>
<p align="center">
SwiftUI, SwiftData, AppIntents
</p>

### 主な機能:
- SwiftDataを活用したメモリーデータモデル管理
- AppIntentsを使用したカスタムショートカット統合
- 画像とキャプションを保存するメモリーアプリ
- ホーム画面で見られるメモリーリスト

### 実装の詳細:
- `Memory`モデルにSwiftData `@Model`アノテーションを適用
- `@Attribute(.externalStorage)`を使用して大きな画像データを効率的に管理
- `AddMemoryIntent`を通じたショートカット統合
- `AppShortcutsProvider`プロトコルでシステムショートカットにアプリ機能を公開

### 活用技術:
- SwiftUIを利用したUI構成
- SwiftDataによるデータの永続保存
- AppIntentsフレームワークによるショートカット統合

</details>

## [OTPTextField](https://github.com/munsangu/SwiftUI/tree/master/OTPTextField/OTPTextField)

<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>

<p align="center"><img src="https://github.com/user-attachments/assets/4305edfb-64c1-49e2-9f0a-3d788fd2f8b0"></p>
<p align="center">
SwiftUI, MVVM, TextField
</p>

### 主な機能:
- カスタマイズ可能なOTP/認証コード入力フィールド
- 2つのスタイルをサポート：丸枠（Rounded Border）と下線（Underlined）
- 4桁または6桁のコード入力をサポート
- 入力状態に応じた視覚的フィードバック（入力中、有効、エラー）
- 誤入力時の揺れアニメーション効果

### 実装の詳細:
- MVVMアーキテクチャの適用
- `VerificationFieldViewModel`によるステート管理
- `phaseAnimator`を活用したエラー時の揺れ効果
- テキストフィールドマスキング技法によるユーザー体験の向上
- `.textContentType(.oneTimeCode)`を活用した自動OTP認識のサポート

### 活用技術:
- SwiftUIカスタムビューとアニメーション
- MVVMパターンによる状態管理
- `FocusState`を用いたキーボード管理

</details>

## [FloatingBottomSheets](https://github.com/munsangu/SwiftUI/tree/master/FloatingBottomSheets/FloatingBottomSheets)

<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>

<p align="center"><img src="https://github.com/user-attachments/assets/fc7e4557-5bbe-48d6-b452-d94722b7ff9f"></p>
<p align="center">
SwiftUI, MVVM, Sheet
</p>

### 主な機能:
- フローティングボトムシートのカスタム実装
- 3つのシートタイプをサポート：アラート(Alert)、質問(Question)、リクエスト(Request)
- 各シートタイプ別の異なるデザインとボタン構成
- シートの影効果を除去した滑らかなUI

### 実装の詳細:
- `SheetConfiguration`、`ButtonConfig`、`IconConfig`による構成要素のモジュール化
- `UIViewRepresentable`プロトコルを活用した`SheetShadowRemover`の実装
- `floatingBottomSheet`ビューモディファイア(View Modifier)の拡張
- MVVMアーキテクチャによる状態管理

### 活用技術:
- SwiftUIとUIKitの統合
- ビュー拡張とカスタムモディファイア
- MVVMパターンによるボトムシート状態管理

</details>

## [InteractiveTabBar](https://github.com/munsangu/SwiftUI/tree/master/InteractiveTabBar/InteractiveTabBar)

<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>

<p align="center"><img src="https://github.com/user-attachments/assets/3392f632-f00c-4423-aea1-ab4096189ecc"></p>
<p align="center">
SwiftUI, MVVM, TabBar
</p>

### 主な機能:
- インタラクティブなカスタムタブバーの実装
- ドラッグジェスチャーによるタブ間の切り替え
- 滑らかなアニメーションによるタブ切り替え効果
- iOS 18以上とそれ以下のバージョン両方をサポート

### 実装の詳細:
- GeometryReaderと座標空間(Coordinate Space)を活用したタブ位置の追跡
- `onGeometryChange`カスタムモディファイアによるタブボタン位置の管理
- `matchedGeometryEffect`によるタブ切り替えアニメーションの実装
- 条件付きコードでiOS 18以上では新しいAPIを活用

### 活用技術:
- SwiftUIジェスチャーとアニメーション
- 座標空間とジオメトリリーダー
- MVVMパターンによるタブ状態管理
- 様々なiOSバージョンの互換性処理

</details>

## [CreditCardInputForm](https://github.com/munsangu/SwiftUI/tree/master/CreditCardInputForm/CreditCardInputForm)

<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>

<p align="center"><img src="https://github.com/user-attachments/assets/39fcd2d1-8aee-48c8-b415-4f6d74fd3a5c"></p>
<p align="center">
SwiftUI, Animation, 3D Effects
</p>

### 主な機能:
- インタラクティブなクレジットカード入力フォーム
- カード表面と裏面の3Dフリップアニメーション
- フォーカスされたフィールドに基づいたカード表示の動的な更新
- メッシュグラデーションを使用したリアルなカードデザイン
- フィールドごとのアニメーション強調表示

### 実装の詳細:
- `Card`モデルを使用したカード情報の管理
- カスタム`FlipTransition`モディファイアによる3D回転効果
- `rotation3DEffect`を用いたカードフリップアニメーション
- `FocusState`を活用した入力フィールド間のフォーカス管理
- カスタム文字列拡張機能による自動フォーマット処理（空白挿入、マスク化）

### 活用技術:
- SwiftUI 3Dアニメーションと遷移効果
- カスタムViewModifierによるトランジション実装
- 文字列操作のための拡張機能
- `matchedTransitionSource`によるフォーカスリングのアニメーション
- `contentTransition(.numericText())`による数値変更アニメーション

</details>

## [InteractiveFloatingActionButton](https://github.com/munsangu/SwiftUI/tree/master/InteractiveFloatingActionButton/InteractiveFloatingActionButton)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/10f4c19c-d732-4580-8dbe-8bc3e37da1ed"></p>
<p align="center">
SwiftUI, MVVM, GestureRecognizers
</p>

### 主な機能:
- ドラッグ可能な浮動アクションボタン
- 展開可能なアクションメニュー
- カスタマイズ可能なアクションアイコンとアニメーション
- ジェスチャー認識による直感的な操作体験

### 実装の詳細:
- MVVMアーキテクチャによるコード設計
- 長押しと同時ドラッグジェスチャーの組み合わせ
- SwiftUIのアニメーションシステムを活用した滑らかな遷移
- カスタムCoordinateSpaceを用いた位置検出
- ResultBuilderパターンによる宣言的なAPI設計

### 活用技術:
- SwiftUIの最新機能を活用したUI構築
- ジェスチャー認識と処理
- カスタムビュー修飾子とアニメーション
- ビジネスロジックの分離とテスト容易性の向上
</details>

## [ResponsiveChipsSelection](https://github.com/munsangu/SwiftUI/tree/master/ResponsiveChipsSelection/ResponsiveChipsSelection)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/0e9f4294-338c-45bd-8b7f-744ca9ece12b"></p>
<p align="center">
SwiftUI, MVVM, ResponsiveLayout
</p>

### 主な機能:
- レスポンシブなチップ選択UIコンポーネント
- 動的グリッドレイアウトの実装
- アニメーション付き選択状態表示
- 複数選択機能のサポート
- カスタムレイアウトシステムの活用

### 実装の詳細:
- MVVMアーキテクチャパターンによるコード構造化
- SwiftUIのLayoutプロトコルを活用したカスタムチップレイアウト
- ObservableObjectによる状態管理
- ジェネリクスを活用した柔軟なコンテンツ構成
- アニメーションとトランジション効果を適用したインタラクション

### 活用技術:
- SwiftUIの最新機能を活用したUI開発
- カスタムレイアウトアルゴリズムの実装
- 状態管理およびデータバインディング
- 再利用可能なコンポーネント設計
- 拡張可能なアーキテクチャ構造
</details>

## [ExpandableCustomSlider](https://github.com/munsangu/SwiftUI/tree/master/ExpandableCustomSlider/ExpandableCustomSlider)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/d737376f-6614-4d50-9714-464115257c27"></p>
<p align="center">
SwiftUI, MVVM, カスタムコンポーネント
</p>

### 主な機能:
- ドラッグ時に拡張するインタラクティブスライダーコンポーネント
- カスタマイズ可能なデザイン設定
- スムーズなアニメーショントランジション効果
- 直感的なユーザーインターフェース
- 再利用可能なコンポーネント設計

### 実装の詳細:
- MVVMアーキテクチャパターンによるコード構造化
- SwiftUIのGeometryReaderを活用したサイズベースのレイアウト
- ObservableObjectによる状態管理
- ジェネリクスを活用した柔軟なオーバーレイコンテンツ構成
- アニメーションとトランジション効果を適用したインタラクション

### 活用技術:
- SwiftUIの最新機能を活用したUI開発
- ジェスチャー認識および処理システムの実装
- 状態管理およびデータバインディング
- 再利用可能なコンポーネント設計
- 拡張可能なアーキテクチャ構造
</details>
