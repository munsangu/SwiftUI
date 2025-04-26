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

## [CoverFlow](https://github.com/munsangu/SwiftUI/tree/master/CoverFlow/CoverFlow)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/9a423e71-612b-498f-842d-5252b28ca7bc"></p>
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

## [AnimatedChart](https://github.com/munsangu/SwiftUI/tree/master/AnimatedChart/AnimatedChart)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/acdc63c9-987e-4a11-bab0-2e3b3a8387fc"></p>
<p align="center">
SwiftUI, MVVM, Charts, アニメーション
</p>

### 主な機能:
- 複数のチャートタイプ（棒グラフ、折れ線グラフ、円グラフ）の切り替え
- スムーズなデータアニメーション効果
- インタラクティブなチャートデータ更新
- 直感的なユーザーインターフェース
- 再利用可能なチャートコンポーネント

### 実装の詳細:
- MVVMアーキテクチャパターンによるコード構造化
- SwiftUI Chartsフレームワークを活用したデータビジュアライゼーション
- ObservableObjectによる状態管理
- コンポーネント別のモジュラー設計
- 順次的なアニメーションとトランジション効果

### 活用技術:
- SwiftUI Chartsによるデータビジュアライゼーション
- スプリングアニメーションによる自然な動きの実現
- カスタマイズ可能なチャート表示オプション
- 再利用可能なコンポーネント設計
- 拡張可能なアーキテクチャ構造
</details>

## [CustomKeyboard](https://github.com/munsangu/SwiftUI/tree/master/CustomKeyboard/CustomKeyboard)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/ee653073-0924-4790-95b2-5fdbee59ca61"></p>
<p align="center">
SwiftUI, MVVM, カスタムキーボード, UIViewControllerRepresentable
</p>

### 主な機能:
- ネイティブなUIとマッチしたカスタムキーボードの実装
- 数字入力用の専用キーボードインターフェース
- スマートな入力フィールドとキーボードの連携
- ピンコード入力に最適化されたデザイン
- 直感的な操作体験の提供

### 実装の詳細:
- MVVMアーキテクチャパターンによるコード構造化
- UIViewControllerRepresentableを活用したUIKitとSwiftUIの統合
- カスタムキーボードの自然な挙動の実現
- コンポーネント分離による再利用性の向上
- FocusStateを用いたキーボード状態管理

### 活用技術:
- SwiftUIとUIKitの橋渡しとなるUIViewControllerRepresentable
- シャドウ効果とモダンなUIデザイン
- カスタムコンポーネントの分離と再利用
- コールバックパターンによるView間の通信
- クリーンなMVVMアーキテクチャの実装
</details>

## [CompositionalGridLayout](https://github.com/munsangu/SwiftUI/tree/master/CompositionalGridLayout/CompositionalGridLayout)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/d9dcdeef-ae4c-4e5e-af24-a716e66959f2"></p>
<p align="center">
SwiftUI, MVVM, コンポジショナルグリッドレイアウト, アニメーション
</p>

### 主な機能:
- 様々なレイアウトパターンを含む複合的なグリッドの実装
- 動的に列数を変更できるインターフェース
- レイアウト変更時の滑らかなアニメーション効果
- 多様なグリッドパターン（1+2、水平、1+垂直、など）
- 再利用可能なコンポーネント設計

### 実装の詳細:
- MVVMアーキテクチャパターンによるコード構造化
- GroupとGeometryReaderを活用した複合レイアウトの実装
- matchedGeometryEffectを活用した滑らかな遷移アニメーション
- コンポーネント分離によるコードの再利用性向上
- 宣言的UIを実現するためのSwiftUIの活用

### 活用技術:
- SwiftUIの宣言的UIフレームワーク
- 複合的なレイアウトのためのLazyVStackおよびHStack
- 動的レイアウト生成のためのGeometryReader
- アニメーションのためのNamespaceとmatchedGeometryEffect
- Observableパターンを活用した状態管理
- 拡張性のあるMVVMアーキテクチャの実装
</details>

## [ParticleEffect](https://github.com/munsangu/SwiftUI/tree/master/ParticleEffect/ParticleEffect)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/8512ea90-35f4-4ca7-a491-bb5a7629fa19"></p>
<p align="center">
SwiftUI, MVVM, パーティクルアニメーション, インタラクティブUI
</p>

### 主な機能:
- インタラクティブなボタン操作のためのパーティクルエフェクト実装
- ボタン状態変更に応じた動的パーティクルアニメーション
- カスタマイズ可能なカラーテーマとアイコン
- 滑らかなスプリングアニメーション効果
- 再利用可能なコンポーネントデザイン

### 実装の詳細:
- MVVMアーキテクチャパターンによるコード構造化
- パーティクル生成とアニメーションのためのビューモデルロジック分離
- カスタムボタンコンポーネントによるコード再利用性の向上
- SwiftUIのアニメーションAPIを活用した滑らかな遷移効果
- 状態変化に応じた動的UI更新

### 活用技術:
- SwiftUIの宣言的UIフレームワーク
- MVVMパターンによるビジネスロジックとUIの分離
- 状態管理のためのObservableパターン活用
- 複雑なアニメーションのためのwithAnimation API
- 再利用可能なコンポーネントのためのViewBuilder活用
- インタラクティブなユーザー体験のためのボタンとジェスチャー実装
</details>

## [Toast](https://github.com/munsangu/SwiftUI/tree/master/Toast/Toast)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/99bf5954-499d-4754-affc-2fd9a58c6690"></p>
<p align="center">
SwiftUI, MVVM, インタラクティブトースト, アダプティブUI
</p>

### 主な機能:
- 様々なタイプのトーストメッセージ対応 (Error, Success, Warning, Apple Like HUD)
- トーストメッセージの展開/縮小インタラクティブ機能
- スワイプによるトースト削除機能
- 複数のトーストメッセージのスタック管理システム
- トーストタイプに応じたアダプティブレイアウト

### 実装の詳細:
- MVVMアーキテクチャパターンによるコード構造化
- トースト生成と管理のためのビューモデルロジック分離
- トーストコンポーネントの再利用性向上のための設計
- SwiftUIのアニメーションAPIを活用した滑らかな遷移効果
- 状態変化に応じた動的UI更新

### 活用技術:
- SwiftUIの宣言的UIフレームワーク
- MVVMパターンによるビジネスロジックとUIの分離
- 状態管理のためのObservableパターン活用
- 複雑なアニメーションのためのwithAnimation API
- 再利用可能なコンポーネントのためのViewBuilder活用
- インタラクティブなユーザー体験のためのジェスチャー実装
- AnyLayoutを活用した動的レイアウト切替
</details>

## [AsyncButton](https://github.com/munsangu/SwiftUI/tree/master/AnimatedStateButton/AnimatedStateButton)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/d4cd3672-6ca6-491a-9229-9394c101c1d2"></p>
<p align="center">
SwiftUI, MVVM, 非同期処理, アニメーションボタン
</p>

### 主な機能:
- トランザクション状態に応じた動的なボタン表示切替
- 非同期処理中のローディングインジケーター表示
- 状態ごとの色とアイコン変更による視覚的フィードバック
- タップ時の洗練されたスケールアニメーション効果
- 再利用可能なコンポーネント設計

### 実装の詳細:
- MVVMアーキテクチャパターンによるコード構造化
- トランザクション状態管理のためのビューモデルロジック分離
- 非同期処理をSwift Concurrencyモデルで実装
- カスタムスピナーコンポーネントによるローディング表示
- 異なる状態間の滑らかなトランジション

### 活用技術:
- SwiftUIの宣言的UIフレームワーク
- MVVMパターンによるビジネスロジックとUIの分離
- Swift Concurrencyを活用した非同期処理
- 状態管理のためのObservableパターン活用
- 複雑なアニメーションのための.animation修飾子
- カスタムボタンスタイルによるインタラクティブ効果
- 再利用可能なコンポーネント設計
</details>

## [RollingCounter](https://github.com/munsangu/SwiftUI/tree/master/RollingCounter/RollingCounter)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/02a0ab75-3afd-43e5-a400-cd30e888879d"></p>
<p align="center">
SwiftUI, MVVM, アニメーション, ローリングカウンター
</p>

### 主な機能:
- 数値変更時のスムーズなローリングアニメーション表示
- 桁数の増減に応じた動的なレイアウト調整
- ランダム値生成によるインタラクティブな数値変更
- カスタマイズ可能なフォントとスタイル設定
- エンタープライズレベルのMVVMアーキテクチャ実装

### 実装の詳細:
- MVVMアーキテクチャによるコードの明確な分離
- 数値表示のためのカスタムビューコンポーネント設計
- 各桁の独立したアニメーション制御メカニズム
- インタラクティブスプリングアニメーションによる自然な動き
- ジオメトリリーダーを活用した動的なレイアウト計算

### 活用技術:
- SwiftUIフレームワークによる宣言的UI実装
- Combineフレームワークを用いた反応型プログラミング
- GCD（Grand Central Dispatch）による非同期処理
- カスタムビューモディファイアによるUI拡張
- 階層的プロジェクト構造による保守性の向上
- ジオメトリリーダーによる高度なレイアウト制御
- アニメーションタイミングの精密な調整
- 再利用可能なコンポーネント設計パターン
</details>

## [DisintegrationEffect](https://github.com/munsangu/SwiftUI/tree/master/DisintegrationEffect/DisintegrationEffect)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/c428e773-2e9a-4125-8029-a12382a98ef4"></p>
<p align="center">
SwiftUI, MVVM, アニメーション, 分解エフェクト
</p>

### 主な機能:
- タップ操作による要素の分解・再構成アニメーション
- パーティクルベースの高度なビジュアルエフェクト
- スムーズな遷移と自然な動きを実現するアニメーション
- カスタマイズ可能な分解・再構成エフェクト
- エンタープライズレベルのMVVMアーキテクチャ実装

### 実装の詳細:
- MVVMアーキテクチャによるコードの明確な分離
- UIKitとSwiftUIの連携によるスナップショット機能
- パーティクルシステムによる複雑なアニメーション制御
- ビューの分解・再構成を実現する高度なアルゴリズム
- マルチスレッド処理による高パフォーマンスの実現

### 活用技術:
- SwiftUIフレームワークによる宣言的UI実装
- カスタムビューモディファイアによる再利用可能なエフェクト
- GCD（Grand Central Dispatch）とTaskによる非同期処理
- UIGraphicsImageRendererを活用した画像処理
- 階層的プロジェクト構造による保守性の向上
- アニメーションタイミングの精密な調整
- パーティクルベースのビジュアルエフェクト実装
- 再利用可能なコンポーネント設計パターン
</details>

## [FlipClockTextEffect](https://github.com/munsangu/SwiftUI/tree/master/FlipClockTextEffect/FlipClockTextEffect)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/27cb9ddc-5fdb-428e-8745-f10cde6791b8"></p>
<p align="center">
SwiftUI, MVVM, アニメーション, フリップ時計, 3Dエフェクト
</p>

### 主な機能:
- リアルタイムでの時:分:秒表示フリップアニメーション
- 時間の各桁が独立して3D回転するアニメーション効果
- 24時間形式での時刻表示
- スムーズな遷移アニメーションと自然な動き
- エンタープライズレベルのMVVMアーキテクチャ実装

### 実装の詳細:
- MVVMアーキテクチャによるコードの明確な分離
- 時間の各桁に対する独立した3D回転アニメーション
- UIの各パーツを分割・再利用可能なコンポーネント設計
- カスタム修飾子によるアニメーショントランジション制御
- 1秒ごとの正確な時刻更新メカニズム

### 活用技術:
- SwiftUIフレームワークによる宣言的UI実装
- Combineフレームワークを用いたリアクティブプログラミング
- ポートレートモード固定による最適なUX設計
- 3D回転エフェクトによる高度なアニメーション処理
- カスタムビューモディファイアによるUI拡張
- 階層的プロジェクト構造による保守性の向上
- タイマーベースの時間更新システム
- 時間変更検出による効率的なUI更新メカニズム
- モノスペースフォントによる一貫したレイアウト制御
- デバイス回転に対応した適応型レイアウト設計
</details>

## [StackedCards](https://github.com/munsangu/SwiftUI/tree/master/StackedCards/StackedCards)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/0283f89d-a9dd-4504-9129-e9cd00346626"></p>
<p align="center">
SwiftUI, MVVM, アニメーション, スタックカード, 視覚効果
</p>

### 主な機能:
- 水平スクロールによるカードスタッキング効果
- カードが重なり合う3D視覚効果
- 回転と拡大縮小を組み合わせたユニークな遷移効果
- スクロールインジケーターの表示/非表示オプション
- 回転効果のオン/オフ設定機能

### 実装の詳細:
- MVVMアーキテクチャによるコードの明確な分離
- GeometryReaderを活用した正確なスクロール位置の追跡
- UIコンポーネントの再利用可能な設計
- カスタムZインデックス計算によるカードの重なり順序制御
- VisualEffectモディファイアを使用した複合的なアニメーション効果
- スナッピーアニメーションによる自然な動きの実現
- ページングスクロール動作による直感的なユーザー体験

### 活用技術:
- SwiftUIフレームワークによる宣言的UI実装
- ObservableObjectを使用したリアクティブな状態管理
- UIパラメータのリアルタイム制御
- カスタムジオメトリ計算による高度な視覚効果
- カードのパラメータ化された回転と拡大縮小効果
- ページングスクロール動作の最適化
- スクロールインジケーターの動的制御
- 階層的プロジェクト構造による保守性の向上
- カラーグラデーションによる視覚的エンゲージメントの向上
- エンタープライズ品質のコード構造と分離
</details>

## [VerticalCircularCarousel](https://github.com/munsangu/SwiftUI/tree/master/VerticalCircularCarousel/VerticalCircularCarousel)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/1684c232-7066-4043-b493-447238816583"></p>
<p align="center">
SwiftUI, MVVM, アニメーション, 円形カード配置, 視覚効果
</p>

### 主な機能:
- 垂直スクロールによるカードの円形配置効果
- カードが重なり合う3D視覚効果
- 回転と位置調整を組み合わせたユニークな遷移効果
- スクロールインジケーターの表示/非表示オプション
- カード選択機能による直感的なユーザーインターフェース

### 実装の詳細:
- MVVMアーキテクチャによるコードの明確な分離
- GeometryReaderを活用した正確なスクロール位置の追跡
- UIコンポーネントの再利用可能な設計
- カスタム回転計算によるカードの動的な配置
- VisualEffectモディファイアを使用した複合的なアニメーション効果
- スナッピーアニメーションによる自然な動きの実現
- ページングスクロール動作による直感的なユーザー体験

### 活用技術:
- SwiftUIフレームワークによる宣言的UI実装
- ObservableObjectを使用したリアクティブな状態管理
- UIパラメータのリアルタイム制御
- カスタムジオメトリ計算による高度な視覚効果
- カードのパラメータ化された回転効果
- ページングスクロール動作の最適化
- スクロールインジケーターの動的制御
- 階層的プロジェクト構造による保守性の向上
- カラーグラデーションによる視覚的エンゲージメントの向上
- エンタープライズ品質のコード構造と分離
</details>

## [VisionOSMenuBar](https://github.com/munsangu/SwiftUI/tree/master/VisionOSMenuBar/VisionOSMenuBar)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center">
  <img src="https://github.com/user-attachments/assets/b7aff230-9adc-4983-a62a-9281ba3d9133">
  <img src="https://github.com/user-attachments/assets/b3e46805-8ba8-4d75-af82-db8078864daa">
</p>
<p align="center">
SwiftUI, MVVM, VisionOS風UI, アニメーション, メニューコントロール
</p>

### 主な機能:
- VisionOS風のスタイリングとインターフェース
- モダンなメニューコントロールシステム
- 美しいアニメーションでの状態遷移
- 洗練されたぼかし効果とオーバーレイ
- 特殊な視覚効果を適用したカスタムUI要素
- 直感的なノート管理インターフェース

### 実装の詳細:
- MVVMアーキテクチャによるクリーンな責任分離
- ジオメトリリーダーを活用した正確な位置計算
- カスタムViewモディファイアによる再利用可能なコンポーネント
- 複合的な視覚効果のためのレイヤー処理
- アニメーションの連鎖による滑らかなUI遷移
- レスポンシブデザインによる適応型レイアウト
- カスタムシャドウとマテリアルエフェクトの組み合わせ

### 活用技術:
- SwiftUIフレームワークによる宣言的UI実装
- ObservableObjectによるリアクティブな状態管理
- GeometryPreferenceを使用した高度なレイアウト調整
- カスタム拡張機能によるSwiftUIの機能拡張
- 階層的ビュー構造による保守性の向上
- 定数管理による一貫したUIパラメータ
- アクセシビリティに配慮したインターフェース設計
- アニメーションパラメータの微調整による自然な動き
- マテリアルデザインの原則を応用したUI要素
- エンタープライズ品質のコード構造と明確な責任分離
</details>

## [DropdownPicker](https://github.com/munsangu/SwiftUI/tree/master/DropdownPicker/DropdownPicker)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/a3e6b92e-2a62-4cc4-b203-89316f570c83"></p>
<p align="center">
SwiftUI, MVVM, カスタムドロップダウン, アニメーション, UI/UXデザイン
</p>

### 主な機能:
- スムーズなアニメーションを備えたカスタムドロップダウンメニュー
- モダンなUI/UXデザイン
- MVVMアーキテクチャの実装
- タップ操作によるインタラクティブな要素
- バックグラウンドのぼかし効果とオーバーレイ
- 項目選択時の視覚的フィードバック

### 実装の詳細:
- MVVMパターンに基づいたクリーンなコード構造
- ジオメトリリーダーを使用した正確な位置調整
- カスタムビュー修飾子による再利用可能なUI実装
- アニメーションシーケンスの最適化
- スクロール位置の追跡と管理
- カスタムマスクとシェイプの適用
- 背景オーバーレイの洗練された実装

### 活用技術:
- SwiftUIフレームワーク
- ObservableObject
- カスタムビュー修飾子
- ジオメトリリーダーによる位置計算
- アニメーションとトランジション
- スクロールビューとスクロールターゲット
- カスタムマスク効果
- 条件付きビュー表示
- ビュー階層の効果的な管理
- 安全エリアの適切な処理
- UIコンポーネントの再利用性向上
</details>

## [CustomYTHeader](https://github.com/munsangu/SwiftUI/tree/master/CustomYTHeader/CustomYTHeader)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/14a6bb9d-b7a4-492f-b721-950cd9969098"></p>
<p align="center">
SwiftUI, MVVM, スクロールアニメーション, UI/UXデザイン, YouTubeスタイルヘッダー
</p>

### 主な機能:
- YouTubeスタイルのスクロール追従ヘッダー
- スクロール方向に基づいた自動表示/非表示アニメーション
- MVVMアーキテクチャによる設計
- 効率的なスクロール位置検出と追跡
- スケルトンローディングUI
- スクロール停止時の自然なスナップ効果

### 実装の詳細:
- MVVMパターンによるビジネスロジックと表示の分離
- 再利用可能なスクロール検出モディファイア
- スクロールフェーズの変化に応じた洗練されたアニメーション
- GeometryReaderを活用した正確な位置計算
- カスタムExtensionによるコード再利用性の向上
- スケルトンUIによるエレガントなローディング表現
- コンポーネント分割による保守性の向上

### 活用技術:
- SwiftUIフレームワーク
- ObservableObjectとStateObject
- カスタムViewModifier
- スクロール状態追跡と処理
- アニメーションとトランジション
- GeometryProxyを活用した位置計算
- スクロールフェーズ検出
- カスタムPreferenceKey
- ビューコンポーネントの分離
- 安全エリアの適切な処理
- スケルトンローディングパターン
- バウンス効果を考慮したオフセット計算
</details>

## [WaveAnimationCanvas](https://github.com/munsangu/SwiftUI/tree/master/CanvasApp/CanvasApp)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/46241dd9-34cd-4174-9b1e-9d6e0dc27e4d"></p>
<p align="center">
SwiftUI, MVVM, Canvas API, タイムラインアニメーション, 波形エフェクト
</p>

### 主な機能:
- Canvas APIを活用した流動的な波形アニメーション
- 複数のレイヤーによる深度と立体感の表現
- トグルによるインタラクティブな色彩変化
- MVVMアーキテクチャによる設計
- 効率的なアニメーションレンダリング
- リアルタイムの波形変化と動き

### 実装の詳細:
- MVVMパターンによるビジネスロジックと表示の分離
- TimelineViewを活用したフレームベースアニメーション
- Canvas APIを使用した高パフォーマンス描画
- 再利用可能な波形コンポーネント
- アニメーション方向の反転による重層的な視覚効果
- Combineフレームワークを活用したデータバインディング
- コンポーネント分割による保守性の向上
- 色彩の透明度を活用した深度表現

### 活用技術:
- SwiftUIフレームワーク
- Canvas APIによる高度な描画
- TimelineViewによるアニメーション制御
- ObservableObjectとStateObject
- Combineによるデータフロー管理
- 波形生成アルゴリズム
- パスベースのグラフィック描画
- 複数レイヤーのコンポジション
- UIのコンポーネント化
- 時間ベースのアニメーション計算
- 色彩と透明度の効果的な活用
- トグルによるインタラクティブ制御
</details>

## [CustomTimePicker](https://github.com/munsangu/SwiftUI/tree/master/CustomTimePicker/CustomTimePicker)

<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>

<p align="center"><img src="https://github.com/user-attachments/assets/c4f633d5-0574-455c-bc35-93ebaeb9defc"></p>

<p align="center">
SwiftUI, MVVM, UIKitインテグレーション, カスタムピッカー, エンタープライズアーキテクチャ
</p>

### 主な機能:
- カスタマイズされたホイールスタイルのタイムピッカー
- 時間、分、秒の個別選択機能
- UIPickerViewのインジケーターを非表示にする高度なカスタマイズ
- MVVMアーキテクチャによる設計
- UIKitとSwiftUIの統合
- エンタープライズレベルのコード構造

### 実装の詳細:
- MVVMパターンによるビジネスロジックと表示の分離
- UIViewRepresentableを活用したUIKitコンポーネントの統合
- 再利用可能なピッカーコンポーネント
- 明確に定義された責任分担
- Combineフレームワークを活用したデータバインディング
- コンポーネント分割による保守性の向上
- 入力値の検証と制約

### 活用技術:
- SwiftUIフレームワーク
- UIViewRepresentableによるUIKit統合
- ObservableObjectとStateObject
- Combineによるデータフロー管理
- カスタムピッカーインターフェース
- UIKitコンポーネントの拡張
- バインディングとパブリッシャー
- プロパティラッパーの効果的な活用
- ViewBuilderによるカスタムコンポーネント
- モジュール化された設計
- 堅牢なエラー処理
- エンタープライズレベルのドキュメンテーション
</details>

## [AppIntroAnimation](https://github.com/munsangu/SwiftUI/tree/master/AppIntroAnimation/AppIntroAnimation)

<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>

<p align="center"><img src="https://github.com/user-attachments/assets/1c6b9d74-469d-4d27-b1d6-805a7ebfd570"></p>
<p align="center">
SwiftUI, MVVM, アニメーション
</p>

### 主な機能:
- スタイリッシュなアプリ紹介アニメーション
- スムーズなテキストとカラートランジション効果
- ユーザーフレンドリーなログインオプション
- 拡張可能なMVVMアーキテクチャ

### 実装の詳細:
- `Intro`モデルを使用して、各アニメーションステートを構造化
- `IntroViewModel`を通じたアニメーションロジックの管理
- `withAnimation`を使用したシーケンシャルなアニメーション
- カスタム`View`拡張によるUIコンポーネントの再利用性向上
- コンポーネント指向設計によるコードの整理

### 活用技術:
- SwiftUIの宣言的UI構築
- MVVMデザインパターンの実装
- カスタムモディファイアによるUIの再利用性
- コンプレックスなアニメーションシーケンス
- タスクベースの非同期処理
</details>

## [AnimatedTapIcon](https://github.com/munsangu/SwiftUI/tree/master/AnimatedTapIcon/AnimatedTapIcon)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/1551cc00-e476-4e81-996c-d178e7190ba3"></p>
<p align="center">
SwiftUI, MVVM, シンボルエフェクト, カスタムタブバー
</p>

### 主な機能:
- アニメーション付きカスタムタブバー
- バウンスエフェクトの方向選択
- 洗練されたUI/UXデザイン
- コンポーネントベースのMVVMアーキテクチャ

### 実装の詳細:
- `Tab`モデルを使用して各タブの設定を構造化
- `AnimatedTab`によるアニメーション状態の管理
- `TabBarViewModel`でUIロジックを集中管理
- `.symbolEffect`を活用したインタラクティブなアイコンアニメーション
- 再利用可能なUIコンポーネントによる構成

### 活用技術:
- SwiftUIの宣言的UI構築
- MVVMデザインパターンの実装
- シンボルエフェクトAPIによるアニメーション
- カスタムトランザクションによるアニメーション制御
- コンポーネント指向の設計アプローチ
- 拡張可能なアーキテクチャ構造
</details>

## [AppThemeSwitcher](https://github.com/munsangu/SwiftUI/tree/master/AppThemeSwitcher/AppThemeSwitcher)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/d48633d8-c4ed-4654-8ed5-d1e949a26f9a"></p>
<p align="center">
SwiftUI, MVVM, テーマ切り替え, アニメーション, カスタムUI
</p>

### 主な機能:
- ダイナミックなテーマ切り替え (システム・ライト・ダークモード)
- アニメーション付きテーマ表示
- スムーズなトランジションエフェクト
- 直感的なユーザーインターフェース
- 状態保存によるテーマ設定の永続化

### 実装の詳細:
- `Theme`列挙型による異なるテーマオプションの管理
- `ThemeViewModel`でのUI状態と設定の一元管理
- `@AppStorage`を活用したテーマ設定の永続化
- `.matchedGeometryEffect`によるスムーズなトランジション
- 明確に分離されたコンポーネントベースのビュー設計
- アニメーション制御のための詳細な実装

### 活用技術:
- SwiftUIの宣言的UI構築
- MVVMアーキテクチャパターンの実装
- カスタムアニメーションとトランジション
- SheetとPresentationモディファイアによるモーダル表示
- 再利用可能なコンポーネント指向の設計
- プロパティラッパーを活用した状態管理
- 拡張性と保守性を考慮したエンタープライズレベルの設計
</details>

## [CustomTextFieldMenu](https://github.com/munsangu/SwiftUI/tree/master/CustomTextFieldMenu/CustomTextFieldMenu)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/5b0ea014-f912-4de4-9817-379c73965b82"></p>
<p align="center">
SwiftUI, MVVM, テキストフィールドカスタマイズ, UIKitブリッジング
</p>

### 主な機能:
- テキストフィールドへのカスタムコンテキストメニュー追加
- テキスト選択時の変換操作（大文字・小文字）
- システム提案の表示/非表示切り替え
- UIKitとSwiftUIのシームレスな統合
- MVVMパターンによる構造化された設計

### 実装の詳細:
- `TextFieldAction`モデルを使用してカスタムアクションを定義
- `TextFieldState`による効率的な状態管理
- `ContentViewModel`でビジネスロジックを分離
- `ResultBuilder`パターンを活用したDSL構文
- `UIViewRepresentable`によるUIKit機能のSwiftUI統合
- 再利用可能なコンポーネントによるモジュール化

### 活用技術:
- SwiftUIの宣言的UI構築
- MVVMアーキテクチャパターンの適用
- UIKitブリッジングテクニック
- カスタム結果ビルダーの実装
- コンポジショナルデザインアプローチ
- テキスト操作のプログラマティック制御
- バインディングを活用した状態管理
- エンタープライズレベルのコード構造化と分離
</details>

## [AlertDrawer](https://github.com/munsangu/SwiftUI/tree/master/AlertDrawer/AlertDrawer)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/c94d8552-3679-48eb-9760-5ae85b9721b0"></p>
<p align="center">
SwiftUI, MVVM, テキストフィールドカスタマイズ, UIKitブリッジング
</p>

### 主な機能:
- ボタンから展開するアニメーションアラートドロワー
- カスタマイズ可能なテーマとスタイリング
- 柔軟なコンテンツレイアウト
- 自然なアニメーショントランジション
- プライマリおよびセカンダリボタンアクション

### 実装の詳細:
- `DrawerConfig`モデルによるテーマとアニメーション設定
- ビュー拡張によるモジュラー実装（`View.alertDrawer`モディファイア）
- ジオメトリトラッキングによる正確な位置計算
- ボタンスタイルのカスタマイズとアニメーション処理

### 活用技術:
- SwiftUIの宣言的UI構築
- アニメーションとトランジション効果
- ジオメトリリーダーを活用した動的レイアウト
- カスタムモディファイアパターン
- 視覚効果の合成
</details>

## [SlideControl](https://github.com/munsangu/SwiftUI/tree/master/SlideControl/SlideControl)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center">
  <img src="https://github.com/user-attachments/assets/35865960-6955-42d1-a76a-baa34948dc0b">
  <img src="https://github.com/user-attachments/assets/7d428901-b064-4a01-859e-11f2885404ed">
</p>
<p align="center">
SwiftUI, MVVM, スライド操作UI, アニメーション, コンファームボタン
</p>

### 主な機能:
- スワイプでアクションを確定する直感的な操作
- 成功時の状態遷移アニメーション（チェックマークに変化）
- テキストにシマー効果を適用した洗練されたインジケーション
- スライド中・完了後の進捗に応じたUI変更
- スムーズなレスポンスとリアルタイムな反映

### 実装の詳細:
- `MVVM`アーキテクチャによる明確な責務分離
- `@ObservableObject`を用いたリアクティブな状態管理
- `GeometryReader`による制限付きのスライド距離計算
- `DragGesture`による滑らかなインタラクション
- `ViewModel`によるロジックの統一管理
- `withAnimation(.smooth)`を活用した自然なエフェクト
- ユーザーの操作に対する即時レスポンス設計

### 活用技術:
- `SwiftUI`の宣言的UI構文
- `StateObject`を用いたViewModelライフサイクル管理
- アニメーションチェーンと条件付きオーバーレイ
- 拡張可能な`Config`モデルによる柔軟な設定
- `ZStack`や`mask`を活用したレイヤードUI構造
- アクセシビリティを考慮した文字サイズとコントラスト
- `onSwiped`クロージャで任意のアクション実行可能
- スタイルを共通化した再利用可能なUIコンポーネント
- 見た目と機能を両立したエンタープライズ品質のコード構造
</details>

## [RippleTransition](https://github.com/munsangu/SwiftUI/tree/master/RippleTransition/RippleTransition)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/4348c0d7-21e9-427b-8f76-20dbd385bbbf"></p>
<p align="center">
SwiftUI, MVVM, カスタムトランジション, UI/UXデザイン, リップルアニメーション
</p>

### 主な機能:
- タップ位置から波紋（リップル）状に広がるトランジションアニメーション
- リップルを利用した画面切り替えとオーバーレイ表示の演出
- MVVMアーキテクチャに基づいた構成
- ユーザー操作に応じたダイナミックなUIアニメーション
- シンプルかつ拡張性の高いコンポーネント構成

### 実装の詳細:
- GeometryReaderを活用したタップ位置の正確な取得
- AnyTransitionのカスタムモディファイアによるアニメーション制御
- RippleとReverseRippleの2種類のトランジションを提供
- RippleModifier, Transitionファイルの分離による責務の明確化
- ViewModelによる状態管理とロジック分離
- 拡張性と保守性を意識したコンポーネント設計

### 活用技術:
- SwiftUIフレームワーク
- ObservableObject, @State, @Publishedによる状態管理
- カスタムViewModifier（Ripple）
- AnyTransitionによるトランジション制御
- GeometryReaderを用いたビューサイズ・座標の取得
- ZStackとoverlayによる階層的なUI構成
- NavigationStackを使った画面遷移構成
- タップジェスチャーの位置座標取得（coordinateSpace）
</details>

## [Skeleton](https://github.com/munsangu/SwiftUI/tree/master/Skeleton/Skeleton)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center">
  <img src="https://github.com/user-attachments/assets/5d98db50-ed46-433c-ba1f-4fba665dd09b">
  <img src="https://github.com/user-attachments/assets/a2d845c4-297f-46cb-8a38-7f21e5cd5ca0">
</p>
<p align="center">
SwiftUI, MVVM, スケルトンUI, アニメーション, タップジェスチャー
</p>

### 主な機能:
- カードをタップして表示／非表示を切り替えるインタラクティブなUI
- 情報が読み込まれていない状態でのスケルトンアニメーション表示
- タイトル・サブタイトル・説明に対応したダイナミックカードビュー
- 状態に応じてリアルタイムにカードコンテンツが変化
- レスポンシブで自然な表示トランジション

### 実装の詳細:
- `MVVM`アーキテクチャによるロジックとUIの分離
- `@StateObject`によるViewModelライフサイクルの明示的管理
- `@Published`プロパティで状態変化を即座にUIへ反映
- `withAnimation(.smooth)`でタップ時に滑らかなアニメーションを実現
- `Optional Binding`を活用した条件付きUI表示
- データ非表示時は `SkeletonView` によるスケルトンプレースホルダを表示
- `Image`, `Text`, `ZStack` による情報カードの構成

### 活用技術:
- `SwiftUI`の宣言的UI構築
- スケルトン用の `Custom View` を独自実装し、再利用可能に設計
- `clipShape`, `shadow`, `cornerRadius` による洗練されたカードUI
- `GeometryReader` による `SkeletonView` のアニメーション範囲計算
- 拡張可能な `Card` モデルによる柔軟なデータバインディング
- `Preview` での動作確認に対応した設計
- スタイルと機能を両立したエンタープライズレベルの構造設計
</details>

## [GlitchEffect](https://github.com/munsangu/SwiftUI/tree/master/GlitchEffect/GlitchEffect)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center"><img src="https://github.com/user-attachments/assets/641212e7-21aa-408b-80f7-e0d31c2b48e9"></p>
<p align="center">
SwiftUI, MVVM, カスタムテキストアニメーション, UI/UXデザイン, グリッチエフェクト
</p>

### 主な機能:
- 複数行に対応したグリッチテキストアニメーション
- トリガーボタンによる段階的なエフェクト起動
- MVVMアーキテクチャに基づいた構成
- カスタムKeyframeアニメーションによる細かな視覚制御
- シンプルかつ再利用可能なテキストエフェクト構成

### 実装の詳細:
- `KeyframeAnimator` を活用したグリッチの時間制御
- `GlitchFrame` によるテキストのオフセット・シャドウ・透明度アニメーション
- ViewModelでの非同期シーケンスによるアニメーション制御
- `@resultBuilder` を使ったアニメーション定義の簡素化
- View層とアニメーションロジックの分離

### 活用技術:
- SwiftUIフレームワーク
- ObservableObject, @StateObject, @Publishedによる状態管理
- カスタムView（GlitchText, GlitchTextView）
- @resultBuilderによるフレーム定義
- 非同期処理（Task / sleep）
- ZStackとVStackによるレイアウト構成
</details>

## [ShineEffect](https://github.com/munsangu/SwiftUI/tree/master/ShineEffect/ShineEffect)
<details>
<summary>プロジェクトの詳細を見る (詳細を表示するにはクリック)</summary>
<p align="center">
    <img src="https://github.com/user-attachments/assets/583e6037-894a-4314-8fa9-5cfd52df2147">
    <img src="https://github.com/user-attachments/assets/258ef8ae-8be0-4285-950f-d1747ad2bd6b">
</p>
<p align="center">SwiftUI, MVVM, カスタムアニメーション, シャインエフェクト, UI/UXデザイン</p>

### 主な機能:
- タップやボタン操作で起動する洗練されたシャインエフェクト
- モダンで視覚的に魅力的なUI/UXデザイン
- MVVMアーキテクチャに基づいた実装
- カスタマイズ可能なアニメーション設定（持続時間、方向）
- 様々な形状に適用可能なクリップシェイプ
- インタラクティブな操作性

### 実装の詳細:
- MVVMパターンによるクリーンなコード構造
- ジオメトリリーダーを活用した正確なエフェクト計算
- カスタムビュー修飾子による再利用可能なUI実装
- KeyframeAnimatorを使用した高度なアニメーション制御
- 線形グラデーションによる自然な輝き表現
- カスタマイズ可能なエフェクトパラメータ
- メンテナンス性と拡張性を考慮した設計

### 活用技術:
- SwiftUIフレームワーク
- ObservableObjectとStateObjectによる状態管理
- カスタムビュー修飾子
- ジオメトリリーダーによる位置計算
- KeyframeAnimatorによるアニメーション制御
- 線形グラデーションの効果的な活用
- 依存性注入を用いたテスト可能な設計
- スケーリングと回転を組み合わせた視覚効果
- 再利用可能なコンポーネント設計
- 安全エリアの適切な処理
- 直感的なユーザーインターフェース
</details>

