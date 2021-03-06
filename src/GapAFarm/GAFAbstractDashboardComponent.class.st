Class {
	#name : #GAFAbstractDashboardComponent,
	#superclass : #GAFAbstractComponent,
	#classVars : [
		'NicelyHandleErrors'
	],
	#category : #'GapAFarm-ui-common'
}

{ #category : #'error-handling' }
GAFAbstractDashboardComponent class >> nicelyHandleErrors [
	^ NicelyHandleErrors ifNil: [ true ]
]

{ #category : #'error-handling' }
GAFAbstractDashboardComponent class >> nicelyHandleErrors: aBoolean [
	NicelyHandleErrors := aBoolean
]

{ #category : #initialization }
GAFAbstractDashboardComponent >> initialize [ 
	super initialize.
	self initializeComponents
]

{ #category : #initialization }
GAFAbstractDashboardComponent >> initializeComponents [ 
	^self subclassResponsibility.
]

{ #category : #rendering }
GAFAbstractDashboardComponent >> renderContentCatchingErrorsOn: html [
	| widgets |
	[ widgets := self sortedWidgets.
	html
		row: [ html
				column: [ widgets
						ifNotEmpty: [ (1 to: widgets size by: 2)
								do: [ :pos | html render: (widgets at: pos) ] ] ]
				mediumSize: 6.
			html
				column: [ widgets size > 1
						ifTrue: [ (2 to: widgets size by: 2)
								do: [ :pos | html render: (widgets at: pos) ] ] ]
				mediumSize: 6 ] ]
		on: Error
		do: [ html alert beDanger
				with:
					'No es posible mostrar su tablero de control en este momento debido a un error de sistema. Avise al administrador para que lo resuelva.' ]
]

{ #category : #rendering }
GAFAbstractDashboardComponent >> renderContentOn: html [
	self class nicelyHandleErrors
		ifTrue: [ self renderContentCatchingErrorsOn: html ]
		ifFalse: [ self renderContentShowingErrorsOn: html ]
]

{ #category : #rendering }
GAFAbstractDashboardComponent >> renderContentShowingErrorsOn: html [
	| widgets |
	widgets := self sortedWidgets.
	html
		row: [ html
				column: [ widgets
						ifNotEmpty: [ (1 to: widgets size by: 2)
								do: [ :pos | html render: (widgets at: pos) ] ] ]
				mediumSize: 6.
			html
				column: [ widgets size > 1
						ifTrue: [ (2 to: widgets size by: 2)
								do: [ :pos | html render: (widgets at: pos) ] ] ]
				mediumSize: 6 ]
]

{ #category : #'as yet unclassified' }
GAFAbstractDashboardComponent >> sortedWidgets [
	| widgets |
	widgets := self widgets select: [ :each | each hasElementsToShow ].
	^ widgets
]

{ #category : #initialization }
GAFAbstractDashboardComponent >> widgets [ 
	^self subclassResponsibility.
]
