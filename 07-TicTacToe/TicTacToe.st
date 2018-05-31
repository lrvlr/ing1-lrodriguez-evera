!classDefinition: #TicTacToeTest category: #TicTacToe!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeTest methodsFor: 'testing' stamp: 'LVR 5/28/2018 18:52:58'!
test01TicTacToeGameHasNoMovementsWhenCreated
	| game |
	game _ TicTacToe new.
	self assert: game XHasNoPlays.
	self assert: game OHasNoPlays.! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LVR 5/25/2018 13:19:37'!
test02FirstXPlayAddsThatMovementForX

	|game|
	
	game := TicTacToe new.

	game markWithXAt: 1@1.
	
	self assert: 1 equals: game XPlaysCount.
	self assert: (game XPlaysInclude: 1@1).
	self assert: game OHasNoPlays.
	
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LVR 5/25/2018 16:30:48'!
test03FirstOPlayAddsThatMovementForO

	|game|
	
	game := TicTacToe new.

	game markWithXAt: 1@1.
	game markWithOAt: 2@2.
	
	self assert: 1 equals: game XPlaysCount.
	self assert: (game XPlaysInclude: 1@1).
	self assert: 1 equals: game OPlaysCount.
	self assert: (game OPlaysInclude: 2@2).
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LVR 5/25/2018 13:39:38'!
test04XCantPlayAgainOnOTurn

	|game|
	
	game := TicTacToe new.

	game markWithXAt: 1@1.
	
	self
	should: [game markWithXAt: 2@2]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.	
		self assert: 1 equals: game XPlaysCount.
		self assert: (game XPlaysInclude: 1@1).
		self assert: game OHasNoPlays.
		].
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LVR 5/25/2018 17:34:23'!
test05OCantPlayAgainOnXTurn

	|game|
	
	game := TicTacToe new.

	game markWithXAt: 1@1.
	game markWithOAt: 2@2.
	self
	should: [game markWithOAt: 3@3]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe notOTurnErrorMessage equals: anError messageText.	
		self assert: 1 equals: game XPlaysCount.
		self assert: (game XPlaysInclude: 1@1).
		self assert: 1 equals: game OPlaysCount.
		self assert: (game OPlaysInclude: 2@2).
		].
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LVR 5/25/2018 16:31:06'!
test06XCantPlayOnPositionItAlreadyPlayed

	|game|
	
	game := TicTacToe new.

	game markWithXAt: 1@1.
	game markWithOAt: 2@2.
	self
	should: [game markWithXAt: 1@1]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 1 equals: game XPlaysCount.
		self assert: (game XPlaysInclude: 1@1).
		self assert: 1 equals: game OPlaysCount.
		self assert: (game OPlaysInclude: 2@2).
		].
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LVR 5/25/2018 16:31:12'!
test07XCantPlayOnPositionOAlreadyPlayed


	|game|
	
	game := TicTacToe new.

	game markWithXAt: 1@1.
	game markWithOAt: 2@2.
	self
	should: [game markWithXAt: 2@2]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 1 equals: game XPlaysCount.
		self assert: (game XPlaysInclude: 1@1).
		self assert: 1 equals: game OPlaysCount.
		self assert: (game OPlaysInclude: 2@2).
		].
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LVR 5/25/2018 16:31:18'!
test08OCantPlayOnPositionXAlreadyPlayed

	|game|
	
	game := TicTacToe new.

	game markWithXAt: 1@1.
	self
	should: [game markWithOAt: 1@1]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 1 equals: game XPlaysCount.
		self assert: (game XPlaysInclude: 1@1).
		self assert:  game OHasNoPlays.

		].
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LVR 5/25/2018 16:31:26'!
test09OCantPlayOnPositionItAlreadyPlayed

	|game|
	
	game := TicTacToe new.

	game markWithXAt: 1@1.
	game markWithOAt: 2@2.
	game markWithXAt: 3@3.
	self
	should: [game markWithOAt: 2@2]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [ :anError|
		self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.	
		self assert: 2 equals: game XPlaysCount.
		self assert: (game XPlaysInclude: 1@1).
		self assert: (game XPlaysInclude: 3@3).
		self assert: 1 equals: game OPlaysCount.
		self assert: (game OPlaysInclude: 2@2).
		
		].
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LREV 5/30/2018 23:37:09'!
test10NobodyWinsIfNoOneCompletedRowColumnOrDiagonal
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 3 @ 3.
	self deny: game hasOWon.
	self deny: game hasXWon.! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LREV 5/30/2018 23:37:10'!
test11XWinsGameIfCompletesFirstRow
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 3 @ 3.
	game markWithXAt: 1 @ 3.
	self assert: game hasXWon.
	self deny: game hasOWon.! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LREV 5/30/2018 23:37:10'!
test12XWinsGameIfCompletesSecondRow
	| game |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 2 @ 3.
	self assert: game hasXWon.
	self deny: game hasOWon.! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LREV 5/30/2018 23:37:10'!
test13XWinsGameIfCompletesThirdRow
	| game |
	game _ TicTacToe new.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 3 @ 2.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 3 @ 3.
	self assert: game hasXWon.
	self deny: game hasOWon.! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LREV 5/30/2018 23:37:10'!
test14XWinsGameIfCompletesFirstColumn
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 3 @ 3.
	game markWithXAt: 3 @ 1.
	self assert: game hasXWon.
	self deny: game hasOWon.! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LREV 5/30/2018 23:37:09'!
test15XWinsGameIfCompletesDownDiagonal
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 3 @ 3.
	self assert: game hasXWon.
	self deny: game hasOWon.! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LREV 5/30/2018 23:37:10'!
test16XWinsGameIfCompletesUpDiagonal
	| game |
	game _ TicTacToe new.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 1 @ 3.
	self assert: game hasXWon.
	self deny: game hasOWon.! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LREV 5/30/2018 23:37:10'!
test17OWinsGameIfCompletesFirstRow
	| game |
	game _ TicTacToe new.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 3 @ 3.
	game markWithOAt: 1 @ 3.
	self assert: game hasOWon.
	self deny: game hasXWon.! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LVR 5/25/2018 16:32:56'!
test18OCantPlayIfGameIsOver

	| game |
	
	game := TicTacToe new.
	
	game markWithXAt: 1@1.	
	game markWithOAt: 2@1.
	game markWithXAt: 1@2.
	game markWithOAt: 3@1.	
	game markWithXAt: 1@3.

	self 
		should: [ game markWithOAt: 3@1 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 2 equals: game OPlaysCount.
			self assert: (game OPlaysInclude: 2@1).
			self assert: (game OPlaysInclude: 3@1) ]
			
			! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LVR 5/25/2018 16:33:08'!
test19XCantPlayIfGameIsOver

	| game |
	
	game := TicTacToe new.
	
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.	
	game markWithXAt: 2@1.
	game markWithOAt: 1@2.
	game markWithXAt: 3@1.	
	game markWithOAt: 1@3.

	self 
		should: [ game markWithXAt: 3@2 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assert: 3 equals: game XPlaysCount.
			self assert: (game XPlaysInclude: 2@2).
			self assert: (game XPlaysInclude: 2@1).
			self assert: (game XPlaysInclude: 3@1) ]
			
			! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LREV 5/30/2018 23:37:10'!
test20GameEndsTiedIfNobodyHasWon
	| game |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 1 @ 3.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 3 @ 2.
	game markWithXAt: 3 @ 3.
	self assert: game isOver.
	self deny: game hasXWon.
	self deny: game hasOWon.
	self assert: game isTied.! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LREV 5/30/2018 23:37:10'!
test21GameEndsIfXHasWon
	| game |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 1 @ 3.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 3 @ 2.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 3 @ 3.
	self assert: game isOver.
	self assert: game hasXWon.
	self deny: game hasOWon.
	self deny: game isTied.! !

!TicTacToeTest methodsFor: 'testing' stamp: 'LREV 5/30/2018 23:53:34'!
test22CantPlayOnPositionOutsideBoard

	| game |
	
	game := TicTacToe new.
	
	self 
		should: [ game markWithXAt: -1@2 ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: TicTacToe notValidPositionErrorMessage equals: anError messageText.
			self assert: (game XHasNoPlays).
			self assert: (game OHasNoPlays).
			]! !


!classDefinition: #TicTacToe category: #TicTacToe!
Object subclass: #TicTacToe
	instanceVariableNames: 'os xs state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToe methodsFor: 'play attempt' stamp: 'LVR 5/29/2018 23:56:34'!
markWithOAt: aPosition
	state markWithOAt: aPosition.
! !

!TicTacToe methodsFor: 'play attempt' stamp: 'LVR 5/28/2018 21:17:04'!
markWithXAt: aPosition
	state markWithXAt: aPosition.
! !


!TicTacToe methodsFor: 'initialization' stamp: 'LREV 5/30/2018 23:27:10'!
initialize
	
	xs:= Set new.
	os:= Set new.
	
	state:= TicTacToeXTurnState for: self
	
	! !

!TicTacToe methodsFor: 'fair play' stamp: 'LREV 5/31/2018 00:47:12'!
markOIn: aPosition
	self isValidPosition: aPosition.
	os add: aPosition.
	self checkAndChangeTurnToX.! !

!TicTacToe methodsFor: 'fair play' stamp: 'LREV 5/31/2018 00:47:01'!
markXIn: aPosition
	self isValidPosition: aPosition.
	xs add: aPosition.
	self checkAndChangeTurnToO.! !


!TicTacToe methodsFor: 'faults' stamp: 'LREV 5/30/2018 23:27:49'!
gameOverError
	^ self error: self class canNotPlayWhenGameIsOverErrorMessage.! !

!TicTacToe methodsFor: 'faults' stamp: 'LREV 5/30/2018 17:52:11'!
isOutsideBoard: aPosition
	
	^(aPosition between: 1@1 and: 3@3) not! !

!TicTacToe methodsFor: 'faults' stamp: 'LREV 5/31/2018 00:03:20'!
isValidPosition: aPosition

	(self isOutsideBoard: aPosition) 
		ifTrue: [ self error: self class notValidPositionErrorMessage ].
	((xs includes: aPosition) or: [ os includes: aPosition ]) 
		ifTrue: [ self error: self class positionTakenErrorMessage ]
! !

!TicTacToe methodsFor: 'faults' stamp: 'LREV 5/30/2018 23:31:10'!
notOTurnError
	^ self error: self class notOTurnErrorMessage.! !

!TicTacToe methodsFor: 'faults' stamp: 'LREV 5/30/2018 23:31:28'!
notXTurnError
	^ self error: self class notXTurnErrorMessage.! !


!TicTacToe methodsFor: 'actualize state' stamp: 'LREV 5/31/2018 00:47:00'!
checkAndChangeTurnToO
	(self hasWinningPlay: xs) ifTrue: [ ^ state _ TicTacToeXWonState for: self ].
	self checkIfTied ifTrue: [ ^ state _ TicTacToeTiedState for: self ].
	^ state _ TicTacToeOTurnState for: self.! !

!TicTacToe methodsFor: 'actualize state' stamp: 'LREV 5/31/2018 00:47:12'!
checkAndChangeTurnToX
	(self hasWinningPlay: os) ifTrue: [ ^ state _ TicTacToeOWonState for: self ].
	^ state _ TicTacToeXTurnState for: self.! !


!TicTacToe methodsFor: 'testing' stamp: 'LREV 5/31/2018 00:39:23'!
OHasNoPlays

	^ os isEmpty! !

!TicTacToe methodsFor: 'testing' stamp: 'LREV 5/31/2018 00:43:39'!
OPlaysCount

	^ os size! !

!TicTacToe methodsFor: 'testing' stamp: 'LREV 5/31/2018 00:38:37'!
OPlaysInclude: aPosition

	^ os includes: aPosition! !

!TicTacToe methodsFor: 'testing' stamp: 'LREV 5/31/2018 00:39:29'!
XHasNoPlays

	^ xs isEmpty! !

!TicTacToe methodsFor: 'testing' stamp: 'LREV 5/31/2018 00:43:30'!
XPlaysCount

	^ xs size! !

!TicTacToe methodsFor: 'testing' stamp: 'LREV 5/31/2018 00:38:29'!
XPlaysInclude: aPosition

	^ xs includes: aPosition! !


!TicTacToe methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:42:26'!
checkIfTied
	
	^ xs size = 5 and: [ self hasXWon not ].! !

!TicTacToe methodsFor: 'game finished check' stamp: 'jg 5/22/2018 12:51:23'!
hasCompletedColumn: positions
	
	^ (1 to: 3) anySatisfy: [ :y | (positions count: [ :position | position y = y ]) = 3 ]! !

!TicTacToe methodsFor: 'game finished check' stamp: 'jg 5/22/2018 12:36:01'!
hasCompletedRow: positions

	^ (1 to: 3) anySatisfy: [ :x | (positions count: [ :posicion | posicion x = x ]) = 3 ]! !

!TicTacToe methodsFor: 'game finished check' stamp: 'jg 5/22/2018 12:56:21'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]
! !

!TicTacToe methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:34:18'!
hasOWon
	^ state hasOWon.! !

!TicTacToe methodsFor: 'game finished check' stamp: 'jg 5/22/2018 13:02:13'!
hasUpDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:46:01'!
hasWinningPlay: positions
	^ (self hasCompletedRow: positions) or: [
		(self hasCompletedColumn: positions) or: [
			(self hasDownDiagonal: positions) or: [ self hasUpDiagonal: positions ]]].! !

!TicTacToe methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:37:10'!
hasXWon
	^ state hasXWon.! !

!TicTacToe methodsFor: 'game finished check' stamp: 'LVR 5/28/2018 21:19:47'!
isOver
	
	^state isGameOver
! !

!TicTacToe methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:48:52'!
isTied

	^state isGameTied! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToe!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'error message' stamp: 'jg 5/22/2018 13:15:31'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'error message' stamp: 'LVR 5/25/2018 17:30:00'!
notOTurnErrorMessage

	^'Not O turn'! !

!TicTacToe class methodsFor: 'error message' stamp: 'LREV 5/30/2018 17:42:32'!
notValidPositionErrorMessage
	^'La posicion elegida no es valida'! !

!TicTacToe class methodsFor: 'error message' stamp: 'jg 5/22/2018 10:26:38'!
notXTurnErrorMessage

	^'Not X turn'! !

!TicTacToe class methodsFor: 'error message' stamp: 'LVR 5/30/2018 00:05:11'!
positionTakenErrorMessage
	
	^'Position taken or outside the board'! !


!classDefinition: #TicTacToeState category: #TicTacToe!
Object subclass: #TicTacToeState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:34:18'!
hasOWon
	self subclassResponsibility.! !

!TicTacToeState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:37:09'!
hasXWon
	self subclassResponsibility.! !

!TicTacToeState methodsFor: 'game finished check' stamp: 'LVR 5/25/2018 17:46:18'!
isGameOver
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:47:18'!
isGameTied
	self subclassResponsibility ! !


!TicTacToeState methodsFor: 'playing' stamp: 'LVR 5/25/2018 17:23:34'!
markWithOAt: aPosition.
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'playing' stamp: 'LVR 5/25/2018 17:23:21'!
markWithXAt: aPosition.
	self subclassResponsibility! !


!TicTacToeState methodsFor: 'initialization' stamp: 'LREV 5/31/2018 00:33:25'!
initializeFor: aTicTacToe 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeState class' category: #TicTacToe!
TicTacToeState class
	instanceVariableNames: ''!

!TicTacToeState class methodsFor: 'initialization' stamp: 'LREV 5/31/2018 00:33:33'!
for: aTicTacToe 
	
	self subclassResponsibility ! !


!classDefinition: #TicTacToeGameOverState category: #TicTacToe!
TicTacToeState subclass: #TicTacToeGameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeGameOverState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:34:18'!
hasOWon
	self subclassResponsibility.! !

!TicTacToeGameOverState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:37:09'!
hasXWon
	self subclassResponsibility.! !

!TicTacToeGameOverState methodsFor: 'game finished check' stamp: 'LVR 5/28/2018 21:21:04'!
isGameOver
 	self subclassResponsibility
! !

!TicTacToeGameOverState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:47:38'!
isGameTied
	self subclassResponsibility ! !


!TicTacToeGameOverState methodsFor: 'playing' stamp: 'LREV 5/30/2018 23:51:20'!
markWithOAt: aPosition

	self subclassResponsibility.! !

!TicTacToeGameOverState methodsFor: 'playing' stamp: 'LVR 5/28/2018 21:23:34'!
markWithXAt: aPosition.
	self subclassResponsibility ! !


!TicTacToeGameOverState methodsFor: 'initialization' stamp: 'LREV 5/31/2018 00:32:52'!
initializeFor: aTicTacToe 
	
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeGameOverState class' category: #TicTacToe!
TicTacToeGameOverState class
	instanceVariableNames: ''!

!TicTacToeGameOverState class methodsFor: 'initialization' stamp: 'LREV 5/31/2018 00:32:41'!
for: aTicTacToe 
	
	self subclassResponsibility ! !


!classDefinition: #TicTacToeOWonState category: #TicTacToe!
TicTacToeGameOverState subclass: #TicTacToeOWonState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeOWonState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:34:18'!
hasOWon
	^ true.! !

!TicTacToeOWonState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:37:09'!
hasXWon
	^ false.! !

!TicTacToeOWonState methodsFor: 'game finished check' stamp: 'LVR 5/28/2018 19:17:44'!
isGameOver
 	^true! !

!TicTacToeOWonState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:47:57'!
isGameTied
	^false! !


!TicTacToeOWonState methodsFor: 'playing' stamp: 'LREV 5/30/2018 23:52:03'!
markWithOAt: aPosition
	^ game gameOverError.! !

!TicTacToeOWonState methodsFor: 'playing' stamp: 'LREV 5/30/2018 23:52:08'!
markWithXAt: aPosition
	^ game gameOverError.! !


!TicTacToeOWonState methodsFor: 'initialization' stamp: 'LREV 5/31/2018 00:30:04'!
initializeFor: aTicTacToe 
	game:= aTicTacToe ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeOWonState class' category: #TicTacToe!
TicTacToeOWonState class
	instanceVariableNames: ''!

!TicTacToeOWonState class methodsFor: 'initialization' stamp: 'LREV 5/31/2018 00:31:55'!
for: aTicTacToe 
	^self new initializeFor: aTicTacToe ! !


!classDefinition: #TicTacToeTiedState category: #TicTacToe!
TicTacToeGameOverState subclass: #TicTacToeTiedState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeTiedState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:34:17'!
hasOWon
	^ false.! !

!TicTacToeTiedState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:37:09'!
hasXWon
	^ false.! !

!TicTacToeTiedState methodsFor: 'game finished check' stamp: 'LVR 5/28/2018 19:17:54'!
isGameOver
 	^true! !

!TicTacToeTiedState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:48:09'!
isGameTied
	^true! !


!TicTacToeTiedState methodsFor: 'playing' stamp: 'LREV 5/30/2018 23:54:00'!
markWithOAt: aPosition
	^ game gameOverError.! !

!TicTacToeTiedState methodsFor: 'playing' stamp: 'LREV 5/30/2018 23:54:06'!
markWithXAt: aPosition
	^ game gameOverError.! !


!TicTacToeTiedState methodsFor: 'initialization' stamp: 'LREV 5/31/2018 00:30:13'!
initializeFor: aTicTacToe 
	game:= aTicTacToe ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeTiedState class' category: #TicTacToe!
TicTacToeTiedState class
	instanceVariableNames: ''!

!TicTacToeTiedState class methodsFor: 'initialization' stamp: 'LREV 5/31/2018 00:32:07'!
for: aTicTacToe 
	^self new initializeFor: aTicTacToe ! !


!classDefinition: #TicTacToeXWonState category: #TicTacToe!
TicTacToeGameOverState subclass: #TicTacToeXWonState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeXWonState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:34:17'!
hasOWon
	^ false.! !

!TicTacToeXWonState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:37:09'!
hasXWon
	^ true.! !

!TicTacToeXWonState methodsFor: 'game finished check' stamp: 'LVR 5/28/2018 19:10:29'!
isGameOver
 	^true! !

!TicTacToeXWonState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:48:27'!
isGameTied
	^false! !


!TicTacToeXWonState methodsFor: 'playing' stamp: 'LREV 5/30/2018 23:54:28'!
markWithOAt: aPosition
	^ game gameOverError.! !

!TicTacToeXWonState methodsFor: 'playing' stamp: 'LREV 5/30/2018 23:54:33'!
markWithXAt: aPosition
	^ game gameOverError.! !


!TicTacToeXWonState methodsFor: 'initialization' stamp: 'LREV 5/31/2018 00:30:26'!
initializeFor: aTicTacToe 
	game:= aTicTacToe ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeXWonState class' category: #TicTacToe!
TicTacToeXWonState class
	instanceVariableNames: ''!

!TicTacToeXWonState class methodsFor: 'initialization' stamp: 'LREV 5/31/2018 00:32:20'!
for: aTicTacToe 
	^self new initializeFor: aTicTacToe ! !


!classDefinition: #TicTacToeOTurnState category: #TicTacToe!
TicTacToeState subclass: #TicTacToeOTurnState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeOTurnState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:34:18'!
hasOWon
	^ false.! !

!TicTacToeOTurnState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:37:09'!
hasXWon
	^ false.! !

!TicTacToeOTurnState methodsFor: 'game finished check' stamp: 'LVR 5/25/2018 17:47:21'!
isGameOver
	^false! !

!TicTacToeOTurnState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:47:47'!
isGameTied
	^false! !


!TicTacToeOTurnState methodsFor: 'playing' stamp: 'LVR 5/28/2018 21:31:50'!
markWithOAt: aPosition.
	^game markOIn: aPosition.! !

!TicTacToeOTurnState methodsFor: 'playing' stamp: 'LREV 5/30/2018 23:51:51'!
markWithXAt: aPosition
	^game notXTurnError.! !


!TicTacToeOTurnState methodsFor: 'initialization' stamp: 'LREV 5/31/2018 00:29:56'!
initializeFor: aTicTacToe 
	game:= aTicTacToe ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeOTurnState class' category: #TicTacToe!
TicTacToeOTurnState class
	instanceVariableNames: ''!

!TicTacToeOTurnState class methodsFor: 'initialization' stamp: 'LREV 5/31/2018 00:31:48'!
for: aTicTacToe 
	^self new initializeFor: aTicTacToe ! !


!classDefinition: #TicTacToeXTurnState category: #TicTacToe!
TicTacToeState subclass: #TicTacToeXTurnState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeXTurnState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:34:15'!
hasOWon
	^ false.! !

!TicTacToeXTurnState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:37:09'!
hasXWon
	^ false.! !

!TicTacToeXTurnState methodsFor: 'game finished check' stamp: 'LVR 5/25/2018 17:47:31'!
isGameOver
	^false! !

!TicTacToeXTurnState methodsFor: 'game finished check' stamp: 'LREV 5/30/2018 23:48:18'!
isGameTied
	^false! !


!TicTacToeXTurnState methodsFor: 'playing' stamp: 'LREV 5/30/2018 23:54:15'!
markWithOAt: aPosition
	^ game notOTurnError.! !

!TicTacToeXTurnState methodsFor: 'playing' stamp: 'LVR 5/28/2018 21:32:57'!
markWithXAt: aPosition.
	^game markXIn: aPosition.! !


!TicTacToeXTurnState methodsFor: 'initialization' stamp: 'LREV 5/31/2018 00:30:19'!
initializeFor: aTicTacToe 
	game:= aTicTacToe ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeXTurnState class' category: #TicTacToe!
TicTacToeXTurnState class
	instanceVariableNames: ''!

!TicTacToeXTurnState class methodsFor: 'initialization' stamp: 'LREV 5/31/2018 00:32:14'!
for: aTicTacToe 
	^self new initializeFor: aTicTacToe ! !
