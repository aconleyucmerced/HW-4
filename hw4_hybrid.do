***Amanda Conley
***Sociology 210
***Assignment 3

clear
cd "D:\Amanda's Files\UC Merced\FALL 2019\Soc 290\iPUMS"
capture log close
set more off
log using V2.log, append
use usa_00002.dta

**pulling California out of the data

gen california=.
	
	recode california .=1 if statefip==6 
	recode california .=0 if statefip < 6
	recode california .=0 if statefip > 6



tab california 
sum california


**pulling California counties out of the data

gen ccounties=countyfip


replace ccounties =. if countyfip > 113
replace ccounties =. if countyfip==2 
replace ccounties =. if countyfip==3 
replace ccounties =. if countyfip==4 
replace ccounties =. if countyfip==5 
replace ccounties =. if countyfip==6 
replace ccounties =. if countyfip==9
replace ccounties =. if countyfip==15
replace ccounties =. if countyfip==20
replace ccounties =. if countyfip==21
replace ccounties =. if countyfip==27
replace ccounties =. if countyfip==33
replace ccounties =. if countyfip==35
replace ccounties =. if countyfip==43
replace ccounties =. if countyfip==45
replace ccounties =. if countyfip==49
replace ccounties =. if countyfip==51
replace ccounties =. if countyfip==57
replace ccounties =. if countyfip==63
replace ccounties =. if countyfip==69
replace ccounties =. if countyfip==91
replace ccounties =. if countyfip==93
replace ccounties =. if countyfip==101
replace ccounties =. if countyfip==103
replace ccounties =. if countyfip==105
replace ccounties =. if countyfip==109

replace ccounties =. if statefip > 6
replace ccounties =. if statefip < 6

tab ccounties

replace ccounties =. if countyfip==0 

tab ccounties



gen AIAN=.

	recode AIAN .=0 if race==1 
	recode AIAN .=0 if race==2
	recode AIAN .=1 if race==3
	recode AIAN .=0 if race==4
	recode AIAN .=0 if race==5
	recode AIAN .=0 if race==6
	recode AIAN .=0 if race==7
	recode AIAN .=0 if race==8
	recode AIAN .=0 if race==9
	
tab race AIAN
			

replace ccounties =. if countyfip > 113
replace ccounties =. if countyfip==2 
replace ccounties =. if countyfip==3 
replace ccounties =. if countyfip==4 
replace ccounties =. if countyfip==5 


table ccounties AIAN hinscaid



lab define AIAN  0 "Non-AIAN" 1 "AIAN"

tab AIAN





label define ccounties 1 "Alameda" 7 "Butte" 13 "Contra Costa" 17 "El Dorado" 19 "Fresno" 23 "Humboldt" 25 "Imperial" 29 "Kern" 31 "Kings" 37 "Los Angeles" 39 "Madera" 41 "Marin" 47 "Merced" 53 "Monterey" 55 "Napa" 59 "Orange" 61 "Placer" 65 "Riverside" 67 "Sacramento" 71 "San Bernardino" 73 "San Diego" 75 "San Francisco" 77 "San Joaquin" 79 "San Luis Obispo" 81 "San Mateo" 83 "Santa Barbara" 85 "Santa Clara" 87 "Santa Cruz" 89 "Shasta" 95 "Solano" 97 "Sonoma" 99 "Stanislaus" 107 "Tulare" 111 "Ventura" 113 "Yolo", add
label values ccounties ccounties

tab ccounties hinsihs
tab1 ccounties hinscaid 



describe ccounties
tab ccounties

***Homework 4 

tab racamind
tab educ
tab hcovany
sum age, d

hist age 

table hcovany racamind educ, contents(freq)

gen age_r=age

recode age_r (0/18=1) (19/24=2) (25/40=3) (41/65=4) (66/max=5)
tab age_r

label define age_r 1 "0-18" 2 "19-24" 3 "25-40" 4 "41-65" 5 "65+", replace
label values age_r age_r
label variable age_r "categorize variable age"

table hcovany racamind age_r, contents(freq)

tab racamind age_r




