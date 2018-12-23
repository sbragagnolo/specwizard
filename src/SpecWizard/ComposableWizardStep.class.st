Class {
	#name : #ComposableWizardStep,
	#superclass : #Object,
	#instVars : [
		'widget',
		'outgoing',
		'criteria'
	],
	#category : #SpecWizard
}

{ #category : #adding }
ComposableWizardStep >> addStep: aStep [
	| asStep |
	asStep := aStep asStep.
	self outgoing add: asStep.
	^ asStep
]

{ #category : #adding }
ComposableWizardStep >> asStep [
	^ self
]

{ #category : #adding }
ComposableWizardStep >> atEnd [ 
	^ outgoing isEmpty 
]

{ #category : #adding }
ComposableWizardStep >> build [
	^ widget build
]

{ #category : #adding }
ComposableWizardStep >> initialize [
	super initialize.
	outgoing := Set new.
	criteria := [ true ]
]

{ #category : #testing }
ComposableWizardStep >> isDone [
	^ widget isDone
]

{ #category : #adding }
ComposableWizardStep >> model: aModel [
	self widget model: aModel.
]

{ #category : #adding }
ComposableWizardStep >> next [
	| chosen |
	chosen := outgoing select: [ :n | n shouldFollow: self ].
	^ chosen
		ifEmpty: [ nil ]
		ifNotEmpty: [ self assert: chosen size = 1 description: 'Steps criteria colliding'.
			chosen anyOne ]
]

{ #category : #adding }
ComposableWizardStep >> on: aTwoOptionalParametersBlock stepTo: aStep [
	| asStep |
	asStep := aStep asStep.
	asStep setCriteria: aTwoOptionalParametersBlock.
	^ self addStep: asStep
]

{ #category : #adding }
ComposableWizardStep >> outgoing [
	^ outgoing
]

{ #category : #adding }
ComposableWizardStep >> setCriteria: aTwoOptionalArgsBlock [
	criteria := aTwoOptionalArgsBlock
]

{ #category : #adding }
ComposableWizardStep >> shouldFollow: aPreviouwsStep [
	^ criteria cull: aPreviouwsStep widget cull: aPreviouwsStep widget model
]

{ #category : #adding }
ComposableWizardStep >> widget [
	^widget := widget value
]

{ #category : #adding }
ComposableWizardStep >> widget: aWidget [
	widget := aWidget
]

{ #category : #adding }
ComposableWizardStep >> widgetAsNext [
	^ self widget widgetAsNext
]

{ #category : #adding }
ComposableWizardStep >> widgetAsPrevious [
	^ self widget widgetAsPrevious
]
