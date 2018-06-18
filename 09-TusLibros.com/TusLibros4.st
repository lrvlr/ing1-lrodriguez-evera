!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:50'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:04'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:00'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:59'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #TusLibrosFacadeTest category: #TusLibros!
TestCase subclass: #TusLibrosFacadeTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosFacadeTest methodsFor: 'testing' stamp: 'LREV 6/17/2018 22:48:17'!
test01SystemCreatesAnEmptyCartForAValidUserAndPass
	| system cartID |
	
	system _ testObjectsFactory createSystemWithMP: self.
	cartID _ self createValidCartFor: system.
		
	self assert: (system hasEmptyCart: cartID atTime: testObjectsFactory today).! !

!TusLibrosFacadeTest methodsFor: 'testing' stamp: 'LREV 6/17/2018 11:14:22'!
test02SystemCantCreateCartForAnInvalidUser
	| sys anInvalidUser cartID |
	
	sys _ testObjectsFactory createSystemWithMP: self.
	anInvalidUser _ testObjectsFactory createAnInvalidUser.
	
	self
		should: [
			cartID _ sys
				createCartFor: anInvalidUser key
				withPass: anInvalidUser value
				atTime: testObjectsFactory today ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = TusLibrosFacade invalidUserOrPasswordErrorMessage ].! !

!TusLibrosFacadeTest methodsFor: 'testing' stamp: 'LREV 6/17/2018 11:15:57'!
test03SystemCantCreateCartWithValidUserAndInvalidPassword
	| sys anInvalidUserPass cartID |
	
	sys _ testObjectsFactory createSystemWithMP: self.
	anInvalidUserPass _ testObjectsFactory createAValidUserWithInvalidPass.
	
	self
		should: [
			cartID _ sys
				createCartFor: anInvalidUserPass key
				withPass: anInvalidUserPass value 
				atTime: testObjectsFactory today]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = TusLibrosFacade invalidUserOrPasswordErrorMessage ].! !

!TusLibrosFacadeTest methodsFor: 'testing' stamp: 'LREV 6/17/2018 23:14:07'!
test04anUserLoggedToSystemCanAddItemsToCart
	| system cartID |
	
	system _ testObjectsFactory createSystemWithMP: self.
	cartID _ self createValidCartFor: system.
	self addDefaultBookFrom: system to: cartID.
	
	self assert: (system cart: cartID atTime: testObjectsFactory today includes: testObjectsFactory itemSellByTheStore).
	self assert: (system cart: cartID atTime: testObjectsFactory today occurrencesOf: testObjectsFactory itemSellByTheStore) = 1.! !

!TusLibrosFacadeTest methodsFor: 'testing' stamp: 'LREV 6/17/2018 23:14:45'!
test05anUserLoggedToSystemCanCheckOutItsCart
	| system aValidUser cartID userPurchases |
	
	system _ testObjectsFactory createSystemWithMP: self.
	aValidUser _ testObjectsFactory createValidUser.
	
	cartID _ self createValidCartFor: system.
	self addDefaultBookFrom: system to: cartID.
	self defaultCheckOutFrom: system for: cartID.
	
	userPurchases _ system
		listPurchasesFor: aValidUser key
		pass: aValidUser value.
	
	self assert: (userPurchases includesKey: testObjectsFactory itemSellByTheStore).
	self assert: (userPurchases at: testObjectsFactory itemSellByTheStore) = 1.
	self assert: (userPurchases at: TusLibrosFacade totalKey) = testObjectsFactory itemSellByTheStorePrice.! !

!TusLibrosFacadeTest methodsFor: 'testing' stamp: 'LREV 6/17/2018 23:16:27'!
test06anUserLoggedToSystemCantCheckOutACartMoreThanOnce
	| system aValidUser cartID userPurchases |
	
	system _ testObjectsFactory createSystemWithMP: self.
	aValidUser _ testObjectsFactory createValidUser.
	
	cartID _ self createValidCartFor: system.
	self addDefaultBookFrom: system to: cartID.
	self defaultCheckOutFrom: system for: cartID.
	
	userPurchases _ system
		listPurchasesFor: aValidUser key
		pass: aValidUser value.
	
	self
		should: [ self defaultCheckOutFrom: system for: cartID ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = TusLibrosFacade invalidCartIDErrorMessage.
			self assert: (userPurchases includesKey: testObjectsFactory itemSellByTheStore).
			self assert: (userPurchases at: testObjectsFactory itemSellByTheStore) = 1.
			self assert: (userPurchases at: TusLibrosFacade totalKey) = testObjectsFactory itemSellByTheStorePrice ].! !

!TusLibrosFacadeTest methodsFor: 'testing' stamp: 'LREV 6/17/2018 23:02:29'!
test07anUserCanQueryAllPurchasesEverDone
	| system aValidUser cartID cartID2 userPurchases |
	
	system _ testObjectsFactory createSystemWithMP: self.
	aValidUser _ testObjectsFactory createValidUser.
	
	cartID _ self createValidCartFor: system.
	self addDefaultBookFrom: system to: cartID.
	self defaultCheckOutFrom: system for: cartID.
	
	cartID2 _ self createValidCartFor: system.
	self addDefaultBookFrom: system to: cartID2.
	self defaultCheckOutFrom: system for: cartID2.
	
	userPurchases _ system
		listPurchasesFor: aValidUser key
		pass: aValidUser value.
		
	self assert: (userPurchases includesKey: testObjectsFactory itemSellByTheStore).
	self assert: (userPurchases at: testObjectsFactory itemSellByTheStore) = 2.
	self assert: (userPurchases at: TusLibrosFacade totalKey) = (2 * testObjectsFactory itemSellByTheStorePrice).! !

!TusLibrosFacadeTest methodsFor: 'testing' stamp: 'LREV 6/17/2018 23:17:14'!
test08aCartExpiresAfter30Minutes
	| system aValidUser cartID timerPlus30 |
	
	system _ testObjectsFactory createSystemWithMP: self.
	aValidUser _ testObjectsFactory createValidUser.
	cartID _ self createValidCartFor: system.
	self addDefaultBookFrom: system to: cartID.
	
	timerPlus30 _ testObjectsFactory today + (Duration minutes: 31).
	
	self
		should: [ self defaultCheckOutFrom: system for: cartID atTime: timerPlus30. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = TusLibrosFacade cartIDExpiredErrorMessage. 
			self should: [system listPurchasesFor: aValidUser key pass: aValidUser value.] 
				  raise: Error - MessageNotUnderstood
				  withExceptionDo:[ :anError2 | self assert: anError2 messageText = TusLibrosFacade noPurchasesRegisteredForUserErrorMessage].
		].

! !

!TusLibrosFacadeTest methodsFor: 'testing' stamp: 'LREV 6/17/2018 23:12:40'!
test09aCartExpirationTimerRefreshesAfterCartIsModified
	| system aValidUser cartID userPurchases timer timerPlus30 timerPlus15|
	
	system _ testObjectsFactory createSystemWithMP: self.
	aValidUser _ testObjectsFactory createValidUser.
	
	timer := testObjectsFactory today.	
	timerPlus15 := timer + (Duration minutes: 16).
	
	cartID _ self createValidCartFor: system.
	self addDefaultBookFrom: system to: cartID atTime: timerPlus15 .
	
	timerPlus30 := timer + (Duration minutes: 31).
	
	self defaultCheckOutFrom: system for: cartID atTime: timerPlus30.
			
	userPurchases _ system
		listPurchasesFor: aValidUser key
		pass: aValidUser value.

	self assert: (userPurchases includesKey: testObjectsFactory itemSellByTheStore).
	self assert: (userPurchases at: testObjectsFactory itemSellByTheStore) = 1.
	self assert: (userPurchases at: TusLibrosFacade totalKey) = (testObjectsFactory itemSellByTheStorePrice).		

! !


!TusLibrosFacadeTest methodsFor: 'setUp' stamp: 'LREV 6/15/2018 21:26:18'!
setUp

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!TusLibrosFacadeTest methodsFor: 'merchant processor protocol' stamp: 'LREV 6/15/2018 21:25:30'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard 
	
	! !


!TusLibrosFacadeTest methodsFor: 'private' stamp: 'LREV 6/17/2018 23:00:17'!
addDefaultBookFrom: aTLSystem to: cartID
	aTLSystem
		addToCart: cartID
		bookIsbn: testObjectsFactory itemSellByTheStore
		bookQuantity: 1
		atTime: testObjectsFactory today.! !

!TusLibrosFacadeTest methodsFor: 'private' stamp: 'LREV 6/17/2018 23:01:39'!
addDefaultBookFrom: aTLSystem to: cartID atTime: aTime
	aTLSystem
		addToCart: cartID
		bookIsbn: testObjectsFactory itemSellByTheStore
		bookQuantity: 1
		atTime: aTime.! !

!TusLibrosFacadeTest methodsFor: 'private' stamp: 'LREV 6/17/2018 22:37:49'!
createValidCartFor: aTLSystem

	^ aTLSystem
		createCartFor: testObjectsFactory createValidUser key
		withPass: testObjectsFactory createValidUser value
		atTime: testObjectsFactory today.! !

!TusLibrosFacadeTest methodsFor: 'private' stamp: 'LREV 6/17/2018 23:01:27'!
createValidCartFor: aTLSystem atTime: aTime

	^ aTLSystem
		createCartFor: testObjectsFactory createValidUser key
		withPass: testObjectsFactory createValidUser value
		atTime: aTime.! !

!TusLibrosFacadeTest methodsFor: 'private' stamp: 'LREV 6/17/2018 23:00:34'!
defaultCheckOutFrom: aTLSystem for: cartID
	aTLSystem
		checkOutCartID: cartID
		ccn: '5400000000000001'
		cced: '072019'
		cco: 'Pepe Sanchez'
		atTime: testObjectsFactory today.! !

!TusLibrosFacadeTest methodsFor: 'private' stamp: 'LREV 6/17/2018 23:00:57'!
defaultCheckOutFrom: aTLSystem for: cartID atTime: aTime
	aTLSystem
		checkOutCartID: cartID
		ccn: '5400000000000001'
		cced: '072019'
		cco: 'Pepe Sanchez'
		atTime: aTime.! !


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


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'LREV 6/17/2018 22:08:04'!
items

	^items copy.! !

!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:07'!
createSale

	^ Sale of: total
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !


!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/17/2013 19:06'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:51'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration number ownerName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'LREV 6/15/2018 17:07:04'!
forCcn: aCreditCardNumber cced: anExpirationDate cco: anOwnerName 

	number _ aCreditCardNumber.
	expiration _ anExpirationDate .
	ownerName _ anOwnerName.! !

!CreditCard methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:38'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !


!CreditCard methodsFor: 'as yet unclassified' stamp: 'LREV 6/15/2018 16:07:03'!
ccnumber
	^ number copy! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'LREV 6/15/2018 21:29:13'!
expDate
	^ expiration copy! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'LREV 6/15/2018 16:07:57'!
ownerName
	^ ownerName copy! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'LREV 6/15/2018 17:05:36'!
ccn: aCreditCardNumber cced: anExpirationDate cco: anOwnerName 
	^self new forCcn: aCreditCardNumber cced: anExpirationDate cco: anOwnerName 
! !

!CreditCard class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:38'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:47'!
initializeTotal: aTotal

	total := aTotal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:47'!
of: aTotal

	"should assert total is not negative or 0!!"
	^self new initializeTotal: aTotal ! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'LREV 6/15/2018 21:19:20'!
createSystemWithMP: aMerchantProcessor
	
	^TusLibrosFacade
		for: self defaultCatalog
		andUserDB: self defaultUserDB
		on: self today
		through: aMerchantProcessor.! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:37'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:36'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !


!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LREV 6/14/2018 21:24:47'!
aValidPassForUser1
	^'12345'! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LREV 6/14/2018 21:24:18'!
aValidUser1
	^'Ma Anand Sheela'! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LREV 6/14/2018 21:39:46'!
anInvalidPass1
	^'11111'! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LREV 6/14/2018 21:37:55'!
anInvalidUser1
	^'Stephen Hawking'! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LREV 6/15/2018 14:32:20'!
createAValidUserWithInvalidPass
	^(self aValidUser1 -> self anInvalidPass1 )! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LREV 6/14/2018 21:36:27'!
createAnInvalidUser
	^ (self anInvalidUser1 -> self anInvalidPass1)! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LREV 6/14/2018 21:30:43'!
createValidUser
	^( self aValidUser1 -> self aValidPassForUser1 )! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'LREV 6/14/2018 21:23:22'!
defaultUserDB
	
	^ Dictionary new
		at: self aValidUser1 put: self aValidPassForUser1;
		yourself ! !


!classDefinition: #TusLibrosCart category: #TusLibros!
Object subclass: #TusLibrosCart
	instanceVariableNames: 'cart user id lastTimeModified'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosCart methodsFor: 'initialization' stamp: 'LREV 6/17/2018 22:18:43'!
acceptingItemsOf: aCatalog for: aUser at: aDateAndTimeOfCreation withID: aCartID
	cart _ Cart acceptingItemsOf: aCatalog.
	user _ aUser.
	lastTimeModified _ aDateAndTimeOfCreation.
	id _ aCartID.! !


!TusLibrosCart methodsFor: 'accessing' stamp: 'LREV 6/16/2018 16:50:25'!
cart
	^cart copy! !

!TusLibrosCart methodsFor: 'accessing' stamp: 'LREV 6/17/2018 22:17:00'!
contents
	|contents|
	
	contents _ Dictionary new.
	
	cart items do: [ :aBook | (contents includes: aBook) ifFalse:[ contents at: aBook put: (cart occurrencesOf: aBook)] ].
	
	^contents! !

!TusLibrosCart methodsFor: 'accessing' stamp: 'LREV 6/16/2018 16:51:52'!
user
	^user copy! !


!TusLibrosCart methodsFor: 'testing' stamp: 'LREV 6/17/2018 14:03:15'!
activeAt: aDateAndTimeOfQuery
	| expirationTime |
	expirationTime _ lastTimeModified + (Duration minutes: 30).
	^ aDateAndTimeOfQuery < expirationTime.! !

!TusLibrosCart methodsFor: 'testing' stamp: 'LREV 6/16/2018 17:48:02'!
includes: aBookISBN 
	^ cart includes: aBookISBN.! !

!TusLibrosCart methodsFor: 'testing' stamp: 'LREV 6/16/2018 16:43:53'!
isEmpty
	^ cart isEmpty.! !

!TusLibrosCart methodsFor: 'testing' stamp: 'LREV 6/16/2018 17:49:34'!
occurrencesOf: aBookISBN
	^ cart occurrencesOf: aBookISBN ! !


!TusLibrosCart methodsFor: 'buying' stamp: 'LREV 6/17/2018 22:18:34'!
add: anAmount of: aBookISBN at: aDateAndTimeOfModification

	cart
		add: anAmount
		of: aBookISBN.
	lastTimeModified _ aDateAndTimeOfModification.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosCart class' category: #TusLibros!
TusLibrosCart class
	instanceVariableNames: ''!

!TusLibrosCart class methodsFor: 'instance creation' stamp: 'LREV 6/16/2018 15:42:54'!
acceptingItemsOf: aCatalog for: aUser at: aTimeStamp withID: aCartID
	
	^ self new acceptingItemsOf: aCatalog for: aUser at: aTimeStamp withID: aCartID.! !


!classDefinition: #TusLibrosFacade category: #TusLibros!
Object subclass: #TusLibrosFacade
	instanceVariableNames: 'nextID activeCarts catalog userDB nextTransactionID mp businessDate salesBook userPurchases'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosFacade methodsFor: 'initialization' stamp: 'LREV 6/16/2018 17:30:23'!
for: aCatalog andUserDB: aUserDB on: aBusinessDate through: aMerchantProcessor 
	nextID:= 0.
	nextTransactionID := 0.
	activeCarts:= Dictionary new.
	catalog:= aCatalog.
	userDB:= aUserDB.
	mp := aMerchantProcessor.
	businessDate := aBusinessDate.
	salesBook := OrderedCollection new.
	userPurchases := Dictionary new.
! !


!TusLibrosFacade methodsFor: 'accessing' stamp: 'LREV 6/16/2018 17:24:16'!
listCart: aCartID atTime: aTime
	^ (self assertActiveCart: aCartID at: aTime) contents.! !

!TusLibrosFacade methodsFor: 'accessing' stamp: 'LREV 6/15/2018 17:33:15'!
listPurchasesFor: aUser pass: aPassword 
	
	self assertValidUser: aUser pass: aPassword.
	
	^ userPurchases at: aUser ifAbsent: [self error: self class noPurchasesRegisteredForUserErrorMessage]! !


!TusLibrosFacade methodsFor: 'system - private' stamp: 'LREV 6/17/2018 11:12:35'!
registerPurchasedItems: aPurchasedItemsList total: anAmount forUser: aUserName 
	
	|userRegister previousTotal|
	
	userRegister _ userPurchases at: aUserName ifAbsent: [userPurchases at: aUserName put: Dictionary new].
	
	previousTotal := userRegister at: self class totalKey ifAbsent: 0.
	
	userRegister at: self class totalKey put: previousTotal + anAmount.
	
	aPurchasedItemsList keysAndValuesDo: [:anItemID :anItemAmount| 
														userRegister 	at: anItemID 
																		put: (userRegister at: anItemID ifAbsent: 0) + anItemAmount value]! !

!TusLibrosFacade methodsFor: 'system - private' stamp: 'LREV 6/16/2018 17:05:04'!
removeFromSystem: aCartID 
	activeCarts removeKey: aCartID.
! !


!TusLibrosFacade methodsFor: 'assertions' stamp: 'LREV 6/16/2018 15:55:39'!
assertActiveCart: aCartID at: aTime
	
	|cart| 
	
	cart _ activeCarts at: aCartID ifAbsent: [self error: self class invalidCartIDErrorMessage ].
	
	(cart activeAt: aTime) ifFalse: [ self removeFromSystem: aCartID.
										     self error: self class cartIDExpiredErrorMessage.].
	
	^cart! !

!TusLibrosFacade methodsFor: 'assertions' stamp: 'LREV 6/17/2018 11:41:10'!
assertValidUser: aUser pass: aPass 
	|pass|
	
	pass := userDB at: aUser ifAbsent: [self error: self class invalidUserOrPasswordErrorMessage].
	
	(pass = aPass) ifFalse: [self error: self class invalidUserOrPasswordErrorMessage].! !


!TusLibrosFacade methodsFor: 'instance creation - private' stamp: 'LREV 6/16/2018 16:50:03'!
cashierFor: aTusLibrosCart charging: aCreditCard
	
	^ Cashier toCheckout: aTusLibrosCart cart 
				charging: aCreditCard
				throught: mp
				on: businessDate
				registeringOn: salesBook.! !

!TusLibrosFacade methodsFor: 'instance creation - private' stamp: 'LREV 6/15/2018 18:50:25'!
creditCardNum: aCreditCardNumber cced: aCreditCardExpDate cco: aCreditCardOwner 
	
	| ccExp expMonthNumber expYearNumber|

	expMonthNumber _ (aCreditCardExpDate copyFrom: 1 to: 2) asInteger.
	expYearNumber _ (aCreditCardExpDate copyFrom: 3 to: 6) asInteger.
	ccExp _ Month month: expMonthNumber year: expYearNumber.
	
	^CreditCard ccn: aCreditCardNumber cced: ccExp cco: aCreditCardOwner.
! !


!TusLibrosFacade methodsFor: 'buying' stamp: 'LREV 6/16/2018 17:21:45'!
addToCart: aCartID bookIsbn: aBook bookQuantity: anAmount atTime: aTime 

	(self assertActiveCart: aCartID at: aTime) add: anAmount of: aBook at: aTime .! !

!TusLibrosFacade methodsFor: 'buying' stamp: 'LREV 6/16/2018 16:51:30'!
checkOutCartID: aCartID ccn: aCreditCardNumber cced: aCreditCardExpDate cco: aCreditCardOwner atTime: aTime 
	
	| cart creditCard total|

	cart _ self assertActiveCart: aCartID  at: aTime.
	
	creditCard _ self creditCardNum: aCreditCardNumber  cced: aCreditCardExpDate  cco: aCreditCardOwner.
	
	total := (self cashierFor: cart charging: creditCard) checkOut.

	nextTransactionID := nextTransactionID + 1.
	
	self registerPurchasedItems: cart contents total: total forUser: cart user.
	self removeFromSystem: aCartID.
	
	^ nextTransactionID.
	! !

!TusLibrosFacade methodsFor: 'buying' stamp: 'LREV 6/16/2018 15:43:45'!
createCartFor: aUser withPass: aPassword atTime: aTime 
	self assertValidUser: aUser pass: aPassword. 

	nextID := nextID + 1.

	activeCarts at: nextID put: (TusLibrosCart acceptingItemsOf: catalog for: aUser at: aTime withID: nextID).
	
	^ nextID.
	
	! !


!TusLibrosFacade methodsFor: 'testing' stamp: 'LREV 6/16/2018 17:47:28'!
cart: aCartID atTime: aDateAndTime includes: aBookISBN 
	^(self assertActiveCart: aCartID at: aDateAndTime) includes: aBookISBN.! !

!TusLibrosFacade methodsFor: 'testing' stamp: 'LREV 6/16/2018 17:49:01'!
cart: aCartID atTime: aDateAndTime occurrencesOf: aBookISBN 
	^ (self assertActiveCart: aCartID at: aDateAndTime) occurrencesOf: aBookISBN ! !

!TusLibrosFacade methodsFor: 'testing' stamp: 'LREV 6/16/2018 17:41:01'!
hasEmptyCart: aCartID atTime: aDateAndTime 
	
	^ (self assertActiveCart: aCartID at: aDateAndTime) isEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosFacade class' category: #TusLibros!
TusLibrosFacade class
	instanceVariableNames: ''!

!TusLibrosFacade class methodsFor: 'instance creation' stamp: 'LREV 6/15/2018 16:59:38'!
for: aCatalog andUserDB: aUserDB on: aBusinessDate through: aMerchantProcessor 
	
	^ self new for: aCatalog andUserDB: aUserDB on: aBusinessDate through: aMerchantProcessor .! !


!TusLibrosFacade class methodsFor: 'error messages' stamp: 'LREV 6/15/2018 17:55:37'!
cartIDExpiredErrorMessage

	^'The session has expired. If your purchases were not registered, start over.' ! !

!TusLibrosFacade class methodsFor: 'error messages' stamp: 'LREV 6/15/2018 18:00:33'!
invalidCartIDErrorMessage
	^'The ID provided has no active cart associated'! !

!TusLibrosFacade class methodsFor: 'error messages' stamp: 'LREV 6/14/2018 21:51:21'!
invalidUserOrPasswordErrorMessage
	^'User or password are incorrect'.! !

!TusLibrosFacade class methodsFor: 'error messages' stamp: 'LREV 6/15/2018 20:58:41'!
noPurchasesRegisteredForUserErrorMessage
	^'The user has no purchases registered on the system'! !


!TusLibrosFacade class methodsFor: '- private' stamp: 'LREV 6/15/2018 17:02:48'!
totalKey
	^'total'! !
