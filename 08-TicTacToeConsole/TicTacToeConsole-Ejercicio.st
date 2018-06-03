!classDefinition: #TicTacToeConsoleTest category: #TicTacToe!
TestCase subclass: #TicTacToeConsoleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'LREV 6/3/2018 17:52:44'!
test01ConsoleShowsFirstPlayForXAndStateForNextPlayerO

	|game console logResult|
	
	game := TicTacToe new.
	
	console := TicTacToeConsole for: game.

	game markWithXAt: 2@2.
	
	logResult := OrderedCollection with: 'X marcó en 2@2' with: 'Estado: Jugando O'.
	
	self assert: console gameLog = logResult.! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'LREV 6/3/2018 17:52:58'!
test02ConsoleShowsFirstPlayForOAndStateForNextPlayerX

	|game console logResult|
	
	game := TicTacToe new.
	
	console := TicTacToeConsole for: game.

	game markWithXAt: 2@2.
	game markWithOAt: 1@1.

	logResult := OrderedCollection with: 'X marcó en 2@2' with: 'Estado: Jugando O'.
	logResult add: 'O marcó en 1@1'.
	logResult add: 'Estado: Jugando X'.
	self assert: console gameLog = logResult.! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'LREV 6/3/2018 17:53:16'!
test03ConsoleCanShowMoreThanOnePlayForXandStateForNextPlayerO

	|game console logResult|
	
	game := TicTacToe new.
	
	console := TicTacToeConsole for: game.

	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	game markWithXAt: 1@3.

	logResult := OrderedCollection with: 'X marcó en 2@2' with: 'Estado: Jugando O'.
	logResult add: 'O marcó en 1@1'.
	logResult add: 'Estado: Jugando X'.
	logResult add: 'X marcó en 1@3'.
	logResult add: 'Estado: Jugando O'.

	self assert: console gameLog = logResult.! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'LREV 6/3/2018 17:53:29'!
test04ConsoleShowsAllPlaysWhenXWinsAndStateForXWon

	|game console logResult|
	
	game := TicTacToe new.
	
	console := TicTacToeConsole for: game.

	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	game markWithXAt: 1@3.
	game markWithOAt: 1@2.
	game markWithXAt: 3@1.

	logResult := OrderedCollection with: 'X marcó en 2@2' with: 'Estado: Jugando O'.
	logResult add: 'O marcó en 1@1'.
	logResult add: 'Estado: Jugando X'.
	logResult add: 'X marcó en 1@3'.
	logResult add: 'Estado: Jugando O'.
	logResult add: 'O marcó en 1@2'.
	logResult add: 'Estado: Jugando X'.
	logResult add: 'X marcó en 3@1'.
	logResult add: 'Estado: Juego terminado - Ganó X!!!!'.

	self assert: console gameLog = logResult.! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'LREV 6/3/2018 17:53:42'!
test05ConsoleShowsAllPlaysWhenOWinsAndStateForOWon

	|game console logResult|
	
	game := TicTacToe new.
	
	console := TicTacToeConsole for: game.

	game markWithXAt: 1@3.
	game markWithOAt: 1@1.
	game markWithXAt: 2@1.
	game markWithOAt: 2@2.
	game markWithXAt: 3@1.
	game markWithOAt: 3@3.

	logResult := OrderedCollection with: 'X marcó en 1@3' with: 'Estado: Jugando O'.
	logResult add: 'O marcó en 1@1'.
	logResult add: 'Estado: Jugando X'.
	logResult add: 'X marcó en 2@1'.
	logResult add: 'Estado: Jugando O'.
	logResult add: 'O marcó en 2@2'.
	logResult add: 'Estado: Jugando X'.
	logResult add: 'X marcó en 3@1'.
	logResult add: 'Estado: Jugando O'.
	logResult add: 'O marcó en 3@3'.
	logResult add: 'Estado: Juego terminado - Ganó O!!!!'.

	self assert: console gameLog = logResult.! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'LREV 6/3/2018 17:53:52'!
test06ConsoleShowsAllPlaysWhenGameIsTiedAndStateForGameTied

	|game console logResult|
	
	game := TicTacToe new.
	
	console := TicTacToeConsole for: game.

	game markWithXAt: 1@3.
	game markWithOAt: 1@1.
	game markWithXAt: 2@1.
	game markWithOAt: 2@2.
	game markWithXAt: 3@1.
	game markWithOAt: 3@2.
	game markWithXAt: 3@3.
	game markWithOAt: 2@3.
	game markWithXAt: 1@2.
	
	logResult := OrderedCollection with: 'X marcó en 1@3' with: 'Estado: Jugando O'.
	logResult add: 'O marcó en 1@1'.
	logResult add: 'Estado: Jugando X'.
	logResult add: 'X marcó en 2@1'.
	logResult add: 'Estado: Jugando O'.
	logResult add: 'O marcó en 2@2'.
	logResult add: 'Estado: Jugando X'.
	logResult add: 'X marcó en 3@1'.
	logResult add: 'Estado: Jugando O'.
	logResult add: 'O marcó en 3@2'.
	logResult add: 'Estado: Jugando X'.
	logResult add: 'X marcó en 3@3'.
	logResult add: 'Estado: Jugando O'.
	logResult add: 'O marcó en 2@3'.
	logResult add: 'Estado: Jugando X'.
	logResult add: 'X marcó en 1@2'.
	logResult add: 'Estado: Juego terminado - Empate!!!!'.

	self assert: console gameLog = logResult.! !

!TicTacToeConsoleTest methodsFor: 'testing' stamp: 'LREV 6/3/2018 16:39:17'!
test07ConsoleDoesntShowPlaysAfterDetaching

	|game console logResult|
	
	game := TicTacToe new.
	
	console := TicTacToeConsole for: game.

	game markWithXAt: 2@2.
	
	console detach.
	
	game markWithOAt: 1@1.
	
	logResult := OrderedCollection with: 'X marcó en 2@2' with: 'Estado: Jugando O'.
	
	self assert: console gameLog = logResult.! !


!classDefinition: #TicTacToeObserverTest category: #TicTacToe!
TestCase subclass: #TicTacToeObserverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeObserverTest methodsFor: 'Testing' stamp: 'LREV 6/2/2018 23:46:02'!
test01aTicTacToeCanHaveMoreThanOneConsoleObserving

	|game console1 console2 logResult|
	
	game := TicTacToe new.
	
	console1 := TicTacToeConsole for: game.
	console2 := TicTacToeConsole for: game.

	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	game markWithXAt: 1@3.

	logResult := OrderedCollection with: 'X marcó en 2@2' with: 'Estado: Jugando O'.
	logResult add: 'O marcó en 1@1'.
	logResult add: 'Estado: Jugando X'.
	logResult add: 'X marcó en 1@3'.
	logResult add: 'Estado: Jugando O'.

	self assert: console1 gameLog = logResult.
	self assert: console2 gameLog = logResult.! !

!TicTacToeObserverTest methodsFor: 'Testing' stamp: 'LREV 6/2/2018 23:51:01'!
test02aTicTacToeCanHaveMoreThanAViewObserving
	| game interface1 interface2 |

	game _ TicTacToe new.

	interface1 _ TicTacToeView for: game.
	interface2 _ TicTacToeView for: game.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 1 @ 3.


	self assert: (interface1 printTicTacToe at: 1) asArray = #('X' '|' ' ' '|' ' ').
	self assert: (interface1 printTicTacToe at: 2) = '-----'.
	self assert: (interface1 printTicTacToe at: 3) asArray = #(' ' '|' 'X' '|' ' ').
	self assert: (interface1 printTicTacToe at: 4) = '-----'.
	self assert: (interface1 printTicTacToe at: 5) asArray = #('O' '|' ' ' '|' ' ').
	self assert: (interface1 printTicTacToe at: 6) = 'Playing O'.
	
	self assert: (interface2 printTicTacToe at: 1) asArray = #('X' '|' ' ' '|' ' ').
	self assert: (interface2 printTicTacToe at: 2) = '-----'.
	self assert: (interface2 printTicTacToe at: 3) asArray = #(' ' '|' 'X' '|' ' ').
	self assert: (interface2 printTicTacToe at: 4) = '-----'.
	self assert: (interface2 printTicTacToe at: 5) asArray = #('O' '|' ' ' '|' ' ').
	self assert: (interface2 printTicTacToe at: 6) = 'Playing O'.! !

!TicTacToeObserverTest methodsFor: 'Testing' stamp: 'LREV 6/2/2018 23:58:44'!
test03aTicTacToeCanHaveAConsoleAndAViewObserving
	| game console interface logResult |
	game _ TicTacToe new.
	console _ TicTacToeConsole for: game.
	interface _ TicTacToeView for: game.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 1 @ 3.
	logResult _ OrderedCollection
		with: 'X marcó en 2@2'
		with: 'Estado: Jugando O'.
	logResult add: 'O marcó en 1@1'.
	logResult add: 'Estado: Jugando X'.
	logResult add: 'X marcó en 1@3'.
	logResult add: 'Estado: Jugando O'.
	self assert: console gameLog = logResult.
	self assert: (interface printTicTacToe at: 1) asArray = #('X' '|' ' ' '|' ' ' ).
	self assert: (interface printTicTacToe at: 2) = '-----'.
	self assert: (interface printTicTacToe at: 3) asArray = #(' ' '|' 'X' '|' ' ' ).
	self assert: (interface printTicTacToe at: 4) = '-----'.
	self assert: (interface printTicTacToe at: 5) asArray = #('O' '|' ' ' '|' ' ' ).
	self assert: (interface printTicTacToe at: 6) = 'Playing O'.! !

!TicTacToeObserverTest methodsFor: 'Testing' stamp: 'LREV 6/2/2018 23:59:07'!
test04aConsoleCanObserveAStartedTicTacToe
	| game console logResult |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	console _ TicTacToeConsole for: game.
	game markWithXAt: 1 @ 3.
	logResult _ OrderedCollection
		with: 'X marcó en 1@3'
		with: 'Estado: Jugando O'.
	self assert: console gameLog = logResult.! !

!TicTacToeObserverTest methodsFor: 'Testing' stamp: 'LREV 6/2/2018 23:59:23'!
test05aViewCanObserveAStartedTicTacToe
	| game interface |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	interface _ TicTacToeView for: game.
	game markWithXAt: 1 @ 3.
	self assert: (interface printTicTacToe at: 1) asArray = #('X' '|' ' ' '|' ' ' ).
	self assert: (interface printTicTacToe at: 2) = '-----'.
	self assert: (interface printTicTacToe at: 3) asArray = #(' ' '|' ' ' '|' ' ' ).
	self assert: (interface printTicTacToe at: 4) = '-----'.
	self assert: (interface printTicTacToe at: 5) asArray = #(' ' '|' ' ' '|' ' ' ).
	self assert: (interface printTicTacToe at: 6) = 'Playing O'.! !

!TicTacToeObserverTest methodsFor: 'Testing' stamp: 'LREV 6/3/2018 14:23:44'!
test06TwoConsolesAddedAtDifferentTimesHaveDifferentLogs

	|game console1 console2 logResult1 logResult2|
	
	game := TicTacToe new.
	
	console1 := TicTacToeConsole for: game.

	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	
	console2 := TicTacToeConsole for: game.
	
	game markWithXAt: 1@3.

	
	logResult1 := OrderedCollection with: 'X marcó en 2@2' with: 'Estado: Jugando O'.
	logResult1 add: 'O marcó en 1@1'.
	logResult1 add: 'Estado: Jugando X'.
	logResult1 add: 'X marcó en 1@3'.
	logResult1 add: 'Estado: Jugando O'.
	logResult2 := OrderedCollection with: 'X marcó en 1@3' with: 'Estado: Jugando O'.

	self assert: console1 gameLog = logResult1.
	self assert: console2 gameLog = logResult2.! !

!TicTacToeObserverTest methodsFor: 'Testing' stamp: 'LREV 6/3/2018 14:25:25'!
test07TwoViewsAddedAtDifferentTimesHaveDifferentBoards
	| game interface1 interface2 |
	game _ TicTacToe new.
	interface1 _ TicTacToeView for: game.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	interface2 _ TicTacToeView for: game.
	game markWithXAt: 1 @ 3.
	self assert: (interface1 printTicTacToe at: 1) asArray = #('X' '|' ' ' '|' ' ' ).
	self assert: (interface1 printTicTacToe at: 2) = '-----'.
	self assert: (interface1 printTicTacToe at: 3) asArray = #(' ' '|' 'X' '|' ' ' ).
	self assert: (interface1 printTicTacToe at: 4) = '-----'.
	self assert: (interface1 printTicTacToe at: 5) asArray = #('O' '|' ' ' '|' ' ' ).
	self assert: (interface1 printTicTacToe at: 6) = 'Playing O'.
	self assert: (interface2 printTicTacToe at: 1) asArray = #('X' '|' ' ' '|' ' ' ).
	self assert: (interface2 printTicTacToe at: 2) = '-----'.
	self assert: (interface2 printTicTacToe at: 3) asArray = #(' ' '|' ' ' '|' ' ' ).
	self assert: (interface2 printTicTacToe at: 4) = '-----'.
	self assert: (interface2 printTicTacToe at: 5) asArray = #(' ' '|' ' ' '|' ' ' ).
	self assert: (interface2 printTicTacToe at: 6) = 'Playing O'.! !

!TicTacToeObserverTest methodsFor: 'Testing' stamp: 'LREV 6/3/2018 16:43:49'!
test08aTicTacToeCanRemoveAnObserverAndKeepTheOthers
	| game interface1 interface2 |

	game _ TicTacToe new.

	interface1 _ TicTacToeView for: game.
	interface2 _ TicTacToeView for: game.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	interface1 detach.
	game markWithXAt: 1 @ 3.


	self assert: (interface1 printTicTacToe at: 1) asArray = #(' ' '|' ' ' '|' ' ').
	self assert: (interface1 printTicTacToe at: 2) = '-----'.
	self assert: (interface1 printTicTacToe at: 3) asArray = #(' ' '|' 'X' '|' ' ').
	self assert: (interface1 printTicTacToe at: 4) = '-----'.
	self assert: (interface1 printTicTacToe at: 5) asArray = #('O' '|' ' ' '|' ' ').
	self assert: (interface1 printTicTacToe at: 6) = 'Playing X'.
	
	self assert: (interface2 printTicTacToe at: 1) asArray = #('X' '|' ' ' '|' ' ').
	self assert: (interface2 printTicTacToe at: 2) = '-----'.
	self assert: (interface2 printTicTacToe at: 3) asArray = #(' ' '|' 'X' '|' ' ').
	self assert: (interface2 printTicTacToe at: 4) = '-----'.
	self assert: (interface2 printTicTacToe at: 5) asArray = #('O' '|' ' ' '|' ' ').
	self assert: (interface2 printTicTacToe at: 6) = 'Playing O'.! !


!classDefinition: #TicTacToeTest category: #TicTacToe!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 10/27/2017 17:25:54'!
functionalException

	^Error - MessageNotUnderstood! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 10/26/2017 15:10:54'!
test01GameStartsWithAnEmptyBoarAndPlayingX

	"I initialize it on each test and not in the setUp to facilitate the restar of the test - Hernan"
	
	game _ TicTacToe new.

	self assertXIsMarkedOn: {} andOOn: {}.
	self assertIsPlayingX.
	
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:35'!
test02AfterMarkingWithXGameKeepsMarkAndNextPlayerIsO

	game _ TicTacToe new.
	
	game markAll: {1@1}.

	self assertXIsMarkedOn: {1@1} andOOn: {}.
	self assertIsPlayingO

! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:31'!
test03AfterMarkingWithOGameKeepsMarkAndNextPlayerIsY

	game _ TicTacToe new.

	game markAll: { 1 @ 1. 2 @ 2 }.

	self assertXIsMarkedOn: {1@1} andOOn: {2@2}.
	self assertIsPlayingX.

! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:28'!
test04CanNotMarkWithXWhenLastMarkWasX

	game _ TicTacToe new.
	
	game markAll: { 1@1 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:23'!
test05CanNotMarkWithOWhenLastMarkWasO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithOAt: 3 @ 3 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe notOTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:19'!
test06CanNotMarkWithXAnAlreadyMarkedPositionWithX

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:16'!
test07CanNotMarkWithXAnAlreadyMarkedPositionWithO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:12'!
test08CanNotMarkWithOAnAlreadyMarkedPositionWithX

	game _ TicTacToe new.
	
	game markAll: { 1@1 }.
	
	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:08'!
test09CanNotMarkWithOAnAlreadyMarkedPositionWithO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2. 3@3 }.

	self
		should: [ game markWithOAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1. 3@3} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:04'!
test10XWinsWhenCompletesRowNumber1

	game _ TicTacToe new.

	game markAll: {1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self assertXWon.
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:59'!
test11XWinsWhenCompletesRowNumber2

	game _ TicTacToe new.

	game markAll: {2@1. 1@1. 2@2. 3@1. 2@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:54'!
test12XWinsWhenCompletesRowNumber3

	game _ TicTacToe new.

	game markAll: {3@1. 1@1. 3@2. 2@1. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:50'!
test13XWinsWhenCompletesAColumn

	game _ TicTacToe new.

	game markAll: { 1@1. 2@2. 1@2. 3@3. 1@3}.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:45'!
test14XWinsWhenCompletesDiagonalGoingDown

	game _ TicTacToe new.

	game markAll: { 1@1. 1@2. 2@2. 1@3. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:41'!
test15XWinsWhenCompletesDiagonalGoingUp

	game _ TicTacToe new.

	game markAll: { 1@3. 1@2. 2@2. 2@1. 3@ 1 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:35'!
test16OWinsWhenCompletesARow

	game _ TicTacToe new.

	game markAll: {2@1. 1@1. 2@2. 1@2. 3@1. 1@3 }.

	self assertOWon! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:31'!
test17OWinsWhenCompletesAColumn

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 3@3. 1@2. 2@3. 1@3 }.

	self assertOWon! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:25'!
test18OWinsWhenCompletesDiagonalGoingDown

	game _ TicTacToe new.

	game markAll: { 3@2. 1@3. 1@2. 2@2. 1@1. 3@1 }.

	self assertOWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:20'!
test19OWinsWhenCompletesDiagonalGoingUp

	game _ TicTacToe new.

	game markAll: {1@2. 1@1. 1@3. 2@2. 2@1. 3@3 }.

	self assertOWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:15'!
test20OCanNotPlayWhenXWon

	game _ TicTacToe new.

	game markAll: { 1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self
		should: [ game markWithOAt: 3 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertOIsMarkedOn: {2@1. 3@1} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:12'!
test21XCanNotPlayWhenOWon

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 2@1. 1@2. 3@1. 1@3 }.

	self
		should: [ game markWithXAt: 3 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: { 2@2. 2@1. 3@1 } ]
		! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:08'!
test22GameCanEndUpTied

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self assertGameIsTied! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:01'!
test23XCanWinOnLastEmptyPosition

	game _ TicTacToe new.

	game markAll: { 2@2. 1@2. 1@1. 2@1. 1@3. 2@3. 3@2. 3@1. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:41:58'!
test24CanNotPlayWhenGameIsTied

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'JG 5/12/2018 13:23:11'!
test25CanNotMarkOutsideBoard

	game _ TicTacToe new.

	#(0 4) do: [ :aPositionComponent |
		self assertCanNotMarkAt: aPositionComponent @ 1.
		self assertCanNotMarkAt: 1 @ aPositionComponent ].
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:49:43'!
test26OCanNotMarkWhenGameIsOver

	game _ TicTacToe new.

	game markAll: { 1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self
		should: [ game markAt: 3 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertOIsMarkedOn: {2@1. 3@1} ].! !


!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/27/2017 10:29:06'!
assertCanNotMarkAt: aPosition

	self assertCanNotMarkUsing: [ game markWithXAt: aPosition ].
	self assertCanNotMarkUsing: [ game markWithOAt: aPosition ].
	
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/27/2017 10:29:29'!
assertCanNotMarkUsing: aMarkingClosure

	self
		should: aMarkingClosure 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionOutsideBoardErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:14'!
assertGameIsNotOver

	self deny: game isOver.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:48'!
assertGameIsOver
	
	self assert: game isOver.

	self deny: game isPlayingX.
	self deny: game isPlayingO.
		
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:40:41'!
assertGameIsTied

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self assert: game isTied.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:13:05'!
assertIsPlayingO
	
	self deny: game isPlayingX.
	self assert: game isPlayingO.
	self assertGameIsNotOver ! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:05'!
assertIsPlayingX
		
	self assert: game isPlayingX.
	self deny: game isPlayingO.
	self assertGameIsNotOver.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:38:07'!
assertOIsMarkedOn: oPositions
		
	self assert: oPositions size equals: game playerOPositions size.
	self assert: (game playerOPositions difference: oPositions) isEmpty.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:32:18'!
assertOWon

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self assert: game hasPlayerOWon.
	self deny: game isTied.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:56'!
assertXIsMarkedOn: xPositions

	self assert: xPositions size equals: game playerXPositions size.
	self assert: (game playerXPositions difference: xPositions) isEmpty.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:44'!
assertXIsMarkedOn: xPositions andOOn: oPositions
 
	self assertXIsMarkedOn: xPositions.
	self assertOIsMarkedOn: oPositions.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:30'!
assertXWon
	
	self assertGameIsOver.
	
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.
! !


!classDefinition: #TicTacToeViewTest category: #TicTacToe!
TestCase subclass: #TicTacToeViewTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeViewTest methodsFor: 'Testing' stamp: 'LREV 6/3/2018 00:19:16'!
test01ViewShowsFirstPlayForXAndStateForNextPlayerO
	| game interface |
	game _ TicTacToe new.
	interface _ TicTacToeView for: game.
	game markWithXAt: 2 @ 2.
	self assert: (interface printTicTacToe at: 1) asArray = #(' ' '|' ' ' '|' ' ' ).
	self assert: (interface printTicTacToe at: 2) = '-----'.
	self assert: (interface printTicTacToe at: 3) asArray = #(' ' '|' 'X' '|' ' ' ).
	self assert: (interface printTicTacToe at: 4) = '-----'.
	self assert: (interface printTicTacToe at: 5) asArray = #(' ' '|' ' ' '|' ' ' ).
	self assert: (interface printTicTacToe at: 6) = 'Playing O'.! !

!TicTacToeViewTest methodsFor: 'Testing' stamp: 'LREV 6/3/2018 00:19:57'!
test02ViewShowsFirstPlayForOAndStateForNextPlayerX
	| game interface |
	game _ TicTacToe new.
	interface _ TicTacToeView for: game.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	self assert: (interface printTicTacToe at: 1) asArray = #(' ' '|' ' ' '|' ' ' ).
	self assert: (interface printTicTacToe at: 2) = '-----'.
	self assert: (interface printTicTacToe at: 3) asArray = #(' ' '|' 'X' '|' ' ' ).
	self assert: (interface printTicTacToe at: 4) = '-----'.
	self assert: (interface printTicTacToe at: 5) asArray = #('O' '|' ' ' '|' ' ' ).
	self assert: (interface printTicTacToe at: 6) = 'Playing X'.! !

!TicTacToeViewTest methodsFor: 'Testing' stamp: 'LREV 6/3/2018 00:20:58'!
test03ViewCanShowMoreThanOnePlayForXandStateForNextPlayerO
	| game interface |
	game _ TicTacToe new.
	interface _ TicTacToeView for: game.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 1 @ 3.
	self assert: (interface printTicTacToe at: 1) asArray = #('X' '|' ' ' '|' ' ' ).
	self assert: (interface printTicTacToe at: 2) = '-----'.
	self assert: (interface printTicTacToe at: 3) asArray = #(' ' '|' 'X' '|' ' ' ).
	self assert: (interface printTicTacToe at: 4) = '-----'.
	self assert: (interface printTicTacToe at: 5) asArray = #('O' '|' ' ' '|' ' ' ).
	self assert: (interface printTicTacToe at: 6) = 'Playing O'.! !

!TicTacToeViewTest methodsFor: 'Testing' stamp: 'LREV 6/3/2018 00:22:34'!
test04ViewShowsAllPlaysWhenXWinsAndStateForXWon
	| game interface |
	game _ TicTacToe new.
	interface _ TicTacToeView for: game.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 1 @ 3.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 3 @ 1.
	self assert: (interface printTicTacToe at: 1) asArray = #('X' '|' ' ' '|' ' ' ).
	self assert: (interface printTicTacToe at: 2) = '-----'.
	self assert: (interface printTicTacToe at: 3) asArray = #('O' '|' 'X' '|' ' ' ).
	self assert: (interface printTicTacToe at: 4) = '-----'.
	self assert: (interface printTicTacToe at: 5) asArray = #('O' '|' ' ' '|' 'X' ).
	self assert: (interface printTicTacToe at: 6) = 'X Won!!'.! !

!TicTacToeViewTest methodsFor: 'Testing' stamp: 'LREV 6/3/2018 00:23:15'!
test05ViewShowsAllPlaysWhenOWinsAndStateForOWon
	| game interface |
	game _ TicTacToe new.
	interface _ TicTacToeView for: game.
	game markWithXAt: 1 @ 3.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 2 @ 2.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 3 @ 3.
	self assert: (interface printTicTacToe at: 1) asArray = #('X' '|' ' ' '|' 'O' ).
	self assert: (interface printTicTacToe at: 2) = '-----'.
	self assert: (interface printTicTacToe at: 3) asArray = #(' ' '|' 'O' '|' ' ' ).
	self assert: (interface printTicTacToe at: 4) = '-----'.
	self assert: (interface printTicTacToe at: 5) asArray = #('O' '|' 'X' '|' 'X' ).
	self assert: (interface printTicTacToe at: 6) = 'O Won!!'.! !

!TicTacToeViewTest methodsFor: 'Testing' stamp: 'LREV 6/3/2018 17:25:21'!
test06ViewShowsAllPlaysWhenGameIsTiedAndStateForGameTied
	| game interface |
	game _ TicTacToe new.
	interface _ TicTacToeView for: game.
	game markWithXAt: 1 @ 3.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 2 @ 2.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 3 @ 2.
	game markWithXAt: 3 @ 3.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 1 @ 2.
	self assert: (interface printTicTacToe at: 1) asArray = #('X' '|' 'O' '|' 'X' ).
	self assert: (interface printTicTacToe at: 2) = '-----'.
	self assert: (interface printTicTacToe at: 3) asArray = #('X' '|' 'O' '|' 'O' ).
	self assert: (interface printTicTacToe at: 4) = '-----'.
	self assert: (interface printTicTacToe at: 5) asArray = #('O' '|' 'X' '|' 'X' ).
	self assert: (interface printTicTacToe at: 6) = 'Game Tied!!'.! !

!TicTacToeViewTest methodsFor: 'Testing' stamp: 'LREV 6/3/2018 16:46:41'!
test07ViewDoesntShowPlaysAfterDetaching
	| game interface |
	game _ TicTacToe new.
	interface _ TicTacToeView for: game.
	game markWithXAt: 2 @ 2.
	interface detach.
	game markWithOAt: 1 @ 1.
	self assert: (interface printTicTacToe at: 1) asArray = #(' ' '|' ' ' '|' ' ' ).
	self assert: (interface printTicTacToe at: 2) = '-----'.
	self assert: (interface printTicTacToe at: 3) asArray = #(' ' '|' 'X' '|' ' ' ).
	self assert: (interface printTicTacToe at: 4) = '-----'.
	self assert: (interface printTicTacToe at: 5) asArray = #(' ' '|' ' ' '|' ' ' ).
	self assert: (interface printTicTacToe at: 6) = 'Playing O'.! !


!classDefinition: #TicTacToe category: #TicTacToe!
Object subclass: #TicTacToe
	instanceVariableNames: 'state playerOPositions playerXPositions observers lastPlay'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToe methodsFor: 'initialization' stamp: 'LREV 6/1/2018 19:16:05'!
initialize
	playerXPositions _ OrderedCollection new.
	playerOPositions _ OrderedCollection new.
	observers _ OrderedCollection new.
	state _ PlayingX for: self.! !


!TicTacToe methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:39'!
markAll: positions

	positions do: [ :aPosition | self markAt: aPosition ]! !

!TicTacToe methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:23'!
markAt: aPosition

	^state markAt: aPosition ! !

!TicTacToe methodsFor: 'marking board' stamp: 'HAW 10/27/2017 10:30:17'!
markWithOAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithOAt: aPosition.! !

!TicTacToe methodsFor: 'marking board' stamp: 'HAW 10/27/2017 10:24:49'!
markWithXAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithXAt: aPosition.! !


!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/25/2017 15:41:25'!
add: aPosition to: positions nextPlayerState: nextPlayingState winnerState: winnerState

	positions add: aPosition.
	state := (self stateAfterAddingTo: positions with: nextPlayingState and: winnerState) for: self
	! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/25/2017 15:35:08'!
assertIsFree: aPosition

	(self isTaken: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/27/2017 10:26:10'!
assertIsInBoardBounds: aPosition

	(aPosition between: 1@1 and: 3@3) ifFalse: [ self error: self class positionOutsideBoardErrorMessage ]! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'LREV 6/2/2018 21:23:30'!
markWithOWhenPlayingOAt: aPosition
	self assertIsFree: aPosition.
	lastPlay := aPosition.
	self
		add: aPosition
		to: playerOPositions
		nextPlayerState: PlayingX
		winnerState: PlayerOWon.
	self reportChanges.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOWhenPlayingXAt: aPosition
	self error: self class notOTurnErrorMessage.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXWhenPlayingOAt: aPoint
	self error: self class notXTurnErrorMessage.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'LREV 6/2/2018 21:23:26'!
markWithXWhenPlayingXAt: aPosition
	self assertIsFree: aPosition.
	lastPlay := aPosition.
	self
		add: aPosition
		to: playerXPositions
		nextPlayerState: PlayingO
		winnerState: PlayerXWon.
		
	self reportChanges.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:44:57'!
stateAfterAddingTo: positions with: nextPlayingState and: winnerState

	(self hasWin: positions) ifTrue: [ ^ winnerState ].
	self shouldBeTiedWhenNoOneWon ifTrue: [ ^ GameTied ].

	^ nextPlayingState.! !


!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ state hasPlayerOWon.! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ state hasPlayerXWon.! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 13:32:14'!
isOver
	
	^state isOver! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:01'!
isTied
	
	^ state isTied! !


!TicTacToe methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:38'!
isPlayingO
	
	^state isPlayingO! !

!TicTacToe methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:14'!
isPlayingX
	
	^state isPlayingX ! !


!TicTacToe methodsFor: 'testing board positions' stamp: 'HAW 10/25/2017 15:50:52'!
isTaken: aPosition
	^ (playerXPositions includes: aPosition) or: [ playerOPositions includes: aPosition ].! !


!TicTacToe methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:16'!
playerOPositions
	^ playerOPositions copy.! !

!TicTacToe methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:32'!
playerXPositions
	^ playerXPositions copy.! !


!TicTacToe methodsFor: 'observing' stamp: 'LREV 6/1/2018 19:20:37'!
addObserver: anObserverForTicTacToe

	observers add: anObserverForTicTacToe! !

!TicTacToe methodsFor: 'observing' stamp: 'LREV 6/3/2018 17:16:13'!
removeObserver: anObserverForTicTacToe

	observers remove: anObserverForTicTacToe! !

!TicTacToe methodsFor: 'observing' stamp: 'LREV 6/3/2018 17:06:49'!
reportChanges
	observers do: [ :observer |
		observer update ].! !


!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:22:42'!
has: positions threeOf: aPositionComponent

	^(positions collect: aPositionComponent) asBag contents values includes: 3 
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:09:34'!
hasCompletedColumn: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition x ]
	
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:25:55'!
hasCompletedDiagonal: positions 
	
	^(self hasUpDiagonal: positions) or: [self hasDownDiagonal: positions]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:10:47'!
hasCompletedLine: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition y ]
! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 5/31/2018 00:25:48'!
hasCompletedStraightLine: positions
	
	^(self hasCompletedColumn: positions) or: [self hasCompletedLine: positions ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/24/2017 17:12:48'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/24/2017 17:12:48'!
hasUpDiagonal: positions
	
	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:26:17'!
hasWin: positions

	^positions size >= 3 and: [ (self hasCompletedStraightLine: positions) or: [ self hasCompletedDiagonal: positions ]].
		
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:44:42'!
shouldBeTiedWhenNoOneWon

	^ playerXPositions size = 5 and: [ playerOPositions size = 4 ].! !


!TicTacToe methodsFor: 'current state' stamp: 'LREV 6/2/2018 22:02:31'!
gameState
	^ state copy! !

!TicTacToe methodsFor: 'current state' stamp: 'LREV 6/2/2018 21:22:16'!
lastPlay
	^ lastPlay copy! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToe!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notOTurnErrorMessage
	
	^'Not O''s turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notXTurnErrorMessage
	
	^'Not X''s turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/27/2017 10:26:31'!
positionOutsideBoardErrorMessage
	
	^'Position is outside board'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
positionTakenErrorMessage
	
	^'Position taken'! !


!classDefinition: #TicTacToeObserver category: #TicTacToe!
Object subclass: #TicTacToeObserver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeObserver methodsFor: 'visiting' stamp: 'LREV 6/2/2018 23:31:52'!
visitGameTied
	self subclassResponsibility ! !

!TicTacToeObserver methodsFor: 'visiting' stamp: 'LREV 6/2/2018 23:32:09'!
visitPlayerOWon
	self subclassResponsibility ! !

!TicTacToeObserver methodsFor: 'visiting' stamp: 'LREV 6/2/2018 23:32:05'!
visitPlayerXWon
	self subclassResponsibility ! !

!TicTacToeObserver methodsFor: 'visiting' stamp: 'LREV 6/2/2018 23:32:01'!
visitPlayingO
	self subclassResponsibility ! !

!TicTacToeObserver methodsFor: 'visiting' stamp: 'LREV 6/2/2018 23:31:59'!
visitPlayingX
	self subclassResponsibility ! !


!TicTacToeObserver methodsFor: 'evaluating' stamp: 'LREV 6/3/2018 17:21:28'!
update
	self subclassResponsibility! !


!TicTacToeObserver methodsFor: 'initialization' stamp: 'LREV 6/2/2018 23:31:11'!
for: aTicTacToe
	self subclassResponsibility ! !


!TicTacToeObserver methodsFor: 'detaching' stamp: 'LREV 6/3/2018 17:55:08'!
detach

	self subclassResponsibility ! !


!classDefinition: #TicTacToeConsole category: #TicTacToe!
TicTacToeObserver subclass: #TicTacToeConsole
	instanceVariableNames: 'game log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeConsole methodsFor: 'initialization' stamp: 'LREV 6/1/2018 19:23:26'!
for: aTicTacToe 
	game := aTicTacToe.
	aTicTacToe addObserver: self.
	log := OrderedCollection new
	! !


!TicTacToeConsole methodsFor: 'printing' stamp: 'LREV 6/1/2018 19:13:50'!
gameLog
	^ log! !

!TicTacToeConsole methodsFor: 'printing' stamp: 'LREV 6/2/2018 22:40:31'!
markLastPlayFor: aStringMarkForLastPlayer

		log add: aStringMarkForLastPlayer, ' marcó en ', game lastPlay printString.
! !

!TicTacToeConsole methodsFor: 'printing' stamp: 'LREV 6/2/2018 22:38:23'!
markStateFor: aStringForActualState

		log add: 'Estado: ', aStringForActualState 
! !


!TicTacToeConsole methodsFor: 'visiting' stamp: 'LREV 6/2/2018 22:39:12'!
visitGameTied
		self markLastPlayFor: 'X'.
		self markStateFor: 'Juego terminado - Empate!!!!'! !

!TicTacToeConsole methodsFor: 'visiting' stamp: 'LREV 6/2/2018 22:39:28'!
visitPlayerOWon
		self markLastPlayFor: 'O'.
		self markStateFor: 'Juego terminado - Ganó O!!!!'.! !

!TicTacToeConsole methodsFor: 'visiting' stamp: 'LREV 6/2/2018 22:39:42'!
visitPlayerXWon
		self markLastPlayFor: 'X'.
		self markStateFor: 'Juego terminado - Ganó X!!!!'.! !

!TicTacToeConsole methodsFor: 'visiting' stamp: 'LREV 6/2/2018 22:39:51'!
visitPlayingO
		self markLastPlayFor: 'X'.
		self markStateFor: 'Jugando O'.! !

!TicTacToeConsole methodsFor: 'visiting' stamp: 'LREV 6/2/2018 22:40:02'!
visitPlayingX
		self markLastPlayFor: 'O'.
		self markStateFor: 'Jugando X'.! !


!TicTacToeConsole methodsFor: 'evaluating' stamp: 'LREV 6/3/2018 17:06:46'!
update
	game gameState accept: self.! !


!TicTacToeConsole methodsFor: 'detaching' stamp: 'LREV 6/3/2018 16:35:56'!
detach

	game removeObserver:  self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeConsole class' category: #TicTacToe!
TicTacToeConsole class
	instanceVariableNames: ''!

!TicTacToeConsole class methodsFor: 'instance creation' stamp: 'LREV 6/1/2018 19:12:38'!
for: aTicTacToe 
	^self new for: aTicTacToe ! !


!classDefinition: #TicTacToeView category: #TicTacToe!
TicTacToeObserver subclass: #TicTacToeView
	instanceVariableNames: 'game actualState board'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeView methodsFor: 'printing' stamp: 'LREV 6/2/2018 22:27:29'!
markLastPlay: aStringMarkForThePlayer
	|row column|
	row := 4 - game lastPlay y.
	column := game lastPlay x.
	(board at: row) at: column put: aStringMarkForThePlayer.
! !

!TicTacToeView methodsFor: 'printing' stamp: 'LREV 6/3/2018 16:48:56'!
printTicTacToe
	|linesToPrint|
	
	linesToPrint := OrderedCollection new.
	board do: [:row | 
				linesToPrint add: (OrderedCollection with: (row at: 1) with: '|' with: (row at: 2) with: '|' with: (row at: 3)).
				linesToPrint add: '-----'.
				].
	linesToPrint removeLast.
	linesToPrint add: actualState.
	
	^linesToPrint 
	! !


!TicTacToeView methodsFor: 'initialization' stamp: 'LREV 6/2/2018 22:26:58'!
for: aTicTacToe 
	|row1 row2 row3|
	game := aTicTacToe.
	aTicTacToe addObserver: self.
	board := OrderedCollection new.
	row1 := Array with: ' ' with: ' ' with: ' '.
	row2 := Array with: ' ' with: ' ' with: ' '.
	row3 := Array with: ' ' with: ' ' with: ' '.
	board add: row1.
	board add: row2.
	board add: row3.! !


!TicTacToeView methodsFor: 'evaluating' stamp: 'LREV 6/3/2018 17:06:48'!
update
	game gameState accept: self.! !


!TicTacToeView methodsFor: 'visiting' stamp: 'LREV 6/3/2018 17:24:01'!
visitGameTied

	self markLastPlay: 'X'.
	actualState := 'Game Tied!!'.! !

!TicTacToeView methodsFor: 'visiting' stamp: 'LREV 6/3/2018 17:22:53'!
visitPlayerOWon
	
	self markLastPlay: 'O'.
	actualState := 'O Won!!'.! !

!TicTacToeView methodsFor: 'visiting' stamp: 'LREV 6/3/2018 17:23:01'!
visitPlayerXWon
	
	self markLastPlay: 'X'.
	actualState := 'X Won!!'.! !

!TicTacToeView methodsFor: 'visiting' stamp: 'LREV 6/3/2018 17:24:11'!
visitPlayingO

	self markLastPlay: 'X'.
	actualState := 'Playing O'.! !

!TicTacToeView methodsFor: 'visiting' stamp: 'LREV 6/3/2018 17:24:17'!
visitPlayingX

	self markLastPlay: 'O'.
	actualState := 'Playing X'.! !


!TicTacToeView methodsFor: 'detaching' stamp: 'LREV 6/3/2018 16:44:44'!
detach

	game removeObserver: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeView class' category: #TicTacToe!
TicTacToeView class
	instanceVariableNames: ''!

!TicTacToeView class methodsFor: 'instance creation' stamp: 'LREV 6/1/2018 20:02:57'!
for: aTicTacToe 
	^ self new for: aTicTacToe! !


!classDefinition: #TicTacToeState category: #TicTacToe!
Object subclass: #TicTacToeState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerOWon
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerXWon
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isOver
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isTied
	
	self subclassResponsibility! !


!TicTacToeState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingO
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingX
	
	self subclassResponsibility! !


!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:31'!
markAt: aPosition

	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	self subclassResponsibility.! !

!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	self subclassResponsibility.! !


!TicTacToeState methodsFor: 'initialization' stamp: 'HAW 10/25/2017 13:05:13'!
initializeFor: aGame

	game := aGame ! !


!TicTacToeState methodsFor: 'visiting' stamp: 'LREV 6/2/2018 21:48:02'!
accept: aTicTacToeStateVisitor
	self subclassResponsibility 
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeState class' category: #TicTacToe!
TicTacToeState class
	instanceVariableNames: ''!

!TicTacToeState class methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:05:29'!
for: aTicTacToe 
	
	^self new initializeFor: aTicTacToe ! !


!classDefinition: #GameOverState category: #TicTacToe!
TicTacToeState subclass: #GameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!GameOverState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 11:53:57'!
isOver
	
	^true! !


!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:23'!
isPlayingO
	
	^false! !

!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:27'!
isPlayingX
	
	^false! !


!GameOverState methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:09'!
markAt: aPosition

	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !


!GameOverState methodsFor: 'visiting' stamp: 'LREV 6/2/2018 21:48:49'!
accept: aTicTacToeStateVisitor
	self subclassResponsibility ! !


!classDefinition: #GameTied category: #TicTacToe!
GameOverState subclass: #GameTied
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:49'!
isTied
	
	^true! !


!GameTied methodsFor: 'visiting' stamp: 'LREV 6/2/2018 21:50:04'!
accept: aTicTacToeStateVisitor
	aTicTacToeStateVisitor visitGameTied! !


!classDefinition: #PlayerOWon category: #TicTacToe!
GameOverState subclass: #PlayerOWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ true.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:06:24'!
isTied
	
	^false! !


!PlayerOWon methodsFor: 'visiting' stamp: 'LREV 6/2/2018 21:50:34'!
accept: aTicTacToeStateVisitor
	aTicTacToeStateVisitor visitPlayerOWon! !


!classDefinition: #PlayerXWon category: #TicTacToe!
GameOverState subclass: #PlayerXWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ true.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:25:44'!
isTied
	
	^false! !


!PlayerXWon methodsFor: 'visiting' stamp: 'LREV 6/2/2018 21:50:47'!
accept: aTicTacToeStateVisitor
	aTicTacToeStateVisitor visitPlayerXWon! !


!classDefinition: #PlayingState category: #TicTacToe!
TicTacToeState subclass: #PlayingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:10'!
hasPlayerOWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:17'!
hasPlayerXWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:26'!
isOver
	
	^false! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:52'!
isTied
	
	^false! !


!PlayingState methodsFor: 'visiting' stamp: 'LREV 6/2/2018 21:51:06'!
accept: aTicTacToeStateVisitor
	self subclassResponsibility ! !


!classDefinition: #PlayingO category: #TicTacToe!
PlayingState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:36'!
isPlayingO
	
	^true! !

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:27'!
isPlayingX
	
	^false! !


!PlayingO methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:13'!
markAt: aPosition

	^game markWithOAt: aPosition ! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:45'!
markWithOAt: aPosition
	game markWithOWhenPlayingOAt: aPosition.! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXAt: aPosition
	game markWithXWhenPlayingOAt: aPosition.! !


!PlayingO methodsFor: 'visiting' stamp: 'LREV 6/2/2018 21:51:17'!
accept: aTicTacToeStateVisitor
	aTicTacToeStateVisitor visitPlayingO! !


!classDefinition: #PlayingX category: #TicTacToe!
PlayingState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:50'!
isPlayingO
	
	^false! !

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:23'!
isPlayingX
	
	^true! !


!PlayingX methodsFor: 'visiting' stamp: 'LREV 6/2/2018 21:51:40'!
accept: aTicTacToeStateVisitor
	aTicTacToeStateVisitor visitPlayingX! !


!PlayingX methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:17'!
markAt: aPosition

	^game markWithXAt: aPosition ! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOAt: aPosition
	game markWithOWhenPlayingXAt: aPosition.! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:46'!
markWithXAt: aPosition
	game markWithXWhenPlayingXAt: aPosition.! !
