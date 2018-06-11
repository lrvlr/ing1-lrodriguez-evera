!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'LREV 6/7/2018 20:29:42'!
defaultCatalog
	
	^ Dictionary new add: (self itemSellByTheStore) -> 450; yourself! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'testing' stamp: 'LREV 6/9/2018 23:55:40'!
test01ACashierCantCheckOutEmptyCart
	| anEmptyCart aCatalog aCreditCard |
	
	aCatalog _ self createCatalog.
	anEmptyCart _ Cart acceptingItemsOf: aCatalog.
	aCreditCard _ self createNonExpiredCreditCard.
	
	self
		should: [ Cashier for: anEmptyCart with: aCreditCard ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier cantCheckOutEmptyCartErrorMessage ].! !

!CashierTest methodsFor: 'testing' stamp: 'LREV 6/10/2018 00:02:35'!
test02ACashierCanCheckOutACartWithOneItem
	| aCart aCatalog aCashier aCreditCard |
	
	aCatalog _ self createCatalog.
	aCart _ Cart acceptingItemsOf: aCatalog.
	aCart add: 'aBook'.
	aCreditCard _ self createNonExpiredCreditCard.
	
	aCashier _ self createACashierFor: aCart with: aCreditCard.
	
	self assert: aCashier total = 100.! !

!CashierTest methodsFor: 'testing' stamp: 'LREV 6/9/2018 23:59:31'!
test03ACashierCantAcceptAnExpiredCard
	| aCart aCatalog anExpiredCreditCard |
	
	aCatalog _ self createCatalog.
	aCart _ Cart acceptingItemsOf: aCatalog.
	aCart add: 'aBook'.
	anExpiredCreditCard _ self createExpiredCreditCard.
	
	self
		should: [ Cashier for: aCart with: anExpiredCreditCard ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cantPayWithAnExpiredCardErrorMessage ].! !

!CashierTest methodsFor: 'testing' stamp: 'LREV 6/10/2018 00:00:55'!
test04ACashierCanCheckOutACartWithMoreThanOneItem
	| aCart aCatalog aCashier aCreditCard |
	
	aCatalog _ self createCatalog.
	aCart _ Cart acceptingItemsOf: aCatalog.
	aCart add: 'aBook'.
	aCart add: 'anotherBook'.
	aCreditCard _ self createNonExpiredCreditCard.
	
	aCashier _ self createACashierFor: aCart with: aCreditCard.
	
	self assert: aCashier total = 135.! !

!CashierTest methodsFor: 'testing' stamp: 'LREV 6/10/2018 00:04:03'!
test05ACashierCanCheckOutACartWithMoreThanOneUnitOfSameItem
	| aCart aCatalog aCashier aCreditCard |
	
	aCatalog _ self createCatalog.
	aCart _ Cart acceptingItemsOf: aCatalog.
	aCart add: 2 of: 'aBook'.
	aCreditCard _ self createNonExpiredCreditCard.
	
	aCashier _ self createACashierFor: aCart with: aCreditCard.
		
	self assert: aCashier total = 200.! !

!CashierTest methodsFor: 'testing' stamp: 'LREV 6/10/2018 00:38:30'!
test06ACashierCanProcessPayment
	| aCart aCatalog aCashier aCreditCard |
	
	aCatalog _ self createCatalog.
	aCart _ Cart acceptingItemsOf: aCatalog.
	aCart add: 2 of: 'aBook'.
	aCreditCard _ self createNonExpiredCreditCard.
	
	aCashier _ self createACashierFor: aCart with: aCreditCard.
	
	self assert: aCashier checkOut.! !


!CashierTest methodsFor: 'support' stamp: 'LREV 6/7/2018 19:38:36'!
createACashierFor: aCart with: aCreditCard 
	^Cashier for: aCart with: aCreditCard! !

!CashierTest methodsFor: 'support' stamp: 'LREV 6/9/2018 23:54:56'!
createCatalog
	| dict |
	dict _ Dictionary new.
	dict add: 'aBook' -> 100.
	dict add: 'anotherBook' -> 35.
	^ dict.! !

!CashierTest methodsFor: 'support' stamp: 'LREV 6/10/2018 00:33:07'!
createExpiredCreditCard
	^ CreditCard
		for: 'Maria Objeto'
		until: (GregorianMonthOfYear mayOf: (GregorianYear number: 2018))
		withNumber: '5234 3456 3248 2390'.! !

!CashierTest methodsFor: 'support' stamp: 'LREV 6/10/2018 00:33:56'!
createNonExpiredCreditCard
	^ CreditCard
		for: 'Objeto Gonzalez'
		until: (GregorianMonthOfYear decemberOf: (GregorianYear number: 2018))
		withNumber: '5234 3456 3248 2390'.! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'LREV 6/7/2018 19:33:57'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'LREV 6/7/2018 19:34:37'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'as yet unclassified' stamp: 'LREV 6/7/2018 19:55:13'!
catalog
	^catalog copy! !

!Cart methodsFor: 'as yet unclassified' stamp: 'LREV 6/7/2018 19:55:40'!
contentList
	^ items copy! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'myCart creditCard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'initialization' stamp: 'LREV 6/7/2018 19:54:47'!
for: aCart with: aCreditCard 
	myCart:= aCart.
	creditCard := aCreditCard.! !


!Cashier methodsFor: 'sale' stamp: 'LREV 6/10/2018 00:38:57'!
total
	|itemsToCheck priceList|
	
	priceList := myCart catalog.
	itemsToCheck := myCart contentList.
	
	^ itemsToCheck inject: 0 into: [:sum :item | sum + priceList at: item ].
	! !


!Cashier methodsFor: 'payment' stamp: 'LREV 6/10/2018 00:36:56'!
checkOut

	self debitAmount: (self total) from: creditCard.
	^true.! !

!Cashier methodsFor: 'payment' stamp: 'LREV 6/10/2018 00:09:00'!
debitAmount: anAmount from: aCreditCard! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'LREV 6/11/2018 15:03:11'!
for: aCart with: aCreditCard
	
	self assertCartIsNotEmpty: aCart.
	self assertCardHasNotExpired: aCreditCard.
	
	^ self new for: aCart with: aCreditCard.! !


!Cashier class methodsFor: 'error messages' stamp: 'LREV 6/10/2018 00:09:37'!
cantCheckOutEmptyCartErrorMessage
	^'You cant check out an empty cart!!'! !

!Cashier class methodsFor: 'error messages' stamp: 'LREV 6/10/2018 00:09:44'!
cantPayWithAnExpiredCardErrorMessage
	^'Your credit card is expired.'! !


!Cashier class methodsFor: 'assertions' stamp: 'LREV 6/11/2018 15:04:24'!
assertCardHasNotExpired: aCreditCard

	aCreditCard hasExpired ifTrue: [ self error: self cantPayWithAnExpiredCardErrorMessage ].! !

!Cashier class methodsFor: 'assertions' stamp: 'LREV 6/11/2018 15:04:07'!
assertCartIsNotEmpty: aCart

	aCart isEmpty ifTrue: [ self error: self cantCheckOutEmptyCartErrorMessage ].! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'number owner expirationDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'LREV 6/10/2018 20:13:39'!
for: anOwnerName until: anExpirationDate withNumber: aCardNumber
	owner _ anOwnerName.
	expirationDate _ anExpirationDate.
	number _ aCardNumber.! !


!CreditCard methodsFor: 'inspecting' stamp: 'LREV 6/10/2018 20:13:39'!
expirationDate
	^ expirationDate copy.! !

!CreditCard methodsFor: 'inspecting' stamp: 'LREV 6/10/2018 20:13:39'!
hasExpired
	^ expirationDate < GregorianMonthOfYear current.! !

!CreditCard methodsFor: 'inspecting' stamp: 'LREV 6/9/2018 23:41:28'!
number
	^ number copy.! !

!CreditCard methodsFor: 'inspecting' stamp: 'LREV 6/9/2018 23:41:44'!
ownerName
	^ owner copy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'LREV 6/10/2018 16:37:51'!
for: anOwner until: aGregorianMonthOfYearExpDate withNumber: aCardNumber

	"Se deberia chequear que no se creen tarjetas vencidas, pero no nos serviria para testear"

 	^self new for: anOwner until: aGregorianMonthOfYearExpDate withNumber: aCardNumber.! !
