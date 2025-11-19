
# Step 3：ALTER TABLE での変更練習

## ✅ 目的

- カラムの **追加・削除・変更** を練習しよう
- 制約の **追加・削除** を理解しよう
- 実務で「後から仕様が変わる」場面に備えよう

---

## 📘 課題例（SQL）

```sql
-- カラムの追加
ALTER TABLE accounts ADD COLUMN phone_number VARCHAR(20);

-- カラムの削除
ALTER TABLE accounts DROP COLUMN department;

-- 制約の追加（NOT NULL 制約）
ALTER TABLE accounts ALTER COLUMN email SET NOT NULL;
```

---

## 💡 ポイント

| 操作         | SQL構文例 | 説明 |
|--------------|-----------|------|
| カラム追加   | `ADD COLUMN` | 新しいカラムを追加する |
| カラム削除   | `DROP COLUMN` | 不要になったカラムを削除 |
| 制約追加     | `ALTER COLUMN ... SET NOT NULL` | 既存カラムにNOT NULL制約を追加 |
| 制約削除     | `ALTER COLUMN ... DROP NOT NULL` | NOT NULL制約を外す（※未記載だけど参考） |

---

## 🧠 実務での使い所

- 「あとからカラム追加してって言われた！」
- 「このカラム、NULL許可しないように変更してって言われた！」
- → `ALTER TABLE` をマスターしておけば対応可能！

---

## ✅ 補足：制約の変更例

```sql
-- NOT NULL 制約の削除
ALTER TABLE accounts ALTER COLUMN email DROP NOT NULL;

-- デフォルト値の追加
ALTER TABLE accounts ALTER COLUMN status SET DEFAULT 'active';

-- デフォルト値の削除
ALTER TABLE accounts ALTER COLUMN status DROP DEFAULT;
```
