select

supplierkey,

{{ suppliers_macros('supplierbalance') }} as sum_supplier

from

{{ref("supplier")}}

group by supplierkey