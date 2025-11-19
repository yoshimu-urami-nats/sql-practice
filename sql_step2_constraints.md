
# Step 2：制約（Constraint）を理解しよう

## ✅ 学ぶ制約一覧

- `PRIMARY KEY`
- `UNIQUE`
- `NOT NULL`
- `DEFAULT`
- `CHECK`
- `FOREIGN KEY`

## ✅ CHECK や FOREIGN KEY のサンプルも書いてみる

```sql
CREATE TABLE orders (
  order_id INT PRIMARY KEY,                                -- 主キー：一意な注文ID
  account_id INT,                                          -- 外部キー先と一致するID
  order_date DATE NOT NULL,                                -- 注文日：空欄NG
  FOREIGN KEY (account_id) REFERENCES accounts(account_id) -- 外部キー制約
);
```

## 🔍 解説：このSQLで使われている制約とは？

| カラム名     | データ型 | 制約                       | 説明                                                |
|--------------|----------|----------------------------|-----------------------------------------------------|
| order_id     | INT      | PRIMARY KEY                | 主キー。一意でNULL不可。自動的に NOT NULL を含む。 |
| account_id   | INT      | FOREIGN KEY (account_id)   | 他テーブル（accounts）の account_id を参照。       |
| order_date   | DATE     | NOT NULL                   | NULLを許容しない。                                  |

## 📝 制約（Constraint）とは？

テーブル設計時に **データの整合性を守るためのルール**  
以下のような種類がある：

| 制約名        | 役割                                                                 |
|---------------|----------------------------------------------------------------------|
| PRIMARY KEY   | 主キー。レコードを一意に識別するカラム。1テーブルに1つだけ。        |
| UNIQUE        | 重複を許さない。複数カラムにも設定可。                              |
| NOT NULL      | NULL を許さない。                                                    |
| DEFAULT       | デフォルト値を設定。指定しなかったときに使われる。                  |
| CHECK         | 条件式を満たす値だけを許可（例：年齢が0以上など）。                 |
| FOREIGN KEY   | 他テーブルの値と一致する必要がある。リレーションの定義に使う。       |


