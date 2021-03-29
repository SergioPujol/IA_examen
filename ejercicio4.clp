(deffacts datos 
	(magico 21)
	(numeros 5 3 8 14 7 camino)
)

(defrule comprobar
	(declare (salience 50))
	(numeros $?numeros ?ultimo camino $?c)
	(magico ?n)
	(test (= ?ultimo ?n))	
	(test (= (length$ $?numeros) 0))
	
	=>

	(printout t "Numero magico calculado"  crlf )
	(printout t "Operaciones realizadas: " $?c  crlf )
	(halt)
)

(defrule suma
	(numeros $?primeros ?numero1 $?centro ?numero2 $?ultimos camino $?c)
=>
	(assert (numeros $?primeros $?centro $?ultimos (+ ?numero1 ?numero2) camino Suma ?numero1 ?numero2 $?c))
)

(defrule resta
	(numeros $?primeros ?numero1 $?centro ?numero2 $?ultimos camino $?c)
	(test (> (- ?numero1 ?numero2) 0))
=>
	(assert (numeros $?primeros $?centro $?ultimos (- ?numero1 ?numero2) camino Resta ?numero1 ?numero2 $?c))
)

(defrule multiplicacion
	(numeros $?primeros ?numero1 $?centro ?numero2 $?ultimos camino $?c)
=>
	(assert (numeros $?primeros $?centro $?ultimos (* ?numero1 ?numero2) camino Multiplicacion ?numero1 ?numero2 $?c))
)

(defrule division
	(numeros $?primeros ?numero1 $?centro ?numero2 $?ultimos camino $?c)
	(test (= (mod ?numero1 ?numero2) 0))
=>
	(assert (numeros $?primeros $?centro $?ultimos (div ?numero1 ?numero2) camino Division ?numero1 ?numero2 $?c))
)



