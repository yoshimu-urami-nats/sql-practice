# Step3：GROUP BY ＋ 集計関数（COUNT / SUM / AVG / MAX / MIN）

## 用語メモ
- **GROUP BY**：行をグループ単位にまとめる  
- **COUNT()**：行数を数える  
- **SUM()**：合計値  
- **AVG()**：平均値  
- **MAX()**：最大値  
- **MIN()**：最小値  
- **HAVING**：集計した後に絞り込む（WHERE とは役割が違う）

---

## GROUP BY：グループごとに集計する
```sql
SELECT category_id, COUNT(*)
FROM products
GROUP BY category_id;
```

---

## 主な集計関数の例

### COUNT：件数
```sql
SELECT category_id, COUNT(*) AS item_count
FROM products
GROUP BY category_id;
```

### SUM：合計
```sql
SELECT category_id, SUM(price) AS total_price
FROM products
GROUP BY category_id;
```

### AVG：平均
```sql
SELECT category_id, AVG(price) AS avg_price
FROM products
GROUP BY category_id;
```

### MAX / MIN：最大・最小
```sql
SELECT category_id,
       MAX(price) AS max_price,
       MIN(price) AS min_price
FROM products
GROUP BY category_id;
```

---

## ポイント

- GROUP BY を使うと **同じ値の行をひとまとめ** にして集計できる  
- SELECT に書けるのは  
  - GROUP BY に含まれる列  
  - 集計関数  
  だけ  
- WHERE は「集計の前」に効く  
- HAVING は「集計の後」に効く  

---

## WHERE と HAVING の違い（重要）

### WHERE：集計前に絞り込み
```sql
SELECT category_id, COUNT(*)
FROM products
WHERE price >= 1000
GROUP BY category_id;
```

### HAVING：集計後に絞り込み
```sql
SELECT category_id, COUNT(*)
FROM products
GROUP BY category_id
HAVING COUNT(*) >= 2;
```

---

## まとめ：GROUP BY + 集計の基本形

```sql
SELECT グループ列, 集計関数
FROM テーブル名
WHERE 条件        -- 任意
GROUP BY グループ列
HAVING 集計後の条件; -- 任意
```

---

## 演習課題（A5M2 / SQL Fiddle どちらでもOK）

### ① カテゴリ別の商品数を取得（COUNT）
```sql
SELECT c.category_name, COUNT(*) AS item_count
FROM products AS p
LEFT JOIN categories AS c
    ON p.category_id = c.category_id
GROUP BY c.category_name;
```

### ② カテゴリ別の平均価格を取得（AVG）
```sql
SELECT c.category_name, AVG(p.price) AS avg_price
FROM products AS p
LEFT JOIN categories AS c
    ON p.category_id = c.category_id
GROUP BY c.category_name;
```

### ③ 平均価格が 3000 以上のカテゴリだけ取得（HAVING）
```sql
SELECT c.category_name, AVG(p.price) AS avg_price
FROM products AS p
LEFT JOIN categories AS c
    ON p.category_id = c.category_id
GROUP BY c.category_name
HAVING AVG(p.price) >= 3000;
```

### ④ カテゴリ別の最大 / 最小価格（MAX / MIN）
```sql
SELECT c.category_name,
       MAX(p.price) AS max_price,
       MIN(p.price) AS min_price
FROM products AS p
LEFT JOIN categories AS c
    ON p.category_id = c.category_id
GROUP BY c.category_name;
```

---

## 補足：集計前の確認に便利なクエリ
```sql
SELECT *
FROM products;
```

```sql
SELECT *
FROM categories;
```

---
