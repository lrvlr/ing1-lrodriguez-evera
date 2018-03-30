!classDefinition: #I category: #'Numeros De Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros De Peano'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'LREV 3/29/2018 16:49:34'!
next

	^ II.! !

!I class methodsFor: 'as yet unclassified' stamp: 'LREV 3/29/2018 21:35:32'!
previous

	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados! !

!I class methodsFor: 'as yet unclassified' stamp: 'LREV 3/29/2018 19:45:37'!
seguirResta: unBloque
	unBloque value.! !


!I class methodsFor: 'errors' stamp: 'LREV 3/29/2018 15:10:14'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'.! !

!I class methodsFor: 'errors' stamp: 'LREV 3/29/2018 15:03:53'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Los numeros de Peano no soportan numeros negativos'.! !


!I class methodsFor: 'operators' stamp: 'LREV 3/29/2018 16:42:37'!
* unNumeroDePeano

	^ unNumeroDePeano.! !

!I class methodsFor: 'operators' stamp: 'LREV 3/29/2018 16:42:32'!
+  unNumeroDePeano
 	^ unNumeroDePeano next.! !

!I class methodsFor: 'operators' stamp: 'LREV 3/29/2018 21:35:15'!
- unNumeroDePeano

	^ self error: self descripcionDeErrorDeNumerosNegativosNoSoportados.! !

!I class methodsFor: 'operators' stamp: 'LREV 3/29/2018 16:39:24'!
/ unNumeroDePeano
	
	^ unNumeroDePeano = self ifTrue: [I] ifFalse:  [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]! !

!I class methodsFor: 'operators' stamp: 'LREV 3/29/2018 16:21:31'!
<= unNumeroDePeano
	^true. ! !


!classDefinition: #II category: #'Numeros De Peano'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numeros De Peano'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'LREV 3/22/2018 23:00:18'!
next

	next ifNil:
	[
		next := self cloneNamed: (self name, 'I').
		next previous: self.
		]. "la coma concatena"
	^ next! !

!II class methodsFor: 'as yet unclassified' stamp: 'LREV 3/24/2018 15:38:45'!
previous
	^ previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'LREV 3/22/2018 21:22:02'!
previous: aNumber
	previous := aNumber ! !

!II class methodsFor: 'as yet unclassified' stamp: 'LREV 3/29/2018 15:50:17'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

!II class methodsFor: 'as yet unclassified' stamp: 'LREV 3/29/2018 19:44:55'!
seguirResta: unBloque
	unBloque value.
	self previous seguirResta: unBloque.! !


!II class methodsFor: 'operators' stamp: 'LREV 3/29/2018 21:36:13'!
* unNumeroDePeano

	^ unNumeroDePeano + (self previous * unNumeroDePeano).! !

!II class methodsFor: 'operators' stamp: 'LREV 3/29/2018 16:42:54'!
+ unNumeroDePeano
	^ self previous + unNumeroDePeano next.! !

!II class methodsFor: 'operators' stamp: 'LREV 3/29/2018 19:44:31'!
- unNumeroDePeano

	|resultadoParcialResta|
	
	resultadoParcialResta := self.
	unNumeroDePeano seguirResta: [resultadoParcialResta := resultadoParcialResta previous].
	
	^resultadoParcialResta.! !

!II class methodsFor: 'operators' stamp: 'LREV 3/29/2018 17:46:53'!
/ unNumeroDePeano

	^ unNumeroDePeano <= self ifTrue: [
				unNumeroDePeano = self 
					ifTrue: [I] 
					ifFalse:  [I + ( (self - unNumeroDePeano) / unNumeroDePeano) ] ] 
				ifFalse: [ 
					self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
					]
				! !

!II class methodsFor: 'operators' stamp: 'LREV 3/29/2018 17:11:05'!
<= unNumeroDePeano
	|rta|
	rta := unNumeroDePeano = self.
	
	 
	^ rta ifTrue: true ifFalse: [ unNumeroDePeano = I ifTrue: false ifFalse: [self previous <= unNumeroDePeano previous] ]! !


!II class methodsFor: 'errors' stamp: 'LREV 3/29/2018 15:08:10'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir por un numero mayor'.! !

II instVarNamed: 'next' put: nil!
II instVarNamed: 'previous' put: I!