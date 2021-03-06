Class {
	#name : #ExpertDashboardComponent,
	#superclass : #GAFAbstractDashboardComponent,
	#instVars : [
		'cropsExpertDashboardComponent',
		'problemsExpertDashboardComponent',
		'substancesExpertDashboardComponent'
	],
	#category : #'GapAFarm-ui-expert-dashboard'
}

{ #category : #initialization }
ExpertDashboardComponent >> initializeComponents [
	cropsExpertDashboardComponent:=
		(DashboardCardDecorator new
				component: CropsForExpertsDashboardComponent new;
				title: 'Siembra';
				size: 6;
				yourself).
	problemsExpertDashboardComponent:=
		(DashboardCardDecorator new
				component: ProblemsForExpertsDashboardComponent new;
				title: 'Adversidades';
				size: 6;
				yourself).
	substancesExpertDashboardComponent:=
		(DashboardCardDecorator new
				component: SubstancesForExpertsDashboardComponent new;
				title: 'Uso de fitosanitarios';
				size: 8;
				yourself)
]

{ #category : #initialization }
ExpertDashboardComponent >> renderContentOn: html [
	self session gapAFarm updateStatistics.
	super renderContentOn: html
]

{ #category : #accessing }
ExpertDashboardComponent >> widgets [
	^ {cropsExpertDashboardComponent.
	problemsExpertDashboardComponent.
	substancesExpertDashboardComponent}
]
