(set-option :produce-models true)

; Datatypes (items, stores)
(declare-datatypes () ((Item screwdriver saw hammer chips sweets cookie water juice coke)))
(declare-datatypes () ((Store store1 store2 store3 store4)))

; Predicates indicating whether an item is a tool, snack or beverage
(declare-fun Tool (Item) Bool)
(declare-fun Snack (Item) Bool)
(declare-fun Beverage (Item) Bool)

; Predicate indicating whether a store sells an item
(declare-fun Sells (Item Store) Bool)

; Define which items are tools, snacks, beverages
(assert (forall ((x Item)) (= (Tool x) (or (= x screwdriver) (= x saw) (= x hammer)))))
(assert (forall ((x Item)) (= (Snack x) (or (= x chips) (= x sweets) (= x cookie)))))
(assert (forall ((x Item)) (= (Beverage x) (or (= x water) (= x juice) (= x coke)))))


;; constraint 1
(assert (forall ((x Item)) (or (Tool x) (Snack x) (Beverage x))))

;; constraint 2
(assert (and (Sells saw store1) (Sells saw store4) (Sells sweets store3)))

;; constraint 3
(assert (forall ((x Item)) (exists ((y Store)) (Sells x y))))

;; constraint 4
(assert 
	(exists 
		((x Store)) 
		(and 
			(Sells sweets x)
			(Sells cookie x)
			(Sells chips x)
			(forall ((z Store)) 
			(implies 
				(and (Sells sweets z) (Sells cookie z) (Sells chips z)) 
				(= z x)
				)
			)
		)
	)
)



;; constraint 5
(assert (not (exists ((x Store)) (and (Sells water x) (Sells saw x)))))

;; constraint 6
(assert (forall ((x Store)) (implies (Sells juice x) (exists ((y Item)) (and (Beverage y) (not (= y juice)) (Sells y x))))))

;; constraint 7
(assert (exists ((x Item) (y Item) (z Item)) (and (not (= x y z)) (Beverage x) (Tool y) (Snack z) (Sells x store1) (Sells y store1) (Sells z store1))))


;; constraint 8
(assert (not (exists ((x Item)) (and (Beverage x) (Sells x store2)))))

;; constraint 9
(assert 
	(forall 
		((x Store)) 
		(exists 
			((y Item) (z Item) (w Item)) 
			(and
				(not (= y z w)) 
				(forall 
					((p Item)) 
					(implies 
						(Sells p x) 
						(or (= p y) (= p z) (= p w))
						)
					)
				)
			)))

;; constraint 10
(assert 
	(exists 
		((x Item) (y Item) (z Item) (a Store) (b Store))
		(and 
			(Snack x) (Snack y) (Tool z)
			(distinct x y)
			(distinct a b)
			(forall 
				((c Item))
				(implies (and (Sells c a) (Sells c b)) (or (= c x) (= c y) (= c z)))))))


(check-sat) ; need to be satisfiable here


;; statements (a-c) to prove

(assert (not (Sells coke store1)))
(assert (not (exists ((x Item)) (and (Snack x) (Sells x store2) (Sells x store3)))))
(assert (not (exists ((x Store)) (and (Sells juice x) (and (Sells water x))))))

(check-sat) ; need to be unsatisfiable here