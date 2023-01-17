(declare-const P Bool)
(declare-const R Bool)
(declare-const Q Bool)


(assert
	(or
		(= 
			(or P Q)
			R
		)
		(or
			(not R) 
			(not P)
		)
	)
)


(check-sat)
;(get-value (P))
;(get-value (Q))
;(get-value (R))