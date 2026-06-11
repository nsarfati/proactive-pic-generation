!classDefinition: #SendRecorderClient category: #'Tesis-PIC'!
InstructionClient subclass: #SendRecorderClient
	instanceVariableNames: 'stack method'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tesis-PIC'!

!SendRecorderClient methodsFor: 'initialization' stamp: 'NMS 10/6/2025 03:17:23'!
initializeWith: aMethod
	stack := OrderedCollection new.
	method := aMethod.! !


!SendRecorderClient methodsFor: 'instruction decoding' stamp: 'NMS 10/6/2025 03:20:20'!
blockReturnTop
	"Return Top Of Stack bytecode."
	^stack last! !

!SendRecorderClient methodsFor: 'instruction decoding' stamp: 'NMS 10/6/2025 03:07:51'!
doDup
	"Duplicate Top Of Stack bytecode."
	stack isEmpty ifFalse: [ stack add: stack last ].! !

!SendRecorderClient methodsFor: 'instruction decoding' stamp: 'NMS 10/6/2025 03:20:39'!
doPop
	"Remove Top Of Stack bytecode."
	^stack removeLast
! !

!SendRecorderClient methodsFor: 'instruction decoding' stamp: 'NMS 10/6/2025 03:35:05'!
methodReturnTop
	"Return Top Of Stack bytecode."
	^stack removeLast! !

!SendRecorderClient methodsFor: 'instruction decoding' stamp: 'NMS 10/6/2025 03:08:11'!
popIntoLiteralVariable: anAssociation 
	"Remove Top Of Stack And Store Into Literal Variable bytecode."
	^stack removeLast! !

!SendRecorderClient methodsFor: 'instruction decoding' stamp: 'NMS 10/6/2025 03:08:14'!
popIntoReceiverVariable: offset 
	"Remove Top Of Stack And Store Into Instance Variable bytecode."
	^stack removeLast! !

!SendRecorderClient methodsFor: 'instruction decoding' stamp: 'NMS 10/6/2025 03:08:25'!
popIntoRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex
	"Remove Top Of Stack And Store Into Offset of Temp Vector bytecode."
	^stack removeLast! !

!SendRecorderClient methodsFor: 'instruction decoding' stamp: 'NMS 10/6/2025 03:08:28'!
popIntoTemporaryVariable: offset 
	"Remove Top Of Stack And Store Into Temporary Variable bytecode."
	^stack removeLast! !

!SendRecorderClient methodsFor: 'instruction decoding' stamp: 'NMS 10/6/2025 03:09:04'!
pushActiveContext
	"Push Active Context On Top Of Its Own Stack bytecode."
	^stack add: #NotInterested! !

!SendRecorderClient methodsFor: 'instruction decoding' stamp: 'NMS 10/6/2025 03:26:30'!
pushClosureCopyNumCopiedValues: numCopied numArgs: numArgs blockSize: blockSize
	"Push Closure bytecode."
	numCopied timesRepeat: [ stack isEmpty ifFalse: [ stack removeLast ] ].
	^stack add: #NotInterested
! !

!SendRecorderClient methodsFor: 'instruction decoding' stamp: 'NMS 10/6/2025 03:27:05'!
pushConsArrayWithElements: numElements
	"Push Cons Array of size numElements popping numElements items from the stack into the array bytecode."
	stack removeLast: numElements .
	^stack add: #NotInterested! !

!SendRecorderClient methodsFor: 'instruction decoding' stamp: 'NMS 10/6/2025 03:09:16'!
pushConstant: value
	"Push Constant, value, on Top Of Stack bytecode."
	^stack add: #NotInterested! !

!SendRecorderClient methodsFor: 'instruction decoding' stamp: 'NMS 10/6/2025 03:09:19'!
pushLiteralVariable: anAssociation
	"Push Contents Of anAssociation On Top Of Stack bytecode."
	^stack add: #NotInterested! !

!SendRecorderClient methodsFor: 'instruction decoding' stamp: 'NMS 10/6/2025 03:09:22'!
pushNewArrayOfSize: numElements 
	"Push New Array of size numElements bytecode."
	^stack add: #NotInterested! !

!SendRecorderClient methodsFor: 'instruction decoding' stamp: 'NMS 10/6/2025 03:09:24'!
pushReceiver
	"Push Active Context's Receiver on Top Of Stack bytecode."
	^stack add: #NotInterested! !

!SendRecorderClient methodsFor: 'instruction decoding' stamp: 'NMS 10/6/2025 03:51:49'!
pushReceiverVariable: offset
	"Push Contents Of the Receiver's Instance Variable Whose Index 
	is the argument, offset, On Top Of Stack bytecode."
	stack add: ((method methodClass allInstVarNames) at: offset + 1).! !

!SendRecorderClient methodsFor: 'instruction decoding' stamp: 'NMS 10/6/2025 03:10:54'!
pushRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex
	"Push Contents at Offset in Temp Vector bytecode."
	^stack add: #NotInterested! !

!SendRecorderClient methodsFor: 'instruction decoding' stamp: 'NMS 10/6/2025 03:10:58'!
pushTemporaryVariable: offset
	"Push Contents Of Temporary Variable Whose Index Is the 
	argument, offset, On Top Of Stack bytecode."
	^stack add: #NotInterested! !

!SendRecorderClient methodsFor: 'instruction decoding' stamp: 'NMS 10/6/2025 03:56:29'!
send: selector super: supered numArgs: numberArguments
	"Send Message With Selector, selector, bytecode. The argument, 
	supered, indicates whether the receiver of the message is specified with 
	'super' in the source method. The arguments of the message are found in 
	the top numArguments locations on the stack and the receiver just 
	below them."
	| r |
	stack removeLast: numberArguments.
	r := stack removeLast.
	stack add: #NotInterested.

	^ r -> selector.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SendRecorderClient class' category: #'Tesis-PIC'!
SendRecorderClient class
	instanceVariableNames: ''!

!SendRecorderClient class methodsFor: 'instance creation' stamp: 'NMS 10/6/2025 03:17:04'!
on: aMethod
	^self new initializeWith: aMethod.
	! !


!classDefinition: #ProactivePICBuilder category: #'Tesis-PIC'!
Object subclass: #ProactivePICBuilder
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tesis-PIC'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ProactivePICBuilder class' category: #'Tesis-PIC'!
ProactivePICBuilder class
	instanceVariableNames: ''!

!ProactivePICBuilder class methodsFor: 'generate' stamp: 'NMS 6/11/2026 12:38:33'!
generatePICFor: aCompiledMethod
	| pc client iStream res receiver |

	client := SendRecorderClient on: aCompiledMethod.
	iStream := InstructionStream on: aCompiledMethod.

	[ iStream atEnd ] whileFalse: [
		
		pc := (iStream willSend)
				ifTrue: [ iStream followingPc - 1 ] "last byte of current instruction"
				ifFalse: [ nil ].

		receiver := iStream interpretNextInstructionFor: client.

		(pc notNil) ifTrue: [

			(receiver key = #NotInterested) ifFalse: [
				| tags methodsToPIC |				

				tags := (aCompiledMethod methodClass instanceVariablesTypes typeInfoOf: (receiver key)) types asArray.

				methodsToPIC := (tags collect: [ :each |
					each lookupSelector: (receiver value) 
				]).

				(methodsToPIC notEmpty) ifTrue: [
					res := ProactivePICBuilder
							handleCompiledMethods: methodsToPIC
							forClasses: tags
							withSelector: receiver value
							patchMethod: aCompiledMethod
							withSelector: aCompiledMethod selector
							atSendReturnPCs: {pc}.

"
					Transcript
						show: 'PICManager handleCompiledMethods: ', methodsToPIC printString; cr;
						show: '    forClasses: ', tags printString; cr;
						show: '    withSelector: ', receiver value printString; cr;
						show: '    patchMethod: ', aCompiledMethod printString; cr;
						show: '    withSelector: ', aCompiledMethod selector printString; cr;
						show: '    atSendReturnPCs: ', { pc } printString; cr; cr.
"					
				]
			]
		]
  	].

	^res
! !

!ProactivePICBuilder class methodsFor: 'generate' stamp: 'NMS 2/23/2026 14:26:38'!
getUsedSpace
    <primitive: 586>
    ^ -669! !

!ProactivePICBuilder class methodsFor: 'generate' stamp: 'NMS 10/7/2025 00:13:04'!
handleCompiledMethods: aCollectionWithMethodsToPIC forClasses: aCollectionWithTags withSelector: aPICSelector patchMethod: aPatchingMethod withSelector: aPatchingMethodSelector atSendReturnPCs: aCollectionWithSendReturnPCs
    <primitive: 583>
    ^ -666! !

!ProactivePICBuilder class methodsFor: 'generate' stamp: 'NMS 10/23/2025 16:37:40'!
jit: aCompiledMethod withSelector: aPatchingMethodSelector
    <primitive: 585>
    ^ -668! !

!ProactivePICBuilder class methodsFor: 'generate' stamp: 'NMS 10/6/2025 05:08:22'!
pcHelper: aCompiledMethod
	| pc client iStream res |

	client := SendRecorderClient on: aCompiledMethod.
	iStream := InstructionStream on: aCompiledMethod.
	res := OrderedCollection new.

	[ iStream atEnd ] whileFalse: [
		
		pc := (iStream willSend)
				ifTrue: [ iStream followingPc - 1 ] "last byte of current instruction"
				ifFalse: [ nil ].

		iStream interpretNextInstructionFor: client.

		(pc notNil) ifTrue: [			
			res add: pc.
		]
  	].

	^res asArray
! !


!ProactivePICBuilder class methodsFor: 'debug' stamp: 'NMS 10/13/2025 23:46:45'!
printItFor: aCompiledMethod
    <primitive: 584>
    ^ -667! !
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 119 121 118 104 106 123 112 125 108 52 119 112 106 52 110 108 117 108 121 104 123 112 118 117 54 106 124 112 122 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 119 121 118 104 106 123 112 125 108 52 119 112 106 52 110 108 117 108 121 104 123 112 118 117 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 53 112 116 104 110 108 17 124 117 112 127 17 83 112 117 124 127 39 61 53 56 56 53 55 52 57 64 52 110 108 117 108 121 112 106 17 127 63 61 102 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 49 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 58 100 17 95 56 56 17 92 117 112 127 39 105 124 112 115 123 39 118 117 39 77 108 105 39 57 62 39 57 55 57 61 39 57 58 65 56 55 65 56 55 39 74 118 116 119 112 115 108 121 65 39 92 105 124 117 123 124 39 74 115 104 117 110 39 56 64 53 56 53 56 39 47 56 124 105 124 117 123 124 56 48 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 49 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 58 39 124 124 112 107 65 39 109 105 109 55 59 107 64 109 52 63 64 62 105 52 59 108 56 59 52 63 59 56 107 52 61 59 55 58 61 105 62 106 62 62 109 107 39 77 108 105 39 57 62 39 57 55 57 61 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 49 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 58 39 124 124 112 107 65 39 109 105 109 55 59 107 64 109 52 63 64 62 105 52 59 108 56 59 52 63 59 56 107 52 61 59 55 58 61 105 62 106 62 62 109 107 39 77 108 105 39 57 62 39 57 55 57 61 17 93 84 65 39 57 55 57 61 55 57 57 62 57 55 59 59 39 117 112 106 118 115 104 122 71 115 108 117 118 125 118 65 109 106 108 117 54 123 108 122 112 122 54 118 122 125 116 52 105 124 112 115 107 108 121 39 75 104 123 108 65 39 77 121 112 39 77 108 105 39 57 62 39 56 62 65 59 59 65 56 60 39 57 55 57 61 39 74 118 116 116 112 123 79 104 122 111 65 39 56 61 60 109 107 62 62 106 107 39 87 115 124 110 112 117 122 65 39 57 55 57 61 55 57 57 62 57 55 59 59 39 117 112 106 118 115 104 122 71 115 108 117 118 125 118 65 109 106 108 117 54 123 108 122 112 122 54 118 122 125 116 52 105 124 112 115 107 108 121 17 199 175 7 116 17 56 64 57 53 56 61 63 53 55 53 56 55 64 17 115 108 117 118 125 118 17 115 108 117 118 125 118 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 56 56 91 56 61 65 57 61 65 55 63 53 55 61 57 64 57 60 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 57 55 57 61 52 55 57 52 56 56 54 91 108 122 112 122 52 87 80 74 53 122 123 17 56 57 56 62 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 56 56 91 56 61 65 57 61 65 56 55 53 57 61 55 55 63 63 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 57 55 57 61 52 55 57 52 56 56 54 91 108 122 112 122 52 91 108 122 123 53 122 123 17 58 59 60 57 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 56 57 91 56 57 65 60 55 65 58 57 53 59 64 62 64 58 59 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 107 128 117 104 116 112 106 52 111 128 119 108 121 119 104 121 104 116 108 123 108 121 122 54 91 108 122 112 122 52 91 108 122 123 53 122 123 17 58 58 64 64 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 56 57 91 56 62 65 59 63 65 56 57 53 57 55 64 55 56 63 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 107 128 117 104 116 112 106 52 111 128 119 108 121 119 104 121 104 116 108 123 108 121 122 54 91 108 122 112 122 52 91 108 122 123 53 122 123 17 58 56 59 62 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 56 58 91 56 63 65 59 62 65 59 55 53 55 56 64 63 56 62 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 75 108 119 123 111 91 108 122 123 53 122 123 17 58 58 60 64 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 56 58 91 56 63 65 59 62 65 59 58 53 58 61 56 56 64 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 87 108 121 109 118 121 116 104 117 106 108 53 122 123 17 57 58 60 60 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 56 64 91 56 56 65 60 55 65 55 61 53 58 60 64 60 63 57 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 75 108 119 123 111 91 108 122 123 53 122 123 17 56 60 57 56 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 56 64 91 56 58 65 56 56 65 60 60 53 64 62 57 57 58 63 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 75 108 119 123 111 91 108 122 123 53 122 123 17 56 62 59 63 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 56 64 91 56 58 65 56 60 65 57 58 53 63 57 64 55 56 58 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 87 108 121 109 118 121 116 104 117 106 108 52 85 108 126 80 107 108 104 53 122 123 17 57 61 60 62 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 57 56 91 56 62 65 60 63 65 57 55 53 57 57 56 59 56 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 75 108 119 123 111 91 108 122 123 53 122 123 17 57 55 56 57 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 57 56 91 56 63 65 57 59 65 56 57 53 61 62 63 62 61 58 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 75 108 119 123 111 91 108 122 123 53 122 123 17 57 55 60 55 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 57 63 91 55 56 65 56 62 65 56 58 53 58 59 64 62 63 58 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 87 108 121 109 118 121 116 104 117 106 108 53 122 123 17 58 64 60 62 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 57 63 91 55 56 65 56 62 65 56 59 53 60 64 59 60 64 58 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 75 108 119 123 111 91 108 122 123 53 122 123 17 58 57 62 62 63 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 56 91 56 57 65 59 56 65 59 60 53 59 59 57 60 62 57 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 119 121 118 104 106 123 112 125 108 52 119 112 106 52 110 108 117 108 121 104 123 112 118 117 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 87 80 74 53 122 123 17 63 59 60 59 17 52 52 52 52 52 52 52 52 52 52 17 17))!