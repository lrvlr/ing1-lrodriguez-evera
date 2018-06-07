!classDefinition: #CartTests category: #TusLibros!
TestCase subclass: #CartTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTests methodsFor: 'testing' stamp: 'LREV 6/5/2018 20:00:48'!
test01ACartIsEmptyWhenCreated
	| aCart aCatalog|
	
	aCatalog := Set new.

	aCart := Cart for: aCatalog.
	
	self assert: aCart isEmpty.
	! !

!CartTests methodsFor: 'testing' stamp: 'LREV 6/5/2018 19:58:25'!
test02ABookInCatalogCanBeAddedToAnEmptyCart

	|aCart aBook aCatalog|
	
	aBook := 'Rayuela'.
	
	aCatalog := Set with: aBook.  
	
	aCart := Cart for: aCatalog.
	aCart addItem: aBook. 

	self deny: aCart isEmpty.
	self assert: aCart totalItems = 1	
! !

!CartTests methodsFor: 'testing' stamp: 'LREV 6/5/2018 20:02:02'!
test03MoreThanOneUnitOfTheSameItemCanBeAddedToACart
	| aCart aBook aCatalog |
	
	aBook := 'Rayuela'.
	aCatalog := Set with: aBook.
	aCart _ Cart for: aCatalog.
	aCart
		addUnits: 2
		ofItem: aBook.
	self deny: aCart isEmpty.
	self assert: aCart totalItems = 2.! !

!CartTests methodsFor: 'testing' stamp: 'LREV 6/5/2018 20:03:00'!
test04DifferentItemsCanBeAddedToACart
	| aCart aBook1 aBook2 aCatalog|
	

	aBook1 _ 'Libro1'.
	aBook2 _ 'Libro2'.

	aCatalog:= Set with: aBook1 with: aBook2.
	
	aCart _ Cart for: aCatalog.
	
	aCart addItem: aBook1.
	aCart addItem: aBook2.
	
	self deny: aCart isEmpty.
	self assert: aCart totalItems = 2.
	self assert: (aCart contains: aBook1).
	self assert: (aCart contains: aBook2).
	self assert: (aCart totalUnitsOfItem: aBook1) = 1.
	self assert: (aCart totalUnitsOfItem: aBook2) = 1.! !

!CartTests methodsFor: 'testing' stamp: 'LREV 6/5/2018 20:03:29'!
test05ThingsInCartCanBeRemoved

	|aCart aBook aCatalog|
	
	
	aBook := 'Libro1'.

	aCatalog:= Set with: aBook.	

	aCart := Cart for: aCatalog.
	aCart addItem: aBook.

	aCart removeItem: aBook. 

	self assert: aCart isEmpty.! !

!CartTests methodsFor: 'testing' stamp: 'LREV 6/5/2018 20:04:00'!
test06CanAddMoreUnitsOfAnExistingItemInACart

	|aCart book1 book2 aCatalog|
	
	book1 := 'Libro1'.
	book2:= 'Libro2'.
	
	aCatalog:= Set with: book1 with: book2.
	
	aCart := Cart for: aCatalog.
	aCart addItem: book1.
	aCart addUnits: 2 ofItem: book2. 
	aCart addItem: book1.
	aCart addUnits: 3 ofItem: book2. 
	
	
	self deny: aCart isEmpty.
	self assert: aCart totalItems = 7.
	self assert: ( (aCart totalUnitsOfItem: book1) = 2).
	self assert: ( (aCart totalUnitsOfItem: book2) = 5).! !

!CartTests methodsFor: 'testing' stamp: 'LREV 6/5/2018 20:04:46'!
test07CanRemoveUnitsOfARepeatedItem
	| aCart aBook aCatalog|
	aBook _ 'Libro1'.

	aCatalog:= Set with: aBook.
	aCart _ Cart for: aCatalog.
	aCart
		addUnits: 3
		ofItem: aBook.
	aCart
		removeUnits: 1
		ofItem: aBook.
	self deny: aCart isEmpty.
	self assert: aCart totalItems = 2.
	self assert: (aCart totalUnitsOfItem: aBook) = 2.! !

!CartTests methodsFor: 'testing' stamp: 'LREV 6/5/2018 20:20:49'!
test08CantAddABookNotInCatalog
	| aCart aBook aCatalog otherBook |
	aBook _ 'Libro1'.
	otherBook _ 'Neverending story'.
	aCatalog _ Set with: aBook.
	aCart _ Cart for: aCatalog.
	self
		should: [ aCart addItem: otherBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :notInCatalog |
			self assert: Cart itemNotInCatalogErrorMessage = notInCatalog messageText ].! !

!CartTests methodsFor: 'testing' stamp: 'LREV 6/7/2018 00:08:57'!
test09ACartCanReturnItsContents
	| aCart aBook1 aBook2 aCatalog aCartContents|
	aBook1 _ 'Libro1'.
	aBook2 _ 'Libro2'.

	aCatalog _ Set with: aBook1 with: aBook2.
	aCart _ Cart for: aCatalog.
	aCart
		addUnits: 2
		ofItem: aBook1.
	aCart
		addUnits: 1
		ofItem: aBook2.
		
	aCartContents _ aCart contents.
	
	self assert: aCartContents size equals: 2.
	self assert: (aCartContents includesKey: aBook1).
	self assert: 2 equals:  (aCartContents at: aBook1) .
	self assert: (aCartContents includesKey: aBook2).
	self assert: 1 equals: (aCartContents at: aBook2).! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'books catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'inspecting' stamp: 'LREV 6/5/2018 19:08:15'!
contains: aBook 
	^books includesKey: aBook.! !

!Cart methodsFor: 'inspecting' stamp: 'LREV 6/6/2018 23:57:59'!
contents

	^books copy.! !

!Cart methodsFor: 'inspecting' stamp: 'LREV 6/4/2018 21:21:14'!
isEmpty
	^books isEmpty.! !

!Cart methodsFor: 'inspecting' stamp: 'LREV 6/5/2018 19:06:21'!
totalItems
	^ books inject: 0 into: [:total :aBook | total + aBook value] ! !

!Cart methodsFor: 'inspecting' stamp: 'LREV 6/5/2018 19:14:31'!
totalUnitsOfItem: aBook 
	^ books at: aBook value ifAbsent: [0].! !


!Cart methodsFor: 'selecting books' stamp: 'LREV 6/5/2018 19:30:43'!
addItem: aBook

	self addUnits: 1 ofItem: aBook.! !

!Cart methodsFor: 'selecting books' stamp: 'LREV 6/5/2018 20:20:25'!
addUnits: aNumberOfUnits ofItem: aBook

	|units|
	
	(catalog includes: aBook) ifFalse: [self error: self class itemNotInCatalogErrorMessage].
	
	units := books at: aBook value ifAbsent: [^ books add: aBook -> aNumberOfUnits].
	
	books add: aBook -> (units + aNumberOfUnits).! !


!Cart methodsFor: 'eliminating books' stamp: 'LREV 6/5/2018 19:30:18'!
removeItem: aBook 
	self removeUnits: 1 ofItem: aBook.

	
	
! !

!Cart methodsFor: 'eliminating books' stamp: 'LREV 6/5/2018 19:13:33'!
removeUnits: aNumberOfUnits ofItem: aBook
	|units|
	
	units := books at: aBook value ifAbsent: [^self error: self class cantRemoveItemsNotInCartErrorMessage].
	
	units := units - aNumberOfUnits.
	
	(units > 0) ifTrue:
	[	
		books at: aBook put: units
		]
	ifFalse:
	[
		books removeKey: aBook
		]
	! !


!Cart methodsFor: 'initialization' stamp: 'LREV 6/5/2018 19:59:55'!
for: aCatalog 
	catalog := aCatalog.
	books:=Dictionary new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'error message' stamp: 'LREV 6/5/2018 18:45:30'!
cantRemoveItemsNotInCartErrorMessage
	^'You can not remove an item that is not in the cart'! !

!Cart class methodsFor: 'error message' stamp: 'LREV 6/5/2018 20:11:30'!
itemNotInCatalogErrorMessage
	^'The item you selected is not in the catalogue'! !


!Cart class methodsFor: 'instance creation' stamp: 'LREV 6/5/2018 19:59:06'!
for: aCatalog
	^ self new for: aCatalog! !
