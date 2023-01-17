(declare-const P Bool)
(declare-const R Bool)

(assert
	(implies
		R 
		(and
			(or R P)
			(not P))
		)
	)


(check-sat)
(get-value (R))
(get-value (P))