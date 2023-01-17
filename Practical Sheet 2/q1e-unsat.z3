(declare-const P Bool)
(declare-const R Bool)
(declare-const Q Bool)



(assert
	(and
		(and
			(and P Q)
			(implies Q (not R))
			)
		(and
			(implies P R)
			(implies (not Q) R)
			)
		)
	)



(check-sat)
(get-value (P))
(get-value (Q))
(get-value (R))