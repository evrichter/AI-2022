(declare-const P Bool)
(declare-const R Bool)
(declare-const Q Bool)



(assert
	(and

		(implies P R)
		(implies Q R)
		(not 
			(and 
				(not Q) 
				(or (not R) P)
				)
			)
		)
	)


(check-sat)
;(get-value (P))
;(get-value (Q))
;(get-value (R))