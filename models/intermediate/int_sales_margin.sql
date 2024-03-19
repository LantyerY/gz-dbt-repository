select
    products_id,
    date_date,
    orders_id,
    revenue,
    quantity,
    cast(purchase_price as float64) AS purchase_price,
    round(s.quantity * cast(p.purchase_price as float64), 2) as purchase_cost,
    round(s.revenue - (s.quantity * cast(p.purchase_price as float64)),2) as margin
from {{ ref("stg_gz_raw_data__raw_gz_sales") }} s
left join {{ ref("stg_gz_raw_data__raw_gz_product") }}
p using (products_id)