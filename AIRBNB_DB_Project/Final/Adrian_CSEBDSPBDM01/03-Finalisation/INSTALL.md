# Airbnb Replica Database — Installation Manual

**Course:** CSEBDSPBDM01 — Build a Data Mart in SQL  
**DBMS:** SQLite 3.45 (primary) · MySQL 8+ · PostgreSQL 14+ (compatible)

---

## Requirements

| Tool | Version | Notes |
|------|---------|-------|
| SQLite | 3.x | Recommended. Zero-configuration. |
| DB Browser for SQLite | 3.12+ | Optional GUI for visual inspection |
| MySQL | 8.0+ | Requires minor syntax changes (see below) |
| PostgreSQL | 14+ | Requires minor syntax changes (see below) |

---

## Quick Start — SQLite (Recommended)

### Option A: Command Line

```bash
# 1. Open a terminal in the folder containing airbnb_db.sql
# 2. Run the script
sqlite3 airbnb_replica.db < airbnb_db.sql

# 3. Verify
sqlite3 airbnb_replica.db "SELECT COUNT(*) FROM users;"
# Expected output: 20
```

### Option B: DB Browser for SQLite (GUI)

1. Open **DB Browser for SQLite**
2. Click **New Database** → name it `airbnb_replica.db`
3. Go to **Execute SQL** tab
4. Open `airbnb_db.sql` and paste its contents into the editor
5. Click **Execute All** (F5)
6. Switch to **Browse Data** tab to inspect tables

---

## MySQL Installation

Replace two constructs before running:

```sql
-- 1. Remove the PRAGMA line at the top
-- PRAGMA foreign_keys = ON;   <-- delete this line

-- 2. Replace AUTOINCREMENT with AUTO_INCREMENT
--    (find-and-replace in any text editor)

-- 3. Run the script
mysql -u root -p < airbnb_db.sql
```

Enable foreign keys in MySQL session:
```sql
SET FOREIGN_KEY_CHECKS = 1;
```

---

## PostgreSQL Installation

```sql
-- 1. Remove the PRAGMA line
-- 2. Replace: INTEGER PRIMARY KEY AUTOINCREMENT
--        with: SERIAL PRIMARY KEY
-- 3. Replace: DECIMAL(10,2) with NUMERIC(10,2)
-- 4. Run the script
psql -U postgres -d your_database -f airbnb_db.sql
```

---

## Verifying the Installation

Run these queries to confirm all tables loaded correctly:

```sql
-- Row count per table
SELECT 'users' AS tbl, COUNT(*) AS rows FROM users
UNION ALL SELECT 'listings',       COUNT(*) FROM listings
UNION ALL SELECT 'reservations',   COUNT(*) FROM reservations
UNION ALL SELECT 'reviews',        COUNT(*) FROM reviews
UNION ALL SELECT 'support_tickets',COUNT(*) FROM support_tickets;

-- Expected: 20 rows each
```

---

## File Reference

| File | Description |
|------|-------------|
| `airbnb_db.sql` | Full schema + dummy data + 7 test queries |
| `airbnb_replica.db` | Pre-built SQLite binary (128 KB) |
| `INSTALL.md` | This file |

---

## Notes

- All primary keys follow the `<table_name>_id` naming convention
- Foreign key enforcement must be enabled manually in SQLite: `PRAGMA foreign_keys = ON;` (included in the script)
- The script is idempotent: `CREATE TABLE IF NOT EXISTS` prevents errors on re-run
- 22 tables · 511 rows · 128 KB database volume
