(declare-const P Bool)
(declare-const Q Bool)

(assert (or (implies P Q) (implies Q P) ) )

(check-sat)
;(get-value (P))
;(get-value (Q))