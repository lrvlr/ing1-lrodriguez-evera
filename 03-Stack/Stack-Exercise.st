!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #ElementInStack category: #'Stack-Exercise'!
Object subclass: #ElementInStack
	instanceVariableNames: 'value previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!ElementInStack methodsFor: 'accessing' stamp: 'LREV 4/20/2018 23:42:07'!
elementValue

	^value! !

!ElementInStack methodsFor: 'accessing' stamp: 'LREV 4/20/2018 23:42:45'!
previous

	^previous! !


!ElementInStack methodsFor: 'testing' stamp: 'LREV 4/20/2018 23:42:14'!
isEmptyElement
	
	self subclassResponsibility
	! !

!ElementInStack methodsFor: 'testing' stamp: 'LREV 4/20/2018 23:52:47'!
isEmptyElementDo: valueThisClosure

	self subclassResponsibility
	! !


!classDefinition: #EmptyElementInStack category: #'Stack-Exercise'!
ElementInStack subclass: #EmptyElementInStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyElementInStack methodsFor: 'testing' stamp: 'LREV 4/20/2018 23:41:59'!
isEmptyElement

	^true.! !

!EmptyElementInStack methodsFor: 'testing' stamp: 'LREV 4/20/2018 23:41:36'!
isEmptyElementDo: valueThisClosure

	^valueThisClosure value.! !


!classDefinition: #NotEmptyElementInStack category: #'Stack-Exercise'!
ElementInStack subclass: #NotEmptyElementInStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyElementInStack methodsFor: 'testing' stamp: 'LREV 4/20/2018 23:40:12'!
isEmptyElement

	^ false.! !

!NotEmptyElementInStack methodsFor: 'testing' stamp: 'LREV 4/20/2018 23:40:35'!
isEmptyElementDo: valueThisClosure
! !


!NotEmptyElementInStack methodsFor: 'initialization' stamp: 'LREV 4/20/2018 23:40:04'!
initializeWith: aValue after: anElementInStack

	value := aValue.
	previous := anElementInStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyElementInStack class' category: #'Stack-Exercise'!
NotEmptyElementInStack class
	instanceVariableNames: ''!

!NotEmptyElementInStack class methodsFor: 'instance creation' stamp: 'LREV 4/20/2018 13:35:58'!
with: aValue after: anElementInStack

	^self basicNew initializeWith: aValue after: anElementInStack! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'lastElement size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'LREV 4/20/2018 23:39:22'!
initialize

	lastElement := EmptyElementInStack new.
	size := 0.
	! !


!OOStack methodsFor: 'testing' stamp: 'LREV 4/20/2018 23:39:28'!
isEmpty

	^ lastElement isEmptyElement.! !

!OOStack methodsFor: 'testing' stamp: 'LREV 4/20/2018 23:40:27'!
isEmptyDo: valueThisClosure

	lastElement isEmptyElementDo: valueThisClosure. ! !


!OOStack methodsFor: 'adding' stamp: 'LREV 4/20/2018 23:39:38'!
push: aString

	|newElement|
	
	newElement := NotEmptyElementInStack with: aString after: lastElement.
	
	lastElement := newElement.
	
	size := size + 1.
	
	! !


!OOStack methodsFor: 'removing' stamp: 'LREV 4/20/2018 23:38:57'!
pop

	|popObject|
	
	self isEmptyDo: [^Error signal: self class stackEmptyErrorDescription].
	
	popObject := lastElement.
	
	lastElement := lastElement previous.
	
	size := size - 1.
	
	^ popObject elementValue ! !


!OOStack methodsFor: 'accessing' stamp: 'LREV 4/20/2018 23:39:45'!
size

	^ size.! !

!OOStack methodsFor: 'accessing' stamp: 'LREV 4/20/2018 23:39:54'!
top
	
	self isEmptyDo: [^Error signal: self class stackEmptyErrorDescription].
	
	^lastElement elementValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'instance creation' stamp: 'LREV 4/20/2018 23:28:03'!
new

	^self basicNew initialize.! !
