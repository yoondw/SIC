***************************
*** Cognition Variables ***
***************************


*** 2008 ***
clear all
infile using c:\hrs2008\stata\H08D_R.dct
egen hhidpn=concat(HHID PN)
order hhidpn
drop HHID PN
destring *, replace
rename *, lower
keep hhidpn ld112
save c:\hrs2008\stata\H08D_R_hw2.dta, replace

*** 2010 ***
clear all
infile using c:\hrs2010\stata\H10D_R.dct
egen hhidpn=concat(HHID PN)
order hhidpn
drop HHID PN
destring *, replace
rename *, lower
keep hhidpn md112
save c:\hrs2010\stata\H10D_R_hw2.dta, replace

*** 2012 ***
clear all
infile using c:\hrs2012\stata\H12D_R.dct
egen hhidpn=concat(HHID PN)
order hhidpn
drop HHID PN
destring *, replace
rename *, lower
keep hhidpn nd112
save c:\hrs2012\stata\H12D_R_hw2.dta, replace




********************************
*** Family-related Variables ***
********************************


*** 2008 ***
clear all
infile using c:\hrs2008\stata\H08F_R.dct
egen hhidpn=concat(HHID PN)
order hhidpn
drop HHID PN
destring *, replace
rename *, lower
keep hhidpn lf177 lf174
save c:\hrs2008\stata\H08F_R_hw2.dta, replace

*** 2010 ***
clear all
infile using c:\hrs2010\stata\H10F_R.dct
egen hhidpn=concat(HHID PN)
order hhidpn
drop HHID PN
destring *, replace
rename *, lower
keep hhidpn mf177 mf174
save c:\hrs2010\stata\H10F_R_hw2.dta, replace

*** 2012 ***
clear all
infile using c:\hrs2012\stata\H12F_R.dct
egen hhidpn=concat(HHID PN)
order hhidpn
drop HHID PN
destring *, replace
rename *, lower
keep hhidpn nf177 nf174
save c:\hrs2012\stata\H12F_R_hw2.dta, replace




***************************************
*** Functional Limitation Variables ***
***************************************


*** 2008 ***
clear all
infile using c:\hrs2008\stata\H08G_R.dct
egen hhidpn=concat(HHID PN)
order hhidpn
drop HHID PN
destring *, replace
rename *, lower
keep hhidpn lg025 lg210
save c:\hrs2008\stata\H08G_R_hw2.dta, replace

*** 2010 ***
clear all
infile using c:\hrs2010\stata\H10G_R.dct
egen hhidpn=concat(HHID PN)
order hhidpn
drop HHID PN
destring *, replace
rename *, lower
keep hhidpn mg025 mg210
save c:\hrs2010\stata\H10G_R_hw2.dta, replace

*** 2012 ***
clear all
infile using c:\hrs2012\stata\H12G_R.dct
egen hhidpn=concat(HHID PN)
order hhidpn
drop HHID PN
destring *, replace
rename *, lower
keep hhidpn ng025 ng210
save c:\hrs2012\stata\H12G_R_hw2.dta, replace
 







