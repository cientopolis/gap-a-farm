Class {
	#name : #GAFAbstractWidgetComponent,
	#superclass : #GAFAbstractTableComponent,
	#instVars : [
		'rows'
	],
	#category : #'GapAFarm-ui-common'
}

{ #category : #accessing }
GAFAbstractWidgetComponent class >> rows: aRowQuantity [
	^ self new
		rows: aRowQuantity;
		yourself
]

{ #category : #accessing }
GAFAbstractWidgetComponent class >> rows: aRowQuantity parent: aParent [
	^ self new
		rows: aRowQuantity;
		parent: aParent;
		yourself
]

{ #category : #accessing }
GAFAbstractWidgetComponent >> elements [
	^ self subclassResponsibility
]

{ #category : #testing }
GAFAbstractWidgetComponent >> hasElementsToShow [
	^ self elements isNotEmpty
]

{ #category : #rendering }
GAFAbstractWidgetComponent >> renderButtonShowAllOn: html [
	html paragraph
		style: 'margin-bottom: 0px;';
		class: 'd-flex flex-row-reverse';
		with: [ html anchor
				id: 'view-All-button';
				callback: [ self viewAll ];
				with: [ html formButton
						bePrimary;
						beSmall;
						with: 'Ampliar' ] ]
]

{ #category : #rendering }
GAFAbstractWidgetComponent >> renderContentOn: html [
	self renderElementsTableOn: html.
	self renderButtonShowAllOn: html
]

{ #category : #accessing }
GAFAbstractWidgetComponent >> rows [
	^ rows
]

{ #category : #accessing }
GAFAbstractWidgetComponent >> rows: anObject [
	rows := anObject
]

{ #category : #rendering }
GAFAbstractWidgetComponent >> viewAll [
	^ self subclassResponsibility 
]
