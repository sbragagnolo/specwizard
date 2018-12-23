Class {
	#name : #BaselineOfSpecWizard,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpecWizard
}

{ #category : #baselines }
BaselineOfSpecWizard >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec package: #SpecWizard ]
]
