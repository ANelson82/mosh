CREATE OR REPLACE VIEW clients_balance as
SELECT
    c.client_id
    , c.name
    , SUM(invoice_total) - SUM(payment_total) as total_balance
from clients c
join invoices i using (client_id)
group by c.client_id, c.name;