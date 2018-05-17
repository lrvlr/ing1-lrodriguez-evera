!classDefinition: #PortfolioTest category: #'PortfolioTreePrinter-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	account := ReceptiveAccount new.

	self assert: 0 = account balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:45'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 = account balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 05:34'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 = account balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/28/2017 15:22:46'!
test03_01WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	self assert: (Withdraw register: withdrawValue on: account) value equals: withdrawValue 
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:48'!
test04PortfolioBalanceIsSumOfManagedAccountsBalance

	| account1 account2 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	 	
	Deposit register: 100 on: account1.
	Deposit register: 200 on: account2.
		
	self assert:300 = complexPortfolio balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:53'!
test05PortfolioCanManagePortfolios

	| account1 account2 account3 complexPortfolio composedPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	Deposit register: 100 on:account1.
	Deposit register: 200 on: account2.
	Deposit register: 300 on: account3.

	self assert: 600 = composedPortfolio balance .! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/25/2017 20:14:36'!
test06ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account registers: deposit).
	self assert: (account registers: withdraw).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/25/2017 20:14:30'!
test07ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account registers: deposit).
	self deny: (account registers:withdraw).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:51'!
test08PortfolioKnowsTransactionsRegisteredByItsManagedAccounts 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
 	self assert: (composedPortfolio registers: deposit1).
	self assert: (composedPortfolio registers: deposit2).
	self assert: (composedPortfolio registers: deposit3).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:25'!
test08PortofolioKnowsTransactionsRegisteredByItsManagedAccounts 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
 	self assert: (composedPortfolio registers: deposit1).
	self assert: (composedPortfolio registers: deposit2).
	self assert: (composedPortfolio registers: deposit3).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:00'!
test10ReceptiveAccountManageItSelf 

	| account1 |
	account1 := ReceptiveAccount new.
		
	self assert: (account1 manages:account1).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:01'!
test11ReceptiveAccountDoNotManageOtherAccount

	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
		
	self deny: (account1 manages: account2).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:02'!
test12PortfolioManagesComposedAccounts

	| account1 account2 account3 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self assert: (complexPortfolio manages: account1).
	self assert: (complexPortfolio manages: account2).
	self deny: (complexPortfolio manages: account3).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:03'!
test13PortfolioManagesComposedAccountsAndPortfolios 

	| account1 account2 account3 complexPortfolio composedPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	self assert: (composedPortfolio manages: account1).
	self assert: (composedPortfolio manages: account2).
	self assert: (composedPortfolio manages: account3).
	self assert: (composedPortfolio manages: complexPortfolio).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:28'!
test14AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on:account1.
		
	self assert: 1=account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/18/2011 17:15'!
test15PortfolioTransactionsIsTheUnionOftsAccountsTransactions 

	| account1 account2 account3 complexPortfolio account composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
	self assert: 3 = composedPortfolio transactions size .
	self assert: (composedPortfolio transactions includes: deposit1).
	self assert: (composedPortfolio transactions includes: deposit2).
	self assert: (composedPortfolio transactions includes: deposit3).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:23'!
test16PortfolioKnowsItsAccountsTransactions 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1= (composedPortfolio transactionsOf:account1) size .
	self assert: ((composedPortfolio transactionsOf: account1) includes:deposit1).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:23'!
test17PortfolioKnowsItsPortfoliosTransactions 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 100 on: account2.
	Deposit register: 100 on: account3.
		
	self assert: 2 = (composedPortfolio transactionsOf:complexPortfolio) size .
	self assert: ((composedPortfolio transactionsOf:complexPortfolio) includes:deposit1).
	self assert: ((composedPortfolio transactionsOf:complexPortfolio) includes:deposit2).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:24'!
test18PortfolioCanNotAnswerTransactionsOfNotManagedAccounts 

	| account1 account2 account3 complexPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self 
		should: [ complexPortfolio transactionsOf:account3 ] 
		raise: Error 
		withExceptionDo: [ :accountNotManaged |
			self assert: Portfolio accountNotManagedMessageDescription = accountNotManaged messageText ]
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/8/2018 16:24:31'!
test19CanNotCreatePortfoliosWithRepeatedAccount 

	| account1 |

	account1 := ReceptiveAccount new.
	self 
		should: [ Portfolio with: account1 with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage  = invalidPortfolio messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:15'!
test20CanNotCreatePortfoliosWithAccountsManagedByOtherManagedPortfolio 

	| account1 account2 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.

	self 
		should: [ Portfolio with: complexPortfolio with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage = invalidPortfolio messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/8/2018 16:11:42'!
test20_01CanNotCreatePortfoliosWithAccountsManagedByOtherManagedPortfolioTwo

    | account1 account2 account3 complexPortfolio1 complexPortfolio2 |
    
    account1 := ReceptiveAccount new.
    account2 := ReceptiveAccount new.
    account3 := ReceptiveAccount new.    
    complexPortfolio1 := Portfolio with: account1 with: account2.
    complexPortfolio2 := Portfolio with: account3 with: account1.

    self 
        should: [ Portfolio with: complexPortfolio1 with: complexPortfolio2 ]
        raise: Error
        withExceptionDo: [ :invalidPortfolio |
            self assert: Portfolio accountAlreadyManagedErrorMessage = invalidPortfolio messageText ] ! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 05:27'!
test21TransferShouldWithdrawFromFromAccountAndDepositIntoToAccount

	| fromAccount toAccount |

	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new.

	Transfer register: 100 from: fromAccount to: toAccount.
		
	self assert: -100 = fromAccount balance.
	self assert:  100 = toAccount balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/28/2017 15:30:52'!
test21_01TransferIsReachedFromTransacctions

	| fromAccount toAccount transfer |

	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new.

	transfer := Transfer register: 100 from: fromAccount to: toAccount.
		
	self assert:  100 = transfer value.
	self assert: fromAccount transactions first transfer equals: transfer.
	self assert: toAccount transactions first transfer equals: transfer.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 9/28/2017 15:27:01'!
test22AccountSummaryShouldProvideHumanReadableTransactionsDetail

	| fromAccount toAccount fromAccountLines toAccountLines|

	fromAccount := ReceptiveAccount new.
	toAccount := ReceptiveAccount new.
	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	
	fromAccountLines := self accountSummaryLinesOf: fromAccount.
	toAccountLines := self accountSummaryLinesOf: toAccount.
	
	self assert: 3 = fromAccountLines size.
	self assert: 'Deposito por 100' = (fromAccountLines at: 1).
	self assert: 'Extraccion por 50' = (fromAccountLines at: 2).
	self assert: 'Transferencia por -100' = (fromAccountLines at: 3).
	
	self assert: 1 = toAccountLines size.
	self assert: 'Transferencia por 100' = (toAccountLines at: 1).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!
test23ShouldBeAbleToBeQueryTransferNet

	| fromAccount toAccount |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	Transfer register: 250 from: toAccount to: fromAccount.
		
	self assert: 150 = (self accountTransferNetOf: fromAccount).
	self assert: -150 = (self accountTransferNetOf: toAccount).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!
test24CertificateOfDepositShouldWithdrawInvestmentValue

	| account toAccount |
	account := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 1000 on: account.
	Withdraw register: 50 on: account.
	Transfer register: 100 from: account to: toAccount.
	CertificateOfDeposit register: 100 during: 30 at: 1/10 on: account.
		
	self assert: 100 =(self investmentNetOf:account).
	self assert: 750 = account balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!
test25ShouldBeAbleToQueryInvestmentEarnings

	| account investmentEarnings |
	account := ReceptiveAccount new. 
		
	CertificateOfDeposit register: 100 during: 30 at: 1/10 on: account.
	CertificateOfDeposit register: 100 during: 60 at: 15/100 on: account.

	investmentEarnings := 
		(100*((1/10)/360)*30) +
		(100*((15/100)/360)*60).
		
	self assert: investmentEarnings = (self investmentEarningsOf: account).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 8/13/2017 18:37:21'!
test26AccountSummaryShouldWorkWithCertificateOfDeposit

	| fromAccount toAccount lines |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	CertificateOfDeposit register: 1000 during: 30 at: 1/10 on: fromAccount.
		
	lines := self accountSummaryLinesOf: fromAccount.
		
	self assert: 4 = lines size.
	self assert: 'Deposito por 100' =  (lines at: 1).
	self assert: 'Extraccion por 50' =  (lines at: 2).
	self assert: 'Transferencia por -100' = (lines at: 3).
	self assert: 'Plazo fijo por 1000 durante 30 dias a una tna de 10%' = (lines at: 4).! !

!PortfolioTest methodsFor: 'tests' stamp: 'LVR 5/10/2018 18:25:17'!
test27ShouldBeAbleToBeQueryTransferNetWithCertificateOfDeposit

	| fromAccount toAccount |
	fromAccount := ReceptiveAccount new. 
	toAccount := ReceptiveAccount new. 

	Deposit register: 100 on: fromAccount.
	Withdraw register: 50 on: fromAccount.
	Transfer register: 100 from: fromAccount to: toAccount.
	Transfer register: 250 from: toAccount to: fromAccount.
	CertificateOfDeposit register: 1000 during: 30 at: 1/10 on: fromAccount.
		
	self assert: 150 = (self accountTransferNetOf: fromAccount).
	self assert: -150 = (self accountTransferNetOf: toAccount).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:29'!
test28PortfolioTreePrinterPrintsTheCompositeInDepthFirstOrder

	| account1 account2 account3 complexPortfolio composedPortfolio accountNames lines |
	
	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	account3 := ReceptiveAccount new. 
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.

	accountNames := Dictionary new.
	accountNames at: composedPortfolio put: 'composedPortfolio'.
	accountNames at: complexPortfolio put: 'complexPortfolio'.
	accountNames at: account1 put: 'account1'.
	accountNames at: account2 put: 'account2'.
	accountNames at: account3 put: 'account3'.
		
	lines := self portofolioTreeOf: composedPortfolio namingAccountWith: accountNames.
		
	self assert: 5 = lines size.
	self assert: 'composedPortfolio' = (lines at: 1).
	self assert: ' complexPortfolio' = (lines at: 2).
	self assert: '  account1' = (lines at: 3).
	self assert: '  account2' = (lines at: 4).
	self assert: ' account3' = (lines at: 5).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:30'!
test29ReversePortfolioTreePrinterPrintsTheCompositeStartingFromTheLeaves

	| account1 account2 account3 complexPortfolio composedPortfolio accountNames lines |
	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	account3 := ReceptiveAccount new. 
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.

	accountNames := Dictionary new.
	accountNames at: composedPortfolio put: 'composedPortfolio'.
	accountNames at: complexPortfolio put: 'complexPortfolio'.
	accountNames at: account1 put: 'account1'.
	accountNames at: account2 put: 'account2'.
	accountNames at: account3 put: 'account3'.
		
	lines := self reversePortofolioTreeOf: composedPortfolio namingAccountWith: accountNames.
		
	self assert: 5 = lines size.
	self assert: ' account3' = (lines at: 1).
	self assert: '  account2' = (lines at: 2).
	self assert: '  account1' = (lines at: 3).
	self assert: ' complexPortfolio' = (lines at: 4).
	self assert: 'composedPortfolio' = (lines at: 5).
	! !


!PortfolioTest methodsFor: 'test support' stamp: 'LVR 5/14/2018 15:41:41'!
accountSummaryLinesOf: aReceptiveAccount 
	
	^(AccountSummary for: aReceptiveAccount) value! !

!PortfolioTest methodsFor: 'test support' stamp: 'LVR 5/14/2018 15:52:18'!
accountTransferNetOf: aReceptiveAccount 
	
	^ (AccountTransferNet for: aReceptiveAccount) value.! !

!PortfolioTest methodsFor: 'test support' stamp: 'LVR 5/14/2018 16:04:14'!
investmentEarningsOf: aReceptiveAccount 
	
	^ (InvestmentEarnings for: aReceptiveAccount) value! !

!PortfolioTest methodsFor: 'test support' stamp: 'LVR 5/14/2018 15:56:17'!
investmentNetOf: aReceptiveAccount 
	
	^ (InvestmentNet for: aReceptiveAccount) value.! !

!PortfolioTest methodsFor: 'test support' stamp: 'LVR 5/14/2018 17:13:06'!
portofolioTreeOf: aPortfolio namingAccountWith: aDictionary 
	
	^(PortfolioTree for: aPortfolio withAccountNames: aDictionary) value! !

!PortfolioTest methodsFor: 'test support' stamp: 'LVR 5/17/2018 06:58:37'!
reversePortofolioTreeOf: aPortfolio namingAccountWith: aDictionary 
	
		^(PortfolioTree for: aPortfolio withAccountNames: aDictionary) valueReverse ! !


!classDefinition: #AccountTransaction category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransaction methodsFor: 'evaluating' stamp: 'HernanWilkinson 7/14/2011 06:48'!
value

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'accessing' stamp: 'LREV 5/17/2018 16:24:35'!
identifyTransactionFor: aFinancialTransactionsOperator

	self subclassResponsibility! !


!AccountTransaction methodsFor: 'accounting' stamp: 'LVR 5/14/2018 19:44:43'!
affectBalance: aBalance
	self subclassResponsibility! !


!classDefinition: #CertificateOfDeposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #CertificateOfDeposit
	instanceVariableNames: 'value tna numberOfDays account period rate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!CertificateOfDeposit methodsFor: 'initialization' stamp: 'LVR 5/11/2018 16:06:49'!
initializeWith: anAmmount during: aNumberOfDays at: anInvestmentRate 
	
	value := anAmmount.
	period := aNumberOfDays.
	rate := anInvestmentRate.
	! !


!CertificateOfDeposit methodsFor: 'value' stamp: 'LVR 5/11/2018 16:20:06'!
period
	^period! !

!CertificateOfDeposit methodsFor: 'value' stamp: 'LVR 5/11/2018 16:19:57'!
rate
	^rate! !

!CertificateOfDeposit methodsFor: 'value' stamp: 'LVR 5/13/2018 16:05:02'!
value
	
	^value! !


!CertificateOfDeposit methodsFor: 'accessing' stamp: 'LREV 5/17/2018 16:24:53'!
identifyTransactionFor: aFinancialTransactionsOperator
	^aFinancialTransactionsOperator fromCertificateOfDeposit: self.! !


!CertificateOfDeposit methodsFor: 'accounting' stamp: 'LVR 5/14/2018 16:20:21'!
affectBalance: aBalance
	^ aBalance - self value.! !

!CertificateOfDeposit methodsFor: 'accounting' stamp: 'LVR 5/17/2018 11:46:22'!
earnings	
	
	^ (self value * ( (self rate / 360) * self period ) )! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CertificateOfDeposit class' category: #'PortfolioTreePrinter-Ejercicio'!
CertificateOfDeposit class
	instanceVariableNames: ''!

!CertificateOfDeposit class methodsFor: 'instance creation' stamp: 'LVR 5/11/2018 16:03:48'!
for: anAmmount during: aNumberOfDays at: anInvestmentRate 

	^ self new initializeWith: anAmmount during: aNumberOfDays at: anInvestmentRate.! !

!CertificateOfDeposit class methodsFor: 'instance creation' stamp: 'LVR 5/11/2018 16:02:37'!
register: anInvestmentDeposit during: aNumberOfDays at: anInvestmentRate on: aReceptiveAccount 

	| aCertificateOfDeposit |
	
	aCertificateOfDeposit := self for: anInvestmentDeposit during: aNumberOfDays at: anInvestmentRate.
	
	aReceptiveAccount register: aCertificateOfDeposit.
	
	^ aCertificateOfDeposit! !


!classDefinition: #Deposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'accesing' stamp: 'LREV 5/17/2018 16:23:36'!
identifyTransactionFor: aFinancialTransactionsOperator
	^aFinancialTransactionsOperator fromDeposit: self.! !


!Deposit methodsFor: 'accounting' stamp: 'LVR 5/14/2018 19:46:14'!
affectBalance: aBalance
	^ aBalance + self value .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'PortfolioTreePrinter-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'LVR 5/17/2018 06:44:16'!
register: aValue on: account

	| deposit |
	
	deposit := self for: aValue.
	account register: deposit.
		
	^ deposit! !


!classDefinition: #TransferTransaction category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #TransferTransaction
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferTransaction methodsFor: 'accesing' stamp: 'LREV 5/17/2018 16:25:52'!
identifyTransactionFor: aFinancialTransactionsOperator
	self subclassResponsibility! !


!TransferTransaction methodsFor: 'value' stamp: 'LVR 5/14/2018 20:16:30'!
transfer

	self subclassResponsibility
	! !

!TransferTransaction methodsFor: 'value' stamp: 'LVR 5/14/2018 20:16:43'!
value

	self subclassResponsibility
	! !


!TransferTransaction methodsFor: 'accounting' stamp: 'LVR 5/14/2018 19:49:35'!
affectBalance: aBalance
	self subclassResponsibility .! !


!classDefinition: #TransferDeposit category: #'PortfolioTreePrinter-Ejercicio'!
TransferTransaction subclass: #TransferDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferDeposit methodsFor: 'initialization' stamp: 'LVR 5/10/2018 17:42:50'!
initializeWith: aTransfer

	transfer := aTransfer.! !


!TransferDeposit methodsFor: 'accounting' stamp: 'LVR 5/14/2018 19:49:07'!
affectBalance: aBalance
	^ aBalance + self value .! !


!TransferDeposit methodsFor: 'value' stamp: 'LVR 5/14/2018 20:30:15'!
transfer
	^ transfer! !

!TransferDeposit methodsFor: 'value' stamp: 'LVR 5/14/2018 20:29:56'!
value
	^ transfer value! !


!TransferDeposit methodsFor: 'accessing' stamp: 'LREV 5/17/2018 16:25:36'!
identifyTransactionFor: aFinancialTransactionsOperator
	^aFinancialTransactionsOperator fromTransferDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'instance creation' stamp: 'LVR 5/10/2018 17:41:48'!
with: aTransfer
	
	^self new initializeWith: aTransfer! !


!classDefinition: #TransferWithdraw category: #'PortfolioTreePrinter-Ejercicio'!
TransferTransaction subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferWithdraw methodsFor: 'initialization' stamp: 'LVR 5/10/2018 17:43:12'!
initializeWith: aTransfer

	transfer := aTransfer.! !


!TransferWithdraw methodsFor: 'accounting' stamp: 'LVR 5/14/2018 16:20:40'!
affectBalance: aBalance
	^ aBalance - self value.! !


!TransferWithdraw methodsFor: 'value' stamp: 'LVR 5/14/2018 20:30:22'!
transfer

	^transfer! !

!TransferWithdraw methodsFor: 'value' stamp: 'LVR 5/14/2018 20:29:45'!
value
	^transfer value! !


!TransferWithdraw methodsFor: 'accessing' stamp: 'LREV 5/17/2018 16:26:03'!
identifyTransactionFor: aFinancialTransactionsOperator
	^aFinancialTransactionsOperator fromTransferWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'instance creation' stamp: 'LVR 5/10/2018 17:43:38'!
with: aTransfer
	
	^self new initializeWith: aTransfer! !


!classDefinition: #Withdraw category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'LVR 5/13/2018 15:47:39'!
value

	^value! !


!Withdraw methodsFor: 'accesing' stamp: 'LREV 5/17/2018 16:26:33'!
identifyTransactionFor: aFinancialTransactionsOperator
	^aFinancialTransactionsOperator fromWithdraw: self.! !


!Withdraw methodsFor: 'accounting' stamp: 'LVR 5/14/2018 16:20:51'!
affectBalance: aBalance
	^ aBalance - self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/14/2011 05:32'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #OperatorOnAccounts category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #OperatorOnAccounts
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!OperatorOnAccounts methodsFor: 'value' stamp: 'LREV 5/17/2018 00:23:44'!
fromPortfolio: aPortfolio

	self subclassResponsibility! !

!OperatorOnAccounts methodsFor: 'value' stamp: 'LREV 5/17/2018 00:23:54'!
fromReceptiveAccount: aReceptiveAccount

	self subclassResponsibility
	! !

!OperatorOnAccounts methodsFor: 'value' stamp: 'LREV 5/17/2018 00:24:00'!
value

	self subclassResponsibility! !


!classDefinition: #PortfolioTree category: #'PortfolioTreePrinter-Ejercicio'!
OperatorOnAccounts subclass: #PortfolioTree
	instanceVariableNames: 'portfolio accountNames lines level'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!PortfolioTree methodsFor: 'initialization' stamp: 'LVR 5/14/2018 18:00:00'!
initializeFor: aPortfolio withAccountNames: aDictionaryOfAccountNames

	portfolio _ aPortfolio.
	accountNames _ aDictionaryOfAccountNames.
	lines := OrderedCollection new.
	level:= ''.! !


!PortfolioTree methodsFor: 'value' stamp: 'LREV 5/17/2018 16:36:00'!
fromPortfolio: aPortfolio

	lines add: (level, (accountNames at: aPortfolio ifAbsent: [self error: self class accountNameNotInDictionaryDescrpition ])).
	
	level := level, ' '.
	
	aPortfolio identifyContainedAccountsFor: self.

	level := level copyFrom:2 to: level size.! !

!PortfolioTree methodsFor: 'value' stamp: 'LVR 5/17/2018 07:05:16'!
fromReceptiveAccount: aReceptiveAccount

	lines add: (level, (accountNames at: aReceptiveAccount ifAbsent: [self error: self class accountNameNotInDictionaryDescrpition ])).
	! !

!PortfolioTree methodsFor: 'value' stamp: 'LVR 5/17/2018 09:31:26'!
value

	portfolio identifyAccountFor: self.
	^lines! !

!PortfolioTree methodsFor: 'value' stamp: 'LVR 5/17/2018 06:58:08'!
valueReverse

	^ self value reverse ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTree class' category: #'PortfolioTreePrinter-Ejercicio'!
PortfolioTree class
	instanceVariableNames: ''!

!PortfolioTree class methodsFor: 'instance creation' stamp: 'LVR 5/14/2018 17:14:20'!
for: aPortfolio withAccountNames: aDictionaryOfAccountNames

	^self new initializeFor: aPortfolio withAccountNames: aDictionaryOfAccountNames.! !


!PortfolioTree class methodsFor: 'errors' stamp: 'LVR 5/17/2018 07:03:51'!
accountNameNotInDictionaryDescrpition

	^'This account is not defined in the dictionary'! !


!classDefinition: #OperatorOnTransaction category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #OperatorOnTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!OperatorOnTransaction methodsFor: 'initialization' stamp: 'LREV 5/17/2018 00:15:56'!
initializeFor: anAccount

	self subclassResponsibility! !


!OperatorOnTransaction methodsFor: 'value' stamp: 'LREV 5/17/2018 00:14:17'!
fromCertificateOfDeposit: aCertificateOfDeposit

	self subclassResponsibility! !

!OperatorOnTransaction methodsFor: 'value' stamp: 'LREV 5/17/2018 00:14:23'!
fromDeposit: aDeposit

	self subclassResponsibility! !

!OperatorOnTransaction methodsFor: 'value' stamp: 'LREV 5/17/2018 00:14:33'!
fromTransferDeposit: aTransferDeposit

	self subclassResponsibility! !

!OperatorOnTransaction methodsFor: 'value' stamp: 'LREV 5/17/2018 00:14:41'!
fromTransferWithdraw: aTransferWithdraw

	self subclassResponsibility! !

!OperatorOnTransaction methodsFor: 'value' stamp: 'LREV 5/17/2018 00:14:47'!
fromWithdraw: aWithdraw

	self subclassResponsibility! !

!OperatorOnTransaction methodsFor: 'value' stamp: 'LREV 5/17/2018 00:14:55'!
value

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OperatorOnTransaction class' category: #'PortfolioTreePrinter-Ejercicio'!
OperatorOnTransaction class
	instanceVariableNames: ''!

!OperatorOnTransaction class methodsFor: 'instance creation' stamp: 'LREV 5/17/2018 00:15:36'!
for: anAccount

	self subclassResponsibility! !


!classDefinition: #AccountSummary category: #'PortfolioTreePrinter-Ejercicio'!
OperatorOnTransaction subclass: #AccountSummary
	instanceVariableNames: 'account lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountSummary methodsFor: 'initialization' stamp: 'LVR 5/14/2018 15:43:02'!
initializeFor: anAccount

	account _ anAccount.
	lines := OrderedCollection new.! !


!AccountSummary methodsFor: 'value' stamp: 'LVR 5/14/2018 15:44:22'!
fromCertificateOfDeposit: aCertificateOfDeposit

	lines add: ('Plazo fijo por ', aCertificateOfDeposit value printString, ' durante ', aCertificateOfDeposit period printString, ' dias a una tna de ', (aCertificateOfDeposit rate * 100) printString,  '%')
! !

!AccountSummary methodsFor: 'value' stamp: 'LVR 5/14/2018 15:42:08'!
fromDeposit: aDeposit
	lines add: ('Deposito por ' , aDeposit value printString).! !

!AccountSummary methodsFor: 'value' stamp: 'LVR 5/14/2018 20:23:08'!
fromTransferDeposit: aTransferDeposit
	lines add: ('Transferencia por ', aTransferDeposit value printString)! !

!AccountSummary methodsFor: 'value' stamp: 'LVR 5/14/2018 20:23:54'!
fromTransferWithdraw: aTransferWithdraw
	lines add: 'Transferencia por -' , aTransferWithdraw value printString.! !

!AccountSummary methodsFor: 'value' stamp: 'LVR 5/14/2018 15:42:34'!
fromWithdraw: aWithdraw

	lines add: ('Extraccion por ', aWithdraw value printString)
! !

!AccountSummary methodsFor: 'value' stamp: 'LVR 5/14/2018 15:51:47'!
value

	account identifyTransactionsFor: self.
		
	^lines
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'instance creation' stamp: 'LVR 5/14/2018 15:09:14'!
for: anAccount

	^self new initializeFor: anAccount! !


!classDefinition: #AccountTransferNet category: #'PortfolioTreePrinter-Ejercicio'!
OperatorOnTransaction subclass: #AccountTransferNet
	instanceVariableNames: 'account transferNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransferNet methodsFor: 'initialization' stamp: 'LVR 5/14/2018 15:50:00'!
initializeFor: anAccount

	account _ anAccount.
	transferNet _ 0.! !


!AccountTransferNet methodsFor: 'value' stamp: 'LVR 5/17/2018 09:41:01'!
fromCertificateOfDeposit: aCertificateOfDeposit
! !

!AccountTransferNet methodsFor: 'value' stamp: 'LVR 5/17/2018 09:41:06'!
fromDeposit: aDeposit
! !

!AccountTransferNet methodsFor: 'value' stamp: 'LREV 5/17/2018 16:03:54'!
fromTransferDeposit: aTransferDeposit
	
	 transferNet _ aTransferDeposit affectBalance: transferNet.! !

!AccountTransferNet methodsFor: 'value' stamp: 'LREV 5/17/2018 16:04:49'!
fromTransferWithdraw: aTransferWithdraw
	
	transferNet _ aTransferWithdraw affectBalance: transferNet.! !

!AccountTransferNet methodsFor: 'value' stamp: 'LVR 5/17/2018 09:41:23'!
fromWithdraw: aWithdraw




! !

!AccountTransferNet methodsFor: 'value' stamp: 'LVR 5/17/2018 09:20:27'!
value

	account identifyTransactionsFor: self.
		
	^ transferNet! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransferNet class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransferNet class
	instanceVariableNames: ''!

!AccountTransferNet class methodsFor: 'instance creation' stamp: 'LVR 5/14/2018 15:49:41'!
for: anAccount

	^self new initializeFor: anAccount! !


!classDefinition: #InvestmentEarnings category: #'PortfolioTreePrinter-Ejercicio'!
OperatorOnTransaction subclass: #InvestmentEarnings
	instanceVariableNames: 'account lines earnings'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!InvestmentEarnings methodsFor: 'initialization' stamp: 'LVR 5/14/2018 16:03:28'!
initializeFor: anAccount

	account _ anAccount.
	earnings := 0! !


!InvestmentEarnings methodsFor: 'value' stamp: 'LVR 5/17/2018 11:47:05'!
fromCertificateOfDeposit: aCertificateOfDeposit

	earnings := earnings + (aCertificateOfDeposit earnings)! !

!InvestmentEarnings methodsFor: 'value' stamp: 'LVR 5/17/2018 06:25:57'!
fromDeposit: aDeposit
! !

!InvestmentEarnings methodsFor: 'value' stamp: 'LVR 5/17/2018 06:26:03'!
fromTransferDeposit: aTransferDeposit
	! !

!InvestmentEarnings methodsFor: 'value' stamp: 'LVR 5/17/2018 06:26:10'!
fromTransferWithdraw: aTransferWithdraw
	! !

!InvestmentEarnings methodsFor: 'value' stamp: 'LVR 5/17/2018 06:26:16'!
fromWithdraw: aWithdraw

	
! !

!InvestmentEarnings methodsFor: 'value' stamp: 'LVR 5/14/2018 16:03:44'!
value

	account identifyTransactionsFor: self.
		
	^earnings
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvestmentEarnings class' category: #'PortfolioTreePrinter-Ejercicio'!
InvestmentEarnings class
	instanceVariableNames: ''!

!InvestmentEarnings class methodsFor: 'instance creation' stamp: 'LVR 5/14/2018 16:01:26'!
for: anAccount

	^self new initializeFor: anAccount! !


!classDefinition: #InvestmentNet category: #'PortfolioTreePrinter-Ejercicio'!
OperatorOnTransaction subclass: #InvestmentNet
	instanceVariableNames: 'account investmentNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!InvestmentNet methodsFor: 'initialization' stamp: 'LVR 5/14/2018 15:55:42'!
initializeFor: anAccount

	account _ anAccount.
	investmentNet _ 0.! !


!InvestmentNet methodsFor: 'value' stamp: 'LVR 5/14/2018 15:55:25'!
fromCertificateOfDeposit: aCertificateOfDeposit

	investmentNet _ investmentNet + aCertificateOfDeposit value.! !

!InvestmentNet methodsFor: 'value' stamp: 'LVR 5/14/2018 15:54:04'!
fromDeposit: aDeposit
! !

!InvestmentNet methodsFor: 'value' stamp: 'LVR 5/14/2018 20:27:26'!
fromTransferDeposit: aTransferTransaction
	! !

!InvestmentNet methodsFor: 'value' stamp: 'LVR 5/14/2018 20:27:21'!
fromTransferWithdraw: aTransferTransaction
	! !

!InvestmentNet methodsFor: 'value' stamp: 'LVR 5/14/2018 15:54:04'!
fromWithdraw: aWithdraw
! !

!InvestmentNet methodsFor: 'value' stamp: 'LVR 5/14/2018 16:00:29'!
value

	account identifyTransactionsFor: self.
		
	^investmentNet ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvestmentNet class' category: #'PortfolioTreePrinter-Ejercicio'!
InvestmentNet class
	instanceVariableNames: ''!

!InvestmentNet class methodsFor: 'instance creation' stamp: 'LVR 5/14/2018 15:54:04'!
for: anAccount

	^self new initializeFor: anAccount! !


!classDefinition: #SummarizingAccount category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #SummarizingAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SummarizingAccount methodsFor: 'testing' stamp: 'LVR 5/17/2018 09:30:27'!
identifyAccountFor: aFinancialAccountOperator
	self subclassResponsibility.! !

!SummarizingAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:34'!
manages: anAccount

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:34'!
registers: aTransaction

	self subclassResponsibility ! !


!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:34'!
balance

	self subclassResponsibility ! !

!SummarizingAccount methodsFor: 'transactions' stamp: 'LVR 5/17/2018 09:32:28'!
identifyTransactionsFor: aFinancialTransactionsOperator
	self subclassResponsibility.! !

!SummarizingAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:35'!
transactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/8/2018 16:46:26'!
anyManagedAccountManages: anAccount 

	^accounts anySatisfy: [ :managedAccount | (managedAccount manages: anAccount) or: [ anAccount manages: managedAccount ] ] ! !

!Portfolio methodsFor: 'testing' stamp: 'LVR 5/17/2018 09:30:26'!
identifyAccountFor: aFinancialAccountOperator
	aFinancialAccountOperator fromPortfolio: self.! !

!Portfolio methodsFor: 'testing' stamp: 'LVR 5/17/2018 09:33:31'!
identifyContainedAccountsFor: aFinancialAccountOperator
	accounts do: [ :anAccount |
		anAccount identifyAccountFor: aFinancialAccountOperator ].! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/8/2018 16:46:01'!
manages: anAccount

	^ self = anAccount  or: [ self anyManagedAccountManages: anAccount ]! !

!Portfolio methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 19:20'!
registers: aTransaction

	^ accounts anySatisfy: [ :anAccount | anAccount registers: aTransaction ]  ! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 8/13/2017 17:47:44'!
balance

	^ accounts sum: [ :account | account balance ]
! !

!Portfolio methodsFor: 'transactions' stamp: 'LREV 5/17/2018 16:24:04'!
identifyTransactionsFor: aFinancialTransactionsOperator
	self transactions do: [ :aTransaction |
		aTransaction identifyTransactionFor: aFinancialTransactionsOperator ].! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 9/25/2017 19:40:20'!
transactions 

	^ accounts 
		inject: OrderedCollection new 
		into: [ :transactions :account | transactions addAll: account transactions. transactions ]
	! !

!Portfolio methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 19:27'!
transactionsOf: anAccount 

	^ (self manages: anAccount)
		ifTrue: [ anAccount transactions ] 
		ifFalse: [ self error: self class accountNotManagedMessageDescription]
	! !


!Portfolio methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 19:19'!
initializeWithAll: aCollectionOfAccounts

	accounts := aCollectionOfAccounts   ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'PortfolioTreePrinter-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:33:13'!
with: leftAccount with: rightAccount

	^ self withAll: (Array with: leftAccount with: rightAccount)! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/8/2018 16:40:55'!
withAll: aCollectionOfAccounts

	self checkCreationPreconditions: aCollectionOfAccounts.
	
	^self new initializeWithAll: aCollectionOfAccounts ! !


!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!
check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts

	^ aCollectionOfAccounts do: [ :targetAccount | 
			(sourceAccount = targetAccount) not ifTrue: [ 
				(sourceAccount manages: targetAccount) ifTrue: [ self error: self accountAlreadyManagedErrorMessage ] ] ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkAccountsAreUnique: aCollectionOfAccounts

	aCollectionOfAccounts asSet size = aCollectionOfAccounts size
		ifFalse: [ self error: self accountAlreadyManagedErrorMessage ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkCreationPreconditions: aCollectionOfAccounts

	self checkAccountsAreUnique: aCollectionOfAccounts.
	self checkNoCircularReferencesIn: aCollectionOfAccounts! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!
checkNoCircularReferencesIn: aCollectionOfAccounts

	aCollectionOfAccounts do: [ :sourceAccount | self check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts ]! !


!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:28'!
accountAlreadyManagedErrorMessage

	^ 'Account already managed'! !

!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:27'!
accountNotManagedMessageDescription
	
	^ 'Account not managed'! !


!classDefinition: #ReceptiveAccount category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'LVR 5/14/2018 16:18:00'!
balance

	^ transactions inject: 0 into: [ :balance :transaction | transaction affectBalance: balance]! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'LVR 5/17/2018 09:30:27'!
identifyAccountFor: aFinancialAccountOperator
	aFinancialAccountOperator fromReceptiveAccount: self.! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'LREV 5/17/2018 16:24:09'!
identifyTransactionsFor: aFinancialTransactionsOperator
	transactions do: [ :aTransaction |
		aTransaction identifyTransactionFor: aFinancialTransactionsOperator ].! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:37'!
manages: anAccount

	^ self = anAccount 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HernanWilkinson 7/13/2011 18:37'!
registers: aTtransaction

	^ transactions includes: aTtransaction 
! !


!classDefinition: #Transfer category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value counterpart originAccount destAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'LVR 5/10/2018 17:39:57'!
register: anAmmountToTransfer from: anOriginAccount to: aDesAccount

	value := anAmmountToTransfer.
	originAccount := anOriginAccount.
	destAccount := aDesAccount.
	! !


!Transfer methodsFor: 'value' stamp: 'LVR 5/10/2018 17:49:01'!
value

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'PortfolioTreePrinter-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'LVR 5/10/2018 17:37:22'!
register: anAmmountToTransfer from: anOriginAccount to: aDesAccount
	"Hay que hacer assert de que la cuenta de origen tiene suficientes fondos"

			| transfer |
			
			transfer _ self new register: anAmmountToTransfer from: anOriginAccount to: aDesAccount.
			
			anOriginAccount register: (TransferWithdraw with: transfer).
			
			aDesAccount register: (TransferDeposit with: transfer).
			
			^transfer
			
			
			! !
