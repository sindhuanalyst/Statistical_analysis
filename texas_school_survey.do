
use "/Users/sindhujamahalingam/Documents/current_spring_2022/course/quantitative analysis/project/TSS 2020 State Data.dta"

**demographics**
**gender**
tab gender
misstable patterns gender
**age**
tab age
misstable patterns age
**employment**
gen emp= .
replace emp=0 if job==0
replace emp=1 if job==1
replace emp=2 if job==.
label variable emp "new: job status"
label define emp_l 0 "no" 1 "yes" 2 "missing"
label values emp emp_l
tab emp
**combine race and ethnicity**
tab latino ethnicity
misstable patterns latino
misstable patterns ethnicity
**race and ethnicity**
gen race_eth=.
replace race_eth=1 if latino== 1
replace race_eth=2 if ethnicity==1 & latino== 0
replace race_eth=3 if ethnicity==2 & latino== 0
replace race_eth=4 if ethnicity==3 & latino== 0
replace race_eth=5 if ethnicity==5 & latino== 0 
replace race_eth=6 if ethnicity==6 & latino== 0 
replace race_eth=6 if ethnicity==4 & latino== 0 
replace race_eth=6 if ethnicity==7 & latino== 0 
***Labeling variables***
label variable race_eth "NEW:Race and ethnicity combined"
label define race_eth1 1 "Hispanic" 2 "American Indian" 3 "Asian American" 4 "African American" 5 "White" 6 "others"
label values race_eth race_eth1
tab race_eth

**updated_ race and ethinicity
gen race_eth_comb=.
replace race_eth_comb=1 if race_eth==1
replace race_eth_comb=2 if race_eth==4
replace race_eth_comb=3 if race_eth==5
replace race_eth_comb=4 if race_eth==2 | race_eth==3 | race_eth==6
tab race_eth_comb
label variable race_eth_comb "New: Race ethnicity combined"
label define race_eth_comb2 1 "Hispanic" 2 "African American" 3 "White" 4 "Others- Am Indian, Asian Am"
label values race_eth_comb race_eth_comb2
tab race_eth_comb




**EXPOSURE: living with both parents**
tab b_parent
misstable patterns b_parent

**OUTCOME: tobacco use**
gen tobacco_use=.
replace tobacco_use=0 if tobac_1==0
replace tobacco_use=1 if tobac_1==8
replace tobacco_use=1 if tobac_1==9
replace tobacco_use=1 if tobac_1==10
replace tobacco_use=1 if tobac_1==11
replace tobacco_use=1 if tobac_1==12
replace tobacco_use=1 if tobac_1==13
replace tobacco_use=1 if tobac_1==14
replace tobacco_use=1 if tobac_1==15
replace tobacco_use=1 if tobac_1==16
replace tobacco_use=1 if tobac_1==17
replace tobacco_use=1 if tobac_1==18
***Labeling variables***
label variable tobacco_use "NEW: tobacco usage"
label define tobacco_use_l 0 "no" 1 "yes" 
label values tobacco_use tobacco_use_l
tab tobacco_use, m

**close friend use tobacco**
gen close_tobac= .
replace close_tobac=0 if tobac_f==1
replace close_tobac=1 if tobac_f==2
replace close_tobac=1 if tobac_f==3
replace close_tobac=1 if tobac_f==4
replace close_tobac=1 if tobac_f==5

label variable close_tobac "NEW: close friend's tobacco use"
label define close_tobac_l 0 "no" 1 "yes" 
label values close_tobac close_tobac_l
tab close_tobac, m



**parents attending school open house**
misstable patterns pta
gen new_pta=.
replace new_pta=0 if pta==0
replace new_pta=1 if pta==1
replace new_pta=2 if pta==.

label variable new_pta "NEW: parent meeting openhouse"
label define new_pta_l 0 "no" 1 "yes" 2 "missing"
label values new_pta new_pta_l
tab new_pta

**participate in academic club**
misstable patterns ec_accomp
gen new_aca=.
replace new_aca=0 if ec_accomp==0
replace new_aca=1 if ec_accomp==1
replace new_aca=2 if ec_accomp==.

label variable new_aca "NEW: attending acdemic club/societies"
label define new_aca_l 0 "no" 1 "yes" 2 "missing"
label values new_aca new_aca_l
tab new_aca


**smokeless tobacco use**
misstable patterns smkless_r
gen smkless_tobac=.
replace smkless_tobac=0 if smkless_r==0
replace smkless_tobac=1 if smkless_r==1
replace smkless_tobac=1 if smkless_r==2
replace smkless_tobac=1 if smkless_r==3

label variable smkless_tobac "NEW: smokeless tobacco use"
label define smkless_tobac_l 0 "no" 1 "yes" 
label values smkless_tobac smkless_tobac_l

**alcohol use**
misstable patterns alc_1
gen alc_use=.
replace alc_use=0 if alc_1==0
replace alc_use=1 if alc_1==8
replace alc_use=1 if alc_1==9
replace alc_use=1 if alc_1==10
replace alc_use=1 if alc_1==11
replace alc_use=1 if alc_1==12
replace alc_use=1 if alc_1==13
replace alc_use=1 if alc_1==14
replace alc_use=1 if alc_1==15
replace alc_use=1 if alc_1==16
replace alc_use=1 if alc_1==17
replace alc_use=1 if alc_1==18
***Labeling variables***
label variable alc_use "NEW: alcohol usage"
label define alc_use_l 0 "no" 1 "yes" 
label values alc_use alc_use_l
tab alc_use, m

tab b_parent alc_use,chi2 expected

**Creating a new variable- Alcohol Use**
 gen alc_use2=.
replace alc_use2=1 if  alc_u==8
replace alc_use2=2 if  alc_u==7
replace alc_use2=2 if  alc_u==6
replace alc_use2=2 if  alc_u==5
replace alc_use2=2 if  alc_u==4
replace alc_use2=3 if  alc_u==3
replace alc_use2=3 if  alc_u==2
tab alc_use2
**Labeling variables**
label variable alc_use2 "NEW:How often do you consume alcohol combined"
label define alc_use2_l 1 "Never used" 2 "Few to many times a year" 3 "Almost everyday"
label values alc_use2 alc_use2_l
tab alc_use2

**age when first started tobacco"**
gen new_age=.
replace new_age=0 if tobac_1==0
replace new_age=1 if tobac_1==8
replace new_age=1 if tobac_1==9
replace new_age=1 if tobac_1==10
replace new_age=1 if tobac_1==11
replace new_age=1 if tobac_1==12
replace new_age=1 if tobac_1==13
replace new_age=2 if tobac_1==14
replace new_age=2 if tobac_1==15
replace new_age=2 if tobac_1==16
replace new_age=2 if tobac_1==17
replace new_age=2 if tobac_1==18

label variable new_age "new: age when first started tobacco"
label define new_age_l 0 "never used" 1 "<=8 to 13" 2 "14 to >=18"
label values new_age new_age_l

**age: recategorized, first started tobacco**
gen new_age_tobac=.
replace new_age_tobac=0 if tobac_1==0
replace new_age_tobac=1 if tobac_1==8
replace new_age_tobac=2 if tobac_1==9
replace new_age_tobac=2 if tobac_1==10
replace new_age_tobac=2 if tobac_1==11
replace new_age_tobac=2 if tobac_1==12
replace new_age_tobac=2 if tobac_1==13
replace new_age_tobac=3 if tobac_1==14
replace new_age_tobac=3 if tobac_1==15
replace new_age_tobac=3 if tobac_1==16
replace new_age_tobac=3 if tobac_1==17
replace new_age_tobac=4 if tobac_1==18

label variable new_age_tobac "new:v2: age when first started tobacco"
label define new_age_tobac_l 0 "never used" 1 "8 or younger" 2 "9 to 13" 3 "14 to 17" 4 ">=18"
label values new_age_tobac new_age_tobac_l
**error**
tab new_age_tobac tobac_u,exact

gen close_alc=.
replace close_alc=1 if alc_f==1
replace close_alc=2 if alc_f==2
replace close_alc=2 if alc_f==3
replace close_alc=3 if alc_f==4
replace close_alc=3 if alc_f==5

label variable close_alc "new: close friend alc use"
label define close_alc_l 1 "never" 2 "some of them" 3 "most"
label values close_alc close_alc_l

** noneed missing**
misstable patterns alc_1



**age**
gen age_recat=.
replace age_recat=1 if age==11
replace age_recat=1 if age==12
replace age_recat=1 if age==13
replace age_recat=1 if age==14
replace age_recat=2 if age==15
replace age_recat=2 if age==16
replace age_recat=2 if age==17
replace age_recat=3 if age==18
replace age_recat=3 if age==19

label variable age_recat "NEW: age of participants"
label define age_recat_l  1 "<or= 11-14" 2 "15-17" 3 "18 or older"
label values age_recat age_recat_l
tab age_recat


**age: alc*
gen age_alc=.
replace age_alc=0 if alc_1==0
replace age_alc=1 if alc_1==8
replace age_alc=1 if alc_1==9
replace age_alc=1 if alc_1==10
replace age_alc=1 if alc_1==11
replace age_alc=1 if alc_1==12
replace age_alc=2 if alc_1==13
replace age_alc=2 if alc_1==14
replace age_alc=2 if alc_1==15
replace age_alc=2 if alc_1==16
replace age_alc=2 if alc_1==17
replace age_alc=3 if alc_1==18
label variable age_alc "NEW: Age when 1st start alc"
label define age_alc_l 0 "Never" 1 "8-12 years" 2 "13-17 years" 3 "18 years and above" 
label values age_alc age_alc_l
tab age_alc


**Rq1 *b-parent, tobacco_use* age, gender, race and ethnicity, employment, close friend's smoking status, smokeless tobacco use, alcohol use.

*table 2*
tab age_recat tobacco_use, chi2 col
tab gender tobacco_use, chi2 col
tab race_eth_comb tobacco_use, chi2 col
tab alc_use tobacco_use,chi2 col
tab b_parent tobacco_use, expected
tab b_parent tobacco_use, chi2 col


logistic tobacco_use b_parent i.age_recat b2.gender b3.race_eth_comb b0.emp b0.close_tobac b0.smkless_tobac b0.alc_use 


*QUESTION 2: To assess if there is an association between alcohol use and average grades of the students using Texas School Survey of Drug and Alcohol Use in the year 2020.*

*•	Main outcome: Average Grades (new_grades)
*	Main exposure: Alcohol use (alc_use)
*	Covariates:   
*	Age (age_recat), gender (gender), race and ethnicity (race_eth_comb),  job , smoking status (tobacco_use), close friend's alcohol use (close_alc), Drug/Alcohol Information from school (new_inf_hthcls)


ologit new_grades alc_use i.age_recat b2.gender b3.race_eth2 b0.job b0.tobacco_use b0.close_alc b0.new_inf_hthcls
ologit new_grades b0.alc_use i.age_recat b2.gender b3.race_eth2 b0.tobacco_use b0.close_alc b0.new_inf_hthcls, or
ologit b1.new_grades b0.alc_use i.age_recat b2.gender b3.race_eth2 b0.tobacco_use b0.close_alc b0.new_inf_hthcls, or


misstable patterns avg_grades 
 * 12%
gen new_grades=.
replace new_grades=1 if avg_grades==5
replace new_grades=2 if avg_grades==4
replace new_grades=3 if avg_grades==3
replace new_grades=4 if avg_grades==2
replace new_grades=5 if avg_grades==1
replace new_grades=6 if avg_grades==.
label variable new_grades "NEW: avg grades"
label define new_grades_l  1 "mostly A"  2 "mostly B" 3 "mostly C" 4 "mostly D" 5 "mostly F" 6 "missing"
label values new_grades new_grades_l
tab new_grades

*close friends alcohol use (alc_f)

gen close_alc= .
replace close_alc=0 if alc_f==1
replace close_alc=1 if alc_f==2
replace close_alc=1 if alc_f==3
replace close_alc=2 if alc_f==4
replace close_alc=3 if alc_f==5

label variable close_alc "NEW: close friend's alc use"
label define close_alc_l 0 "none/never heard" 1 "few/some" 2 "most" 3 "all"
label values close_alc close_alc_l
tab close_alc, m

*Drug/Alcohol Information from school (missing: 11% )

misstable patterns inf_hthcls
gen new_inf_hthcls=.
replace new_inf_hthcls=0 if inf_hthcls==0
replace new_inf_hthcls=1 if inf_hthcls==1
replace new_inf_hthcls=2 if inf_hthcls==.

label variable new_inf_hthcls "NEW: info from school about drug/alc in health class"
label define new_inf_hthcls_l 0 "no" 1 "yes" 2 "missing"
label values new_inf_hthcls new_inf_hthcls_l
tab new_inf_hthcls

*TABLE 2:

tab age_recat new_grades,expected

tab age_recat new_grades,chi2 col



tab new_grades alc_use
tab new_grades age_recat
tab new_grades gender
tab new_grades race_eth_comb

**race_eth for cell size verification
gen race_eth2=.
replace race_eth2=1 if race_eth==1
replace race_eth2=2 if race_eth==2
replace race_eth2=2 if race_eth==3
replace race_eth2=2 if race_eth==4
replace race_eth2=3 if race_eth==5
replace race_eth2=2 if race_eth==6

label variable race_eth2 "NEW_revised:Race and ethnicity"
label define race_eth2_l 1 "Hispanic" 2 "others" 3 "Non-Hispanic White"
label values race_eth2 race_eth2_l
tab race_eth2

tab new_grades emp
*less than 5 cell size**
tab new_grades job


tab new_grades tobacco_use
tab new_grades close_alc
tab new_grades new_inf_hthcls


tab age_recat new_grades,chi2 col
tab gender new_grades,expected
tab gender new_grades,chi2 col
tab race_eth2 new_grades,expected
tab race_eth2 new_grades,chi2 col

*fishers gives error*
tab close_alc new_grades,expected
tab close_alc new_grades,exact col

tab tobacco_use new_grades,expected
tab tobacco_use new_grades,chi2 col

tab new_inf_hthcls new_grades,expected
tab new_inf_hthcls new_grades,chi2 col

*ologit outcome/dependent exposure/predictor
ologit new_grades age_recat




ologit new_grades alc_use b1.age_recat b2.gender b3.race_eth2 b1.job b0.close_alc b0.tobacco_use b0.new_inf_hthcls,or

omodel logit new_grades alc_use age_recat gender race_eth2 job close_alc tobacco_use new_inf_hthcls 
*(p-value is less than 0.05, reject null. Have to change model.)*




gologit2 new_grades alc_use age_recat gender race_eth2 job close_alc tobacco_use new_inf_hthcls , pl lrforce 


*changing it into logistic*
gen new_grades2=.
replace new_grades2=1 if avg_grades==5
replace new_grades2=1 if avg_grades==4
replace new_grades2=0 if avg_grades==3
replace new_grades2=0 if avg_grades==2
replace new_grades2=0 if avg_grades==1

label variable new_grades2 "does student have above avg grade"
label define new_grades2_l 1 "yes" 0 "no" 
label values new_grades2 new_grades2_l
tab new_grades2
*table 2*
tab age_recat new_grades2,expected
tab age_recat new_grades2,chi2 col

tab race_eth_comb new_grades2,expected
tab race_eth_comb new_grades2,chi2 col

tab close_alc new_grades2,expected
tab close_alc new_grades2,chi2 col

tab gender new_grades2,expected
tab  gender new_grades2,chi2 col

tab emp new_grades2,expected
tab emp new_grades2,chi2 col

tab tobacco_use new_grades2,expected
tab tobacco_use new_grades2,chi2 col

tab new_inf_hthcls new_grades2,expected
tab new_inf_hthcls new_grades2,chi2 col
tab alc_use

tab alc_use new_grades2,expected
tab alc_use new_grades2,chi2 col

logistic new_grades2 alc_use b1.age_recat b2.gender b3.race_eth_comb b0.emp b0.close_alc b0.tobacco_use b0.new_inf_hthcls
logistic new_grades2 alc_use b1.age_recat b2.gender b3.race_eth_comb b0.close_alc b0.tobacco_use b0.new_inf_hthcls

