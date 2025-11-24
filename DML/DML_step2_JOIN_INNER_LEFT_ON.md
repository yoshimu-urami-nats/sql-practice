# Step2：JOIN（INNER / LEFT）＋ ON 句（テーブル結合）

## 用語メモ
- **SELECT**：取り出したい列を指定する
- **JOIN**：複数のテーブルを結合して1つの結果にまとめる
- **INNER JOIN**：両方のテーブルに共通するデータだけ取得
- **LEFT JOIN**：左側のテーブルをすべて残し、右側が無い部分は NULL
- **ON**：どの列で結合するか（結合条件）

---

## INNER JOIN：共通部分だけ取得

```sql
SELECT p.product_id, p.name, c.category_name
FROM products AS p
INNER JOIN categories AS c
    ON p.category_id = c.category_id;
```

---

## LEFT JOIN：左側を全部残す

```sql
SELECT p.product_id, p.name, c.category_name
FROM products AS p
LEFT JOIN categories AS c
    ON p.category_id = c.category_id;
```

---

## ポイント
- JOIN を使うと 複数テーブルの情報をまとめて取得できる
- INNER JOIN は「一致したデータのみ」
- LEFT JOIN は「左側を全部＋一致しなければ右側は NULL」
- ON は「どの列が対応しているか」を指示する（＝主キーと外部キー）

---

## よく使う書き方（エイリアス推奨）

```sql
FROM products AS p
JOIN categories AS c
    ON p.category_id = c.category_id
```
※ AS は省略可能（products p でもOK）

---

## まとめ：JOIN の基本形

```sql
SELECT 列名
FROM テーブルA
JOIN テーブルB
    ON A.key = B.key;
```

---

## 演習課題（A5M2 / SQL Fiddle どちらでもOK）
## ① 商品とカテゴリ名を結合（INNER JOIN）

```sql
SELECT p.name, c.category_name
FROM products AS p
INNER JOIN categories AS c
    ON p.category_id = c.category_id;
```

---

## ② 商品がカテゴリに無い場合も含めて取得（LEFT JOIN）

```sql
SELECT p.name, p.price, c.category_name
FROM products AS p
LEFT JOIN categories AS c
    ON p.category_id = c.category_id;
```

---

## ③ 価格が 2000 以上 + カテゴリ名も一緒に取得

```sql
SELECT p.name, p.price, c.category_name
FROM products AS p
LEFT JOIN categories AS c
    ON p.category_id = c.category_id
WHERE p.price >= 2000;
```

---

## 補足：テスト用データ（products + categories）
まず categories テーブル👇

```sql
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

INSERT INTO categories VALUES
(1, 'PC周辺機器'),
(2, 'モニター'),
(3, 'アクセサリ');
```

products に category_id を追加👇
```sql
ALTER TABLE products
ADD category_id INT;

UPDATE products SET category_id = 1 WHERE product_id IN (1, 2, 4);
UPDATE products SET category_id = 2 WHERE product_id = 3;
```