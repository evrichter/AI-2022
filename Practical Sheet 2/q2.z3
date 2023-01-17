
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Discussion:

;We first dealt with the issue of formulating the problem in propositional logic form by introducing "Person X ordering beer" and "Person X ordering wine", treating them as different variables. Then, we used these variables as needed as part of the propositions illustrating different constraints. The results should be interpretated in the following way: [XB] having the value [true] refers to person X ordering beer. 
;The end result matches the result we came to by solving the task manually. What is noteworthy is that Ivan's' preference is only explicitly mentioned in constraint 7, which consists of a regular OR expression, meaning that his preference cannot be determined for certain (given the other constraints).

;NOTE re: constraints 3 and 8 - the code we wrote illustrates the IFF function; however, we are not sure if it counts as a truth table - we hope it does not
;Alternatively, we could use the basic IF function, which would look like: 
;	(assert (implies FB BB))
;and the results would be the same for this particular case, however we were not completely satisfied with this 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(declare-const GW Bool)
(declare-const GB Bool)

(declare-const NW Bool)
(declare-const NB Bool)

(declare-const BW Bool)
(declare-const BB Bool)

(declare-const LW Bool)
(declare-const LB Bool)

(declare-const FW Bool)
(declare-const FB Bool)

(declare-const SW Bool)
(declare-const SB Bool)

(declare-const IW Bool)
(declare-const IB Bool)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;1 - XOR constraints (only order one thing)
(assert
	(and
		(or (and (not GW) GB) (and (not GB) GW))
		(or (and (not NB) NW) (and (not NW) NB))
		(or (and (not BB) BW) (and (not BW) BB))
		(or (and (not LB) LW) (and (not LW) LB))
		(or (and (not FB) FW) (and (not FW) FB))
		(or (and (not SB) SW) (and (not SW) SB))
		(or (and (not IB) IW) (and (not IW) IB))
		)
	)
;2
(assert (= SW true))

;3
(assert
	(or
		(and BB FB)
		(and (not BB) (not FB))
	)
)

;4
(assert
	(implies
		(and BB LB)
		NB
	)
)

;5
(assert (and (= GB LB) (= GW LW)))

;6 
(assert (implies FW GW))

;7 
(assert (or IB GB LB))

;8 
(assert
	(or
		(and SW LB)
		(and (not SW) (not LB)))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-sat)
(echo " ")
(get-value (GW))
(get-value (GB))
(echo " ")
(get-value (NW))
(get-value (NB))
(echo " ")
(get-value (BW))
(get-value (BB))
(echo " ")
(get-value (LW))
(get-value (LB))
(echo " ")
(get-value (FW))
(get-value (FB))
(echo " ")
(get-value (SW))
(get-value (SB))
(echo " ")
(get-value (IW))
(get-value (IB))