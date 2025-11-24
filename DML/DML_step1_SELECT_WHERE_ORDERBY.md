# Step1：SELECT / WHERE / ORDER BY（基本構文）

## 用語メモ
- **SELECT**：取り出したい列を指定する
- **FROM**：どのテーブルから取るか
- **WHERE**：条件を指定して絞り込む
- **ORDER BY**：並び順を指定（昇順 ASC / 降順 DESC）

---

## SELECT：列を取り出す
```sql
SELECT product_id, name, price
FROM products;
```

---

## ポイント

- SELECT * を使うと「全部の列」
- 本番環境では必要な列だけ明示することが多い

---

## WHERE：条件で絞り込み
```sql
SELECT *
FROM products
WHERE price >= 1000;
```

### よく使う条件
| 条件            | 例                                    |
| ------------- | ------------------------------------ |
| `=`           | `WHERE department = 'Sales'`         |
| `!=` / `<>`   | `WHERE stock <> 0`                   |
| `<` `<=` `>=` | 数値比較                                 |
| `BETWEEN`     | `WHERE price BETWEEN 500 AND 2000`   |
| `LIKE`        | `WHERE name LIKE '%Pro%'`            |
| `IN`          | `WHERE department IN ('Sales','HR')` |
| `IS NULL`     | `WHERE email IS NULL`                |

---

## ORDER BY：並び替え
```sql
SELECT name, price
FROM products
ORDER BY price DESC;
```

## ポイント

- 昇順：ASC（省略可）
- 降順：DESC
- 複数キーもOK

```sql
ORDER BY department ASC, price DESC;
```

## まとめ：SELECT + WHERE + ORDER BY の基本形

```sql
SELECT 列名
FROM テーブル名
WHERE 条件
ORDER BY 並び順;
```

---

## 演習課題（A5M2 / SQL Fiddle どちらでもOK）

### ① 全商品の一覧を取得（全列）
```sql
SELECT * FROM products;
```

### ② 価格が 2000 以上の商品だけ取得

```sql
SELECT name, price
FROM products
WHERE price >= 2000;
```

### ③ 価格が安い順に並べる

```sql
SELECT name, price
FROM products
ORDER BY price ASC;
```

### ④ 名前に「Pro」が含まれる商品を検索

```sql
SELECT *
FROM products
WHERE name LIKE '%Pro%';
```

### 補足：データが無い場合のサンプル INSERT

```sql
INSERT INTO products (product_id, name, price, stock) VALUES
(1, 'Keyboard Pro', 2980, 12),
(2, 'Mouse Lite', 980, 50),
(3, 'Monitor 24inch', 12800, 5),
(4, 'USB Cable', 300, 100);
```