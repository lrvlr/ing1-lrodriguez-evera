!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #IdiomTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #IdiomTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!IdiomTest methodsFor: 'testing' stamp: 'LREV 4/14/2018 13:15:18'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook  new.
	
	self assert: (Time millisecondsToRun: [customerBook addCustomerNamed: 'John Lennon'.]) < 50 
	
! !

!IdiomTest methodsFor: 'testing' stamp: 'LREV 4/14/2018 13:17:30'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	
	customerBook := CustomerBook conClientes: #('Paul McCartney').
 
	self assert: (Time millisecondsToRun: [customerBook removeCustomerNamed: 'Paul McCartney'.] ) < 100 
	
! !

!IdiomTest methodsFor: 'testing' stamp: 'LREV 4/14/2018 13:22:10'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	customerBook 
					daErrorAlEvaluar: [customerBook addCustomerNamed: ''.] 
					conTipoDeError: Error 
					verificaQue: [:anError |	self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
												self assert: customerBook isEmpty ]! !

!IdiomTest methodsFor: 'testing' stamp: 'LREV 4/14/2018 13:23:24'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook |
			
	customerBook := CustomerBook conClientes: #('John Lennon').
	
	customerBook 
					daErrorAlEvaluar: [customerBook removeCustomerNamed: 'Paul McCartney'.] 
					conTipoDeError: NotFound 
					verificaQue: [	self assert: customerBook numberOfCustomers = 1.
									self assert: (customerBook includesCustomerNamed: 'John Lennon') ]
! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'customers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'LREV 4/15/2018 18:07:05'!
daErrorAlEvaluar: expresionQueDaError conTipoDeError: tipoError verificaQue: cosaAChequear

	[ expresionQueDaError value.
	self fail ]
		on: tipoError
		do: cosaAChequear! !

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:56'!
includesCustomerNamed: aName

	^customers includes: aName ! !

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:48'!
isEmpty
	
	^customers isEmpty  ! !


!CustomerBook methodsFor: 'initialization' stamp: 'LREV 4/14/2018 12:10:57'!
inicializarConClientes: unaListaDeClientes

	unaListaDeClientes do: [:unCliente | self addCustomerNamed: (unCliente value)]! !

!CustomerBook methodsFor: 'initialization' stamp: 'HernanWilkinson 7/6/2011 17:42'!
initialize

	super initialize.
	customers := OrderedCollection new! !


!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:42'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(customers includes: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:56'!
numberOfCustomers
	
	^customers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'HAW 4/14/2017 16:55:43'!
removeCustomerNamed: aName
 
	customers remove: aName ifAbsent: [ NotFound signal ]! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !


!CustomerBook class methodsFor: 'instance creation' stamp: 'LREV 4/14/2018 11:41:40'!
conClientes: unaListaDeClientes
	
	^self new inicializarConClientes: unaListaDeClientes
	
	! !
