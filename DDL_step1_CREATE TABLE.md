# Step 1：CREATE TABLE の文法メモ

## 用語メモ
- **テーブル**：同じ種類のデータをまとめた表
- **カラム**：テーブルの項目（列）
- **行**：1レコード（1件分のデータ）
- **主キー（PRIMARY KEY）**：テーブル内で一意になるID（重複不可・NULL不可）

---
## DDL：accounts テーブルの作成例
```sql
CREATE TABLE accounts (
    account_id   INT PRIMARY KEY,                 -- アカウントID（主キー）
    full_name    VARCHAR(50)  NOT NULL,           -- 氏名（空欄NG）
    email        VARCHAR(255) UNIQUE,             -- メールアドレス（一意）
    department   VARCHAR(100),                    -- 部署名
    created_at   DATE         NOT NULL,           -- 作成日（空欄NG）
    is_active    BOOLEAN      NOT NULL DEFAULT TRUE -- 有効フラグ（初期値TRUE）
);
```
### 制約の理由メモ
- **NOT NULL**：必須項目（空欄を許さない）
- **UNIQUE**：重複禁止（同じメールアドレス登録防止など）

---
## DDL例：他のテーブル
### products テーブル
```sql
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0
);
```

### orders テーブル
```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_name VARCHAR(100) NOT NULL,
    date DATE NOT NULL
);
```

---
## データ型の違いと選び方
| データ型            | 説明                     | 使用例                          | よく使う場面         |
|--------------------|--------------------------|--------------------------------|----------------------|
| `INT`              | 整数型（小数なし）        | `1`, `150`, `-20`              | ID、在庫数、回数       |
| `DECIMAL(a, b)`    | 小数点付き数値（精度あり）| `DECIMAL(10, 2)`               | 金額、比率、精密計算     |
| `VARCHAR(n)`       | 文字列（最大n文字）       | `VARCHAR(100)`                 | 名前、部署、メール等    |
| `DATE`             | 日付型                    | `'2025-11-19'`                 | 登録日、誕生日          |
| `BOOLEAN`          | 真偽値（1/0）             | `TRUE`, `FALSE`                | フラグ（有効/無効）     |

### 型の選び方ポイント
- **INT**：ID、件数など「数える系」
- **DECIMAL**：金額や誤差NGの数値（FLOATより精度が高い）
- **VARCHAR**：文字列全般
- **DATE**：日付情報に便利
- **BOOLEAN**：ON/OFF判断に最適

---

