!classDefinition: #NumeroTest category: #'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !


!NumeroTest methodsFor: 'setup' stamp: 'HernanWilkinson 5/7/2016 20:56'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	four := Entero with: 4.
	five := Entero with: 5.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: #'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'LREV 4/19/2018 20:34:44'!
dividirUnEnteroPorMi: unEntero

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'LREV 4/19/2018 20:34:56'!
dividirUnaFraccionPorMi: unaFraccion

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'LREV 4/19/2018 20:34:34'!
multiplicarUnEntero: unEntero

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'LREV 4/19/2018 20:35:12'!
multiplicarUnaFraccion: unaFraccion

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'LREV 4/19/2018 20:34:26'!
restarUnEntero: unEntero

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'LREV 4/19/2018 20:35:21'!
restarUnaFraccion: unaFraccion

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'LREV 4/19/2018 20:30:27'!
sumarUnEntero: unEntero

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'LREV 4/19/2018 20:30:14'!
sumarUnaFraccion: unaFraccion

	self subclassResponsibility ! !


!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:47'!
invalidNumberTypeErrorDescription
	^ 'Tipo de numero invalido'! !


!classDefinition: #Entero category: #'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'testing' stamp: 'LREV 4/20/2018 21:52:43'!
isOne

	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'LREV 4/21/2018 14:58:42'!
isOneDo: valueThisClosure

	self subclassResponsibility! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !

!Entero methodsFor: 'testing' stamp: 'LREV 4/21/2018 14:58:32'!
isZeroDo: valueThisClosure

	self subclassResponsibility! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'arithmetic operations' stamp: 'LREV 4/19/2018 10:18:53'!
* aMultiplier 
	
	^ aMultiplier multiplicarUnEntero: self
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'LREV 4/17/2018 15:16:25'!
+ anAdder 

	^anAdder sumarUnEntero: self
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'LREV 4/20/2018 22:17:26'!
/ aDivisor

	^ aDivisor dividirUnEnteroPorMi: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'LREV 4/20/2018 22:17:42'!
dividirUnEnteroPorMi: unEntero

	^ Fraccion with: unEntero over: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'LREV 4/20/2018 22:17:48'!
dividirUnaFraccionPorMi: unaFraccion

	^ unaFraccion numerator / (self * unaFraccion denominator).! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'LREV 4/19/2018 10:15:47'!
multiplicarUnEntero: unEntero
	
	^self class with: value * unEntero integerValue
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'LREV 4/19/2018 20:36:40'!
multiplicarUnaFraccion: unaFraccion
	
	^unaFraccion multiplicarUnEntero: self

	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'LREV 4/20/2018 12:27:54'!
sumarUnEntero: unEntero
	
	^ Entero with: value + unEntero integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'LREV 4/19/2018 20:39:04'!
sumarUnaFraccion: unaFraccion

	^ unaFraccion sumarUnEntero: self
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'LREV 4/20/2018 12:31:25'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	aValue = 0 ifTrue: [^EnteroCero new initialize] .
	aValue = 1 ifTrue: [^EnteroUno new initialize].
	^ EnteroMayorAUno new initalizeWith: aValue.
	
	! !


!classDefinition: #EnteroCero category: #'Numero-Exercise'!
Entero subclass: #EnteroCero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroCero methodsFor: 'initialization' stamp: 'LREV 4/20/2018 12:16:29'!
initialize

	value := 0.! !


!EnteroCero methodsFor: 'testing' stamp: 'LREV 4/20/2018 22:11:54'!
isOneDo: valueThisClosure
	! !

!EnteroCero methodsFor: 'testing' stamp: 'LREV 4/20/2018 22:19:20'!
isZeroDo: valueThisClosure

	^ valueThisClosure value.! !


!classDefinition: #EnteroMayorAUno category: #'Numero-Exercise'!
Entero subclass: #EnteroMayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroMayorAUno methodsFor: 'initialization' stamp: 'LREV 4/20/2018 22:19:29'!
initializeWith: aValue

	value := aValue.! !


!EnteroMayorAUno methodsFor: 'testing' stamp: 'LREV 4/20/2018 22:12:15'!
isOneDo: valueThisClosure! !

!EnteroMayorAUno methodsFor: 'testing' stamp: 'LREV 4/20/2018 22:12:20'!
isZeroDo: valueThisClosure! !


!classDefinition: #EnteroUno category: #'Numero-Exercise'!
Entero subclass: #EnteroUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroUno methodsFor: 'initialization' stamp: 'LREV 4/20/2018 22:19:48'!
initialize

	value := 1.! !


!EnteroUno methodsFor: 'testing' stamp: 'LREV 4/20/2018 22:19:38'!
isOneDo: valueThisClosure

	^ valueThisClosure value! !

!EnteroUno methodsFor: 'testing' stamp: 'LREV 4/20/2018 22:12:41'!
isZeroDo: valueThisClosure! !


!classDefinition: #Fraccion category: #'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'LREV 4/20/2018 22:15:49'!
* aMultiplier 
	
	^aMultiplier multiplicarUnaFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'LREV 4/20/2018 22:15:52'!
+ anAdder
	
	^ anAdder sumarUnaFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'LREV 4/20/2018 22:15:56'!
/ aDivisor

	^ aDivisor dividirUnaFraccionPorMi: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'LREV 4/20/2018 22:15:33'!
dividirUnEnteroPorMi: unEntero

	^ (unEntero * denominator) / numerator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'LREV 4/20/2018 22:15:40'!
dividirUnaFraccionPorMi: unaFraccion

	^ (denominator * unaFraccion numerator) / (numerator * unaFraccion denominator).! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'LREV 4/20/2018 22:16:20'!
multiplicarUnEntero: unEntero
	
	^(numerator * unEntero) / denominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'LREV 4/20/2018 22:16:25'!
multiplicarUnaFraccion: unaFraccion
	
	^(numerator * unaFraccion numerator) / (denominator * unaFraccion denominator).! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'LREV 4/20/2018 22:16:31'!
sumarUnEntero: unEntero
	
	| newNumerator newDenominator |
	
	newNumerator := (unEntero value * self denominator value) + self numerator value.
	newDenominator := self denominator value. 
	 

	^ newNumerator / newDenominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'LREV 4/20/2018 22:17:10'!
sumarUnaFraccion: unaFraccion
	
	| newNumerator newDenominator |
	
	newNumerator := (numerator * unaFraccion denominator) + (denominator * unaFraccion numerator).
	newDenominator := denominator * unaFraccion denominator.
	
	^newNumerator / newDenominator.! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'LREV 4/20/2018 22:11:28'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZeroDo: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZeroDo: [ ^aDividend ].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOneDo: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
