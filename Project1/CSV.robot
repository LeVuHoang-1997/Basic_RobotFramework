*** Settings ***
Library  CSVLib

*** Test Cases ***
Test CSV
	${singlelist}=		Read CSV As Single List		C:/Users/lvuhoang/Desktop/DataDriver.csv
	log to console		${singlelist}
List
	${list}=		read csv as list		C:/Users/lvuhoang/Desktop/DataDriver.csv
	log to console		${list}
Dictionary
    ${dict}=		read csv as dictionary		C:/Users/lvuhoang/Desktop/DataDriver.csv		username    demo
	log to console		${dict}

Value
	${value}=		create list			Legs			Eyes
	${dictWList}=		read csv as dictionary		C:/Users/lvuhoang/Desktop/DataDriver.csv		Animal		${value}	,
	log to console		${dictWList}
