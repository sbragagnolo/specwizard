Trait {
	#name : #TComposableWizardWidget,
	#instVars : [
		'model'
	],
	#category : #SpecWizard
}

{ #category : #accessing }
TComposableWizardWidget >> asStep [
	^ ComposableWizardStep new
		widget: self;
		yourself
]

{ #category : #accessing }
TComposableWizardWidget >> build [
	^ model
]

{ #category : #accessing }
TComposableWizardWidget >> isDone [
	^ true
]

{ #category : #accessing }
TComposableWizardWidget >> model [
	^ model
]

{ #category : #accessing }
TComposableWizardWidget >> model: aModel [
	model := aModel
]

{ #category : #accessing }
TComposableWizardWidget >> widgetAsNext [
	^ self 
]

{ #category : #accessing }
TComposableWizardWidget >> widgetAsPrevious [
	^ self 
]
