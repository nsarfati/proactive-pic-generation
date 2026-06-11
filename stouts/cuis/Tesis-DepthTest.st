!classDefinition: #DTLeaf1 category: #'Tesis-DepthTest'!
Object subclass: #DTLeaf1
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tesis-DepthTest'!

!DTLeaf1 methodsFor: 'methods - to test - depth' stamp: 'NMS 2/18/2026 17:37:52'!
depth
	^ 1! !


!classDefinition: #DTLeaf2 category: #'Tesis-DepthTest'!
Object subclass: #DTLeaf2
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tesis-DepthTest'!

!DTLeaf2 methodsFor: 'methods - to test - depth' stamp: 'NMS 2/18/2026 17:38:22'!
depth
	^ 2! !


!classDefinition: #DTLeaf3 category: #'Tesis-DepthTest'!
Object subclass: #DTLeaf3
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tesis-DepthTest'!

!DTLeaf3 methodsFor: 'methods - to test - depth' stamp: 'NMS 2/18/2026 17:38:19'!
depth
	^ 3! !


!classDefinition: #DTLeaf4 category: #'Tesis-DepthTest'!
Object subclass: #DTLeaf4
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tesis-DepthTest'!

!DTLeaf4 methodsFor: 'methods - to test - depth' stamp: 'NMS 2/18/2026 17:38:17'!
depth
	^ 4! !


!classDefinition: #DTLeaf5 category: #'Tesis-DepthTest'!
Object subclass: #DTLeaf5
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tesis-DepthTest'!

!DTLeaf5 methodsFor: 'methods - to test - depth' stamp: 'NMS 2/18/2026 17:38:15'!
depth
	^ 5! !


!classDefinition: #DTLeaf6 category: #'Tesis-DepthTest'!
Object subclass: #DTLeaf6
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tesis-DepthTest'!

!DTLeaf6 methodsFor: 'methods - to test - depth' stamp: 'NMS 2/18/2026 17:38:12'!
depth
	^ 6! !


!classDefinition: #DTSender category: #'Tesis-DepthTest'!
Object subclass: #DTSender
	instanceVariableNames: 'receiver'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tesis-DepthTest'!

!DTSender methodsFor: 'methods - to test - depth' stamp: 'NMS 2/21/2026 17:44:46'!
depth1
	receiver depth.! !

!DTSender methodsFor: 'methods - to test - depth' stamp: 'NMS 2/21/2026 17:45:03'!
depth13
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.! !

!DTSender methodsFor: 'methods - to test - depth' stamp: 'NMS 2/21/2026 17:44:20'!
depth2
	receiver depth.
	receiver depth.! !

!DTSender methodsFor: 'methods - to test - depth' stamp: 'NMS 2/21/2026 17:45:45'!
depth21
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.! !

!DTSender methodsFor: 'methods - to test - depth' stamp: 'NMS 2/21/2026 17:44:16'!
depth3
	receiver depth.
	receiver depth.
	receiver depth.! !

!DTSender methodsFor: 'methods - to test - depth' stamp: 'NMS 2/21/2026 17:46:15'!
depth34
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
! !

!DTSender methodsFor: 'methods - to test - depth' stamp: 'NMS 2/21/2026 17:44:30'!
depth5
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.! !

!DTSender methodsFor: 'methods - to test - depth' stamp: 'NMS 2/21/2026 17:44:37'!
depth8
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.
	receiver depth.! !


!DTSender methodsFor: 'initialization' stamp: 'NMS 2/18/2026 18:16:10'!
receiver: aReceiver
	receiver := aReceiver.! !


!classDefinition: #DepthPICBenchmark category: #'Tesis-DepthTest'!
Object subclass: #DepthPICBenchmark
	instanceVariableNames: 'rng sender targets'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tesis-DepthTest'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepthPICBenchmark class' category: #'Tesis-DepthTest'!
DepthPICBenchmark class
	instanceVariableNames: 'maxVMStats rng sender runName picEntries stressedMethod timesToIterate gcMatched targets initializationVMStats'!

!DepthPICBenchmark class methodsFor: 'initialization' stamp: 'NMS 2/28/2026 00:23:58'!
initializeWithPicEntries: aPicEntries stressMethod: aStressedMethod iterate: aTimesToIterate saveItAsIterationName: aRunName

	picEntries := aPicEntries.
	stressedMethod := aStressedMethod.
	timesToIterate := aTimesToIterate.
	runName := aRunName.
	gcMatched := true.

	sender := DTSender new.

	targets := {
		DTLeaf1 new.
		DTLeaf2 new.
		DTLeaf3 new.
		DTLeaf4 new.
		DTLeaf5 new.
		DTLeaf6 new
	}.

	"Now livetyping knows which type is each -- until picEntries"
	(1 to: picEntries) do: [ :i |
		sender receiver: (targets at: i)
	].

	rng := Random seed: 666.
	initializationVMStats := Array new: 82 withAll: 0.
	maxVMStats := Array new: 82 withAll: 0.! !


!DepthPICBenchmark class methodsFor: 'measure - runner' stamp: 'NMS 2/19/2026 13:04:36'!
runPerformanceTestJIT

	self runTestWriteResultsTo: runName, '/results_jit_flow.csv' for: [
		self measureWithJIT
	].

	gcMatched ifTrue: [
		Smalltalk quitPrimitive: 0.
	] ifFalse: [
		Smalltalk quitPrimitive: 1.
	]! !

!DepthPICBenchmark class methodsFor: 'measure - runner' stamp: 'NMS 2/18/2026 18:10:18'!
runPerformanceTestNormalFlowCurrentBehaviour

	self runTestWriteResultsTo: runName, '/results_normal_flow_current_behaviour.csv' for: [
		self measureWithNormalFlowCurrentBehaviour
	].

	gcMatched ifTrue: [
		Smalltalk quitPrimitive: 0.
	] ifFalse: [
		Smalltalk quitPrimitive: 1.
	]! !

!DepthPICBenchmark class methodsFor: 'measure - runner' stamp: 'NMS 2/19/2026 13:04:59'!
runPerformanceTestNormalFlowWorstCase

	self runTestWriteResultsTo: runName, '/results_normal_flow_worst_case.csv' for: [
		self measureWithNormalFlowWorstCase
	].

	gcMatched ifTrue: [
		Smalltalk quitPrimitive: 0.
	] ifFalse: [
		Smalltalk quitPrimitive: 1.
	]! !

!DepthPICBenchmark class methodsFor: 'measure - runner' stamp: 'NMS 2/18/2026 18:09:43'!
runPerformanceTestPIC 

	self runTestWriteResultsTo: runName, '/results_pic_flow.csv' for: [
		self measureWithPIC
	].

	gcMatched ifTrue: [
		Smalltalk quitPrimitive: 0.
	] ifFalse: [
		Smalltalk quitPrimitive: 1.
	]! !


!DepthPICBenchmark class methodsFor: 'results' stamp: 'NMS 2/28/2026 00:27:57'!
getVMStatsLine: vmStats
	| line |

	line := stressedMethod, ',', picEntries asString.

	vmStats do: [ :e |
		line := line, ',', e asString.
	].

	line := line, String lfString.
	^line.! !

!DepthPICBenchmark class methodsFor: 'results' stamp: 'NMS 2/28/2026 01:07:46'!
runTestWriteResultsTo: aCSVFile for: aBlock

	| fileName resultsFileEntry vmStatsFileEntryBefore vmStatsFileEntryAfter line time |

	time := aBlock value.

	fileName := (aCSVFile findTokens: '.') at: 1.

	resultsFileEntry := aCSVFile asFileEntry.
	vmStatsFileEntryBefore := (fileName , '_vmstats_before_execution.csv') asFileEntry.
	vmStatsFileEntryAfter := (fileName , '_vmstats_after_execution.csv') asFileEntry.

	vmStatsFileEntryBefore appendContents: (self getVMStatsLine: initializationVMStats).

	line := stressedMethod, ',', picEntries asString, ',', time asString, String lfString.
	resultsFileEntry appendContents: line.

	vmStatsFileEntryAfter appendContents: (self getVMStatsLine: maxVMStats).! !


!DepthPICBenchmark class methodsFor: 'measure' stamp: 'NMS 2/18/2026 18:25:16'!
calculateTookTime: method
	^[sender executeMethod: method] microsecondsToRun.! !

!DepthPICBenchmark class methodsFor: 'measure' stamp: 'NMS 2/18/2026 18:00:53'!
gcCollect
	Smalltalk garbageCollect
! !

!DepthPICBenchmark class methodsFor: 'measure' stamp: 'NMS 6/11/2026 12:38:33'!
measureWithJIT

	| compiledMethod |

	compiledMethod := sender class >> stressedMethod asSymbol.
	(compiledMethod methodClass) recompile: (compiledMethod selector).

	self gcCollect.
	self updateMaxVMStats: initializationVMStats.
	ProactivePICBuilder jit: compiledMethod withSelector: compiledMethod selector.

	^ self runAndMeasure: compiledMethod in: 'measureWithJITFlow' executeInEach: [:gcTimes | gcTimes].! !

!DepthPICBenchmark class methodsFor: 'measure' stamp: 'NMS 2/28/2026 00:55:22'!
measureWithNormalFlowCurrentBehaviour

	| compiledMethod |

	compiledMethod := sender class >> stressedMethod asSymbol.
	(compiledMethod methodClass) recompile: (compiledMethod selector).

	self gcCollect.
	self updateMaxVMStats: initializationVMStats.
	^ self runAndMeasure: compiledMethod in: 'measureWithNormalFlowCurrentBehaviour' executeInEach: [:gcTimes | gcTimes].! !

!DepthPICBenchmark class methodsFor: 'measure' stamp: 'NMS 2/28/2026 00:55:25'!
measureWithNormalFlowWorstCase

	| compiledMethod |

	compiledMethod := sender class >> stressedMethod asSymbol.

	self gcCollect.
	self updateMaxVMStats: initializationVMStats.
	^ self runAndMeasure: compiledMethod in: 'measureWithNormalFlowWorstCase' executeInEach: [:gcTimes |
		(compiledMethod methodClass) recompile: (compiledMethod selector).
		Smalltalk vmParameterAt: PerformanceTest gcParameter.
	].! !

!DepthPICBenchmark class methodsFor: 'measure' stamp: 'NMS 6/11/2026 12:38:33'!
measureWithPIC

	| compiledMethod |

	compiledMethod := sender class >> stressedMethod asSymbol.
	(compiledMethod methodClass) recompile: (compiledMethod selector).

	self gcCollect.
	self updateMaxVMStats: initializationVMStats.
	ProactivePICBuilder generatePICFor: compiledMethod.

	^ self runAndMeasure: compiledMethod in: 'measureWithPIC' executeInEach: [:gcTimes | gcTimes].! !

!DepthPICBenchmark class methodsFor: 'measure' stamp: 'NMS 2/18/2026 18:22:34'!
nextIndexUpTo: k 
	^ ((1 to: k) atRandom: rng)! !

!DepthPICBenchmark class methodsFor: 'measure' stamp: 'NMS 2/28/2026 01:41:03'!
runAndMeasure: aCompiledMethod in: flow executeInEach: aBlock

	| gcTimes effectiveBatches batchOk total took batchTotal |

	gcTimes := Smalltalk vmParameterAt: (PerformanceTest gcParameter).
	effectiveBatches := 0.
	total := 0.

	[ effectiveBatches < timesToIterate ] whileTrue: [
		| idx |

		gcTimes := aBlock value: gcTimes.
		batchOk := true.
		batchTotal := 0.

		idx := self nextIndexUpTo: 6.
		sender receiver: (targets at: idx).

		took := self calculateTookTime: aCompiledMethod .

		(gcTimes = (Smalltalk vmParameterAt: (PerformanceTest gcParameter))) ifTrue: [
			batchTotal := batchTotal + took.
			self updateMaxVMStats: maxVMStats.
		] ifFalse: [
			StdIOWriteStream
				stderr
				nextPutAll: 'On: ', flow, ' original gcTimes !!= current gcTimes';
				newLine.

			batchOk := false.
			gcMatched := false.
			gcTimes := Smalltalk vmParameterAt: (PerformanceTest gcParameter).	
		].

		batchOk ifTrue: [
			total := total + batchTotal.
			effectiveBatches := effectiveBatches + 1
		].
	].

	^total! !

!DepthPICBenchmark class methodsFor: 'measure' stamp: 'NMS 6/11/2026 12:38:33'!
updateMaxVMStats: maxStats

	| current picAndJitUsedSpace |

	current := Smalltalk vmParameterAt: 1. maxStats at: 1 put: ((maxStats at: 1) max: current).
	current := Smalltalk vmParameterAt: 2. maxStats at: 2 put: ((maxStats at: 2) max: current).
	current := Smalltalk vmParameterAt: 3. maxStats at: 3 put: ((maxStats at: 3) max: current).
	current := Smalltalk vmParameterAt: 6. maxStats at: 6 put: ((maxStats at: 6) max: current).
	current := Smalltalk vmParameterAt: 7. maxStats at: 7 put: ((maxStats at: 7) max: current).
	current := Smalltalk vmParameterAt: 8. maxStats at: 8 put: ((maxStats at: 8) max: current).
	current := Smalltalk vmParameterAt: 9. maxStats at: 9 put: ((maxStats at: 9) max: current).
	current := Smalltalk vmParameterAt: 10. maxStats at: 10 put: ((maxStats at: 10) max: current).
	current := Smalltalk vmParameterAt: 11. maxStats at: 11 put: ((maxStats at: 11) max: current).
	current := Smalltalk vmParameterAt: 12. maxStats at: 12 put: ((maxStats at: 12) max: current).
	current := Smalltalk vmParameterAt: 13. maxStats at: 13 put: ((maxStats at: 13) max: current).
	current := Smalltalk vmParameterAt: 14. maxStats at: 14 put: ((maxStats at: 14) max: current).
	current := Smalltalk vmParameterAt: 15. maxStats at: 15 put: ((maxStats at: 15) max: current).
	current := Smalltalk vmParameterAt: 16. maxStats at: 16 put: ((maxStats at: 16) max: current).
	current := Smalltalk vmParameterAt: 17. maxStats at: 17 put: ((maxStats at: 17) max: current).
	current := Smalltalk vmParameterAt: 18. maxStats at: 18 put: ((maxStats at: 18) max: current).
	current := Smalltalk vmParameterAt: 19. maxStats at: 19 put: ((maxStats at: 19) max: current).
	current := Smalltalk vmParameterAt: 20. maxStats at: 20 put: ((maxStats at: 20) max: current).
	current := Smalltalk vmParameterAt: 21. maxStats at: 21 put: ((maxStats at: 21) max: current).
	current := Smalltalk vmParameterAt: 22. maxStats at: 22 put: ((maxStats at: 22) max: current).
	current := Smalltalk vmParameterAt: 23. maxStats at: 23 put: ((maxStats at: 23) max: current).
	current := Smalltalk vmParameterAt: 24. maxStats at: 24 put: ((maxStats at: 24) max: current).
	current := Smalltalk vmParameterAt: 25. maxStats at: 25 put: ((maxStats at: 25) max: current).
	current := Smalltalk vmParameterAt: 26. maxStats at: 26 put: ((maxStats at: 26) max: current).
	current := Smalltalk vmParameterAt: 31. maxStats at: 31 put: ((maxStats at: 31) max: current).
	current := Smalltalk vmParameterAt: 32. maxStats at: 32 put: ((maxStats at: 32) max: current).
	current := Smalltalk vmParameterAt: 33. maxStats at: 33 put: ((maxStats at: 33) max: current).
	current := Smalltalk vmParameterAt: 35. maxStats at: 35 put: ((maxStats at: 35) max: current).
	current := Smalltalk vmParameterAt: 36. maxStats at: 36 put: ((maxStats at: 36) max: current).
	current := Smalltalk vmParameterAt: 38. maxStats at: 38 put: ((maxStats at: 38) max: current).
	current := Smalltalk vmParameterAt: 39. maxStats at: 39 put: ((maxStats at: 39) max: current).
	current := Smalltalk vmParameterAt: 40. maxStats at: 40 put: ((maxStats at: 40) max: current).
	current := Smalltalk vmParameterAt: 41. maxStats at: 41 put: ((maxStats at: 41) max: current).
	current := Smalltalk vmParameterAt: 42. maxStats at: 42 put: ((maxStats at: 42) max: current).
	current := Smalltalk vmParameterAt: 43. maxStats at: 43 put: ((maxStats at: 43) max: current).
	current := Smalltalk vmParameterAt: 44. maxStats at: 44 put: ((maxStats at: 44) max: current).
	current := Smalltalk vmParameterAt: 45. maxStats at: 45 put: ((maxStats at: 45) max: current).
	current := Smalltalk vmParameterAt: 46. maxStats at: 46 put: ((maxStats at: 46) max: current).
	current := Smalltalk vmParameterAt: 47. maxStats at: 47 put: ((maxStats at: 47) max: current).
	current := Smalltalk vmParameterAt: 48. maxStats at: 48 put: ((maxStats at: 48) max: current).
	current := Smalltalk vmParameterAt: 49. maxStats at: 49 put: ((maxStats at: 49) max: current).
	current := Smalltalk vmParameterAt: 50. maxStats at: 50 put: ((maxStats at: 50) max: current).
	current := Smalltalk vmParameterAt: 51. maxStats at: 51 put: ((maxStats at: 51) max: current).
	current := Smalltalk vmParameterAt: 52. maxStats at: 52 put: ((maxStats at: 52) max: current).
	current := Smalltalk vmParameterAt: 53. maxStats at: 53 put: ((maxStats at: 53) max: current).
	current := Smalltalk vmParameterAt: 54. maxStats at: 54 put: ((maxStats at: 54) max: current).
	current := Smalltalk vmParameterAt: 55. maxStats at: 55 put: ((maxStats at: 55) max: current).
	current := Smalltalk vmParameterAt: 56. maxStats at: 56 put: ((maxStats at: 56) max: current).
	current := Smalltalk vmParameterAt: 57. maxStats at: 57 put: ((maxStats at: 57) max: current).
	current := Smalltalk vmParameterAt: 58. maxStats at: 58 put: ((maxStats at: 58) max: current).
	current := Smalltalk vmParameterAt: 59. maxStats at: 59 put: ((maxStats at: 59) max: current).
	current := Smalltalk vmParameterAt: 60. maxStats at: 60 put: ((maxStats at: 60) max: current).
	current := Smalltalk vmParameterAt: 61. maxStats at: 61 put: ((maxStats at: 61) max: current).
	current := Smalltalk vmParameterAt: 62. maxStats at: 62 put: ((maxStats at: 62) max: current).
	current := Smalltalk vmParameterAt: 63. maxStats at: 63 put: ((maxStats at: 63) max: current).
	current := Smalltalk vmParameterAt: 64. maxStats at: 64 put: ((maxStats at: 64) max: current).
	current := Smalltalk vmParameterAt: 65. maxStats at: 65 put: ((maxStats at: 65) max: current).
	current := Smalltalk vmParameterAt: 66. maxStats at: 66 put: ((maxStats at: 66) max: current).
	current := Smalltalk vmParameterAt: 67. maxStats at: 67 put: ((maxStats at: 67) max: current).
	current := Smalltalk vmParameterAt: 68. maxStats at: 68 put: ((maxStats at: 68) max: current).
	current := Smalltalk vmParameterAt: 69. maxStats at: 69 put: ((maxStats at: 69) max: current).
	current := Smalltalk vmParameterAt: 70. maxStats at: 70 put: ((maxStats at: 70) max: current).
	current := Smalltalk vmParameterAt: 71. maxStats at: 71 put: ((maxStats at: 71) max: current).
	current := Smalltalk vmParameterAt: 72. maxStats at: 72 put: ((maxStats at: 72) max: current).
	current := Smalltalk vmParameterAt: 73. maxStats at: 73 put: ((maxStats at: 73) max: current).
	current := Smalltalk vmParameterAt: 74. maxStats at: 74 put: ((maxStats at: 74) max: current).
	current := Smalltalk vmParameterAt: 76. maxStats at: 76 put: ((maxStats at: 76) max: current).

	"PIC/JIT stats"
	picAndJitUsedSpace := ProactivePICBuilder getUsedSpace.

	current := picAndJitUsedSpace at: 1. maxStats at: 77 put: ((maxStats at: 77) max: current).
	current := picAndJitUsedSpace at: 2. maxStats at: 78 put: ((maxStats at: 78) max: current).
	current := picAndJitUsedSpace at: 3. maxStats at: 79 put: ((maxStats at: 79) max: current).
	current := picAndJitUsedSpace at: 4. maxStats at: 80 put: ((maxStats at: 80) max: current).
	current := picAndJitUsedSpace at: 5. maxStats at: 81 put: ((maxStats at: 81) max: current).
	current := picAndJitUsedSpace at: 6. maxStats at: 82 put: ((maxStats at: 82) max: current).! !
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 119 121 118 104 106 123 112 125 108 52 119 112 106 52 110 108 117 108 121 104 123 112 118 117 54 106 124 112 122 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 119 121 118 104 106 123 112 125 108 52 119 112 106 52 110 108 117 108 121 104 123 112 118 117 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 53 112 116 104 110 108 17 124 117 112 127 17 83 112 117 124 127 39 61 53 56 56 53 55 52 57 64 52 110 108 117 108 121 112 106 17 127 63 61 102 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 49 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 58 100 17 95 56 56 17 92 117 112 127 39 105 124 112 115 123 39 118 117 39 77 108 105 39 57 62 39 57 55 57 61 39 57 58 65 56 55 65 56 55 39 74 118 116 119 112 115 108 121 65 39 92 105 124 117 123 124 39 74 115 104 117 110 39 56 64 53 56 53 56 39 47 56 124 105 124 117 123 124 56 48 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 49 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 58 39 124 124 112 107 65 39 109 105 109 55 59 107 64 109 52 63 64 62 105 52 59 108 56 59 52 63 59 56 107 52 61 59 55 58 61 105 62 106 62 62 109 107 39 77 108 105 39 57 62 39 57 55 57 61 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 49 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 58 39 124 124 112 107 65 39 109 105 109 55 59 107 64 109 52 63 64 62 105 52 59 108 56 59 52 63 59 56 107 52 61 59 55 58 61 105 62 106 62 62 109 107 39 77 108 105 39 57 62 39 57 55 57 61 17 93 84 65 39 57 55 57 61 55 57 57 62 57 55 59 59 39 117 112 106 118 115 104 122 71 115 108 117 118 125 118 65 109 106 108 117 54 123 108 122 112 122 54 118 122 125 116 52 105 124 112 115 107 108 121 39 75 104 123 108 65 39 77 121 112 39 77 108 105 39 57 62 39 56 62 65 59 59 65 56 60 39 57 55 57 61 39 74 118 116 116 112 123 79 104 122 111 65 39 56 61 60 109 107 62 62 106 107 39 87 115 124 110 112 117 122 65 39 57 55 57 61 55 57 57 62 57 55 59 59 39 117 112 106 118 115 104 122 71 115 108 117 118 125 118 65 109 106 108 117 54 123 108 122 112 122 54 118 122 125 116 52 105 124 112 115 107 108 121 17 199 175 7 116 17 56 64 57 53 56 61 63 53 55 53 56 55 64 17 115 108 117 118 125 118 17 115 108 117 118 125 118 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 56 56 91 56 61 65 57 61 65 55 63 53 55 61 57 64 57 60 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 57 55 57 61 52 55 57 52 56 56 54 91 108 122 112 122 52 87 80 74 53 122 123 17 56 57 56 62 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 56 56 91 56 61 65 57 61 65 56 55 53 57 61 55 55 63 63 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 57 55 57 61 52 55 57 52 56 56 54 91 108 122 112 122 52 91 108 122 123 53 122 123 17 58 59 60 57 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 56 57 91 56 57 65 60 55 65 58 57 53 59 64 62 64 58 59 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 107 128 117 104 116 112 106 52 111 128 119 108 121 119 104 121 104 116 108 123 108 121 122 54 91 108 122 112 122 52 91 108 122 123 53 122 123 17 58 58 64 64 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 56 57 91 56 62 65 59 63 65 56 57 53 57 55 64 55 56 63 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 107 128 117 104 116 112 106 52 111 128 119 108 121 119 104 121 104 116 108 123 108 121 122 54 91 108 122 112 122 52 91 108 122 123 53 122 123 17 58 56 59 62 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 56 58 91 56 63 65 59 62 65 59 55 53 55 56 64 63 56 62 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 75 108 119 123 111 91 108 122 123 53 122 123 17 58 58 60 64 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 56 58 91 56 63 65 59 62 65 59 58 53 58 61 56 56 64 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 87 108 121 109 118 121 116 104 117 106 108 53 122 123 17 57 58 60 60 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 56 64 91 56 56 65 60 55 65 55 61 53 58 60 64 60 63 57 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 75 108 119 123 111 91 108 122 123 53 122 123 17 56 60 57 56 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 56 64 91 56 58 65 56 56 65 60 60 53 64 62 57 57 58 63 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 75 108 119 123 111 91 108 122 123 53 122 123 17 56 62 59 63 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 56 64 91 56 58 65 56 60 65 57 58 53 63 57 64 55 56 58 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 87 108 121 109 118 121 116 104 117 106 108 52 85 108 126 80 107 108 104 53 122 123 17 57 61 60 62 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 57 56 91 56 62 65 60 63 65 57 55 53 57 57 56 59 56 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 75 108 119 123 111 91 108 122 123 53 122 123 17 57 55 56 57 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 57 56 91 56 63 65 57 59 65 56 57 53 61 62 63 62 61 58 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 75 108 119 123 111 91 108 122 123 53 122 123 17 57 55 60 55 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 57 63 91 55 56 65 56 62 65 56 58 53 58 59 64 62 63 58 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 87 108 121 109 118 121 116 104 117 106 108 53 122 123 17 58 64 60 62 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 57 52 57 63 91 55 56 65 56 62 65 56 59 53 60 64 59 60 64 58 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 75 108 119 123 111 91 108 122 123 53 122 123 17 58 57 62 62 63 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 56 91 56 57 65 59 56 65 59 60 53 59 59 57 60 62 57 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 119 121 118 104 106 123 112 125 108 52 119 112 106 52 110 108 117 108 121 104 123 112 118 117 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 87 80 74 53 122 123 17 63 59 60 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 56 91 56 57 65 59 56 65 60 56 53 58 58 56 62 58 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 119 121 118 104 106 123 112 125 108 52 119 112 106 52 110 108 117 108 121 104 123 112 118 117 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 87 108 121 109 118 121 116 104 117 106 108 53 122 123 17 57 57 60 63 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 56 91 56 57 65 59 56 65 60 61 53 55 58 56 55 58 56 52 55 58 65 55 55 17 54 111 118 116 108 54 117 112 106 118 115 104 122 54 109 106 108 117 54 123 108 122 112 122 54 119 121 118 104 106 123 112 125 108 52 119 112 106 52 110 108 117 108 121 104 123 112 118 117 54 122 123 118 124 123 122 54 106 124 112 122 54 91 108 122 112 122 52 75 108 119 123 111 91 108 122 123 53 122 123 17 56 63 60 61 58 17 52 52 52 52 52 52 52 52 52 52 17 17))!