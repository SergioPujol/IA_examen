(deffacts datos 
	(magico 21)
	(numeros 5 3 8 14 7)
)

(defrule comprobar
	(declare (salience 50))
	(numeros $?numeros ?ultimo)
	(magico ?n)
	(test (= ?ultimo ?n)
	
	=>

	(printout t "Numero magico calculado"  crlf )
	(halt)
)

(defrule suma
	(numeros $?primeros $numero1 $?centro $numero2 $?ultimos)
=>
(assert (numeros $?primeros $?centro $?ultimos (+ $numero1 $numero2))))

(defrule resta
	(numeros $?primeros $numero1 $?centro $numero2 $?ultimos)
=>
(assert (numeros $?primeros $?centro $?ultimos (- $numero1 $numero2))))

(defrule multiplicacion
	(numeros $?primeros $numero1 $?centro $numero2 $?ultimos)
=>
(assert (numeros $?primeros $?centro $?ultimos (* $numero1 $numero2))))

(defrule division
	(numeros $?primeros $numero1 $?centro $numero2 $?ultimos)
=>
(assert (numeros $?primeros $?centro $?ultimos (/ $numero1 $numero2))))
