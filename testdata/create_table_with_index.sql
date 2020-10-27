CREATE TABLE IF NOT EXISTS foo (
    id       UUID PRIMARY KEY,
    bar_id   UUID
);

CREATE INDEX idx_foo_bar_id ON foo(bar_id);
