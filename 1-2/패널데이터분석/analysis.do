clear all

use "C:\Users\Yoon Do Won\Desktop\1학년 2학기\패널데이터분석_박태영 교수님\과제3\ydw_hw2_nobalance.dta" 

xtset hhidpn year
local cov "wght wghth age hhnum chnum fmale notret partret compret marr sdw sing racewht raceblk raceoth togday togweek togtwo togmon togyr tognvr relnear diffbed i.year"

**********
*** FE ***
**********

xtreg sleeprst `cov', fe


******************
*** Pooled OLS ***
******************

reg sleeprst `cov'
testparm i.year


**********
*** RE ***
**********

xtreg sleeprst `cov', re


******************
*** BP-LM Test ***
******************

xttest0


********************
*** Hausman Test ***
********************

// removing time-fixed variants for hausman test
local cov2 "wght wghth age hhnum chnum notret partret marr sdw togday togweek togtwo togmon togyr relnear diffbed i.year"

xtreg sleeprst `cov2', fe
estimates store fixed
xtreg sleeprst `cov2', re
estimates store random
hausman fixed random