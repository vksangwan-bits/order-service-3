-- Create Order table
CREATE TABLE "Order" (
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    is_open BOOLEAN DEFAULT TRUE,
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create OrderItem table
CREATE TABLE orderitem (
    id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES "Order"(id),
    product_id INTEGER,
    quantity INTEGER DEFAULT 1,
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger function to update date_updated in Order table
CREATE OR REPLACE FUNCTION update_order_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.date_updated = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger function to update date_updated in OrderItem table
CREATE OR REPLACE FUNCTION update_orderitem_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.date_updated = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to update date_updated in Order table before update
CREATE TRIGGER order_update_trigger
BEFORE UPDATE ON "Order"
FOR EACH ROW
EXECUTE FUNCTION update_order_timestamp();

-- Trigger to update date_updated in OrderItem table before update
CREATE TRIGGER orderitem_update_trigger
BEFORE UPDATE ON orderitem
FOR EACH ROW
EXECUTE FUNCTION update_orderitem_timestamp();
