## SQL の実行順（DBが動く順）
1. FROM（どのテーブルを使うか）
1. JOIN（テーブルを結合）
1. ON（結合条件の処理）
1. WHERE（行の絞り込み＝集計前）
1. GROUP BY（グループ化）
1. HAVING（グループの絞り込み＝集計後）
1. SELECT（最終的に出す列を決定）
1. ORDER BY（結果の並び替え）
1. LIMIT（件数制限）

---

## 書く順（人間向け）との違い

1. SELECT
1. FROM
1. JOIN
1. WHERE
1. GROUP BY
1. HAVING
1. ORDER BY
1. LIMIT

---

➡ 実行順と全く違う  
➡ だから混乱する  
➡ だからメモが必要

---