CREATE TABLE IF NOT EXISTS creative_snapshot_requests (
 id TEXT PRIMARY KEY, created_at TEXT NOT NULL, brand TEXT NOT NULL,
 website TEXT NOT NULL, contact_name TEXT NOT NULL, email TEXT NOT NULL,
 monthly_ad_spend TEXT NOT NULL DEFAULT '', main_challenge TEXT NOT NULL DEFAULT '',
 lead_source TEXT NOT NULL DEFAULT 'Creative Snapshot', status TEXT NOT NULL DEFAULT 'New',
 follow_up_date TEXT, notes TEXT NOT NULL DEFAULT '', privacy_version TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS snapshot_created_at ON creative_snapshot_requests(created_at);
CREATE TABLE IF NOT EXISTS snapshot_rate_limits (bucket TEXT PRIMARY KEY, attempts INTEGER NOT NULL, expires_at INTEGER NOT NULL);
