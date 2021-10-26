clear all
set more off
set maxvar 25000

use "C:\Users\Yoon Do Won\Desktop\1학년 2학기\패널데이터분석_박태영 교수님\rand\randhrs1992_2018v1.dta", clear
destring *, replace

merge 1:1 hhidpn using "c:\hrs2008\stata\H08D_R_hw2.dta"
drop _merge
merge 1:1 hhidpn using "c:\hrs2010\stata\H10D_R_hw2.dta"
drop _merge
merge 1:1 hhidpn using "c:\hrs2012\stata\H12D_R_hw2.dta"
drop _merge

merge 1:1 hhidpn using "c:\hrs2008\stata\H08F_R_hw2.dta"
drop _merge
merge 1:1 hhidpn using "c:\hrs2010\stata\H10F_R_hw2.dta"
drop _merge
merge 1:1 hhidpn using "c:\hrs2012\stata\H12F_R_hw2.dta"
drop _merge

merge 1:1 hhidpn using "c:\hrs2008\stata\H08G_R_hw2.dta"
drop _merge
merge 1:1 hhidpn using "c:\hrs2010\stata\H10G_R_hw2.dta"
drop _merge
merge 1:1 hhidpn using "c:\hrs2012\stata\H12G_R_hw2.dta"
drop _merge



*************************
*** DATA IN RAND FILE ***
*************************


*** sampling weight ***
forv i=9/11 {
	gen wght`i'=r`i'wtresp
	gen wghth`i'=r`i'wthh
}

*** Age ***
forv i=9/11 {
	gen age`i'=r`i'agey_b
}

*** Number of people in household ***
forv i=9/11 {
	gen hhnum`i'=h`i'hhres
}

*** Number of living children ***
forv i=9/11 {
	gen chnum`i'=h`i'child
}

*** Gender ***
forv i=9/11 {
	gen fmale`i'=ragender-1
}

*** R considers self retired ***
forv i=9/11 {
	gen notret`i'=1 if (r`i'sayret==0)
	replace notret`i'=0 if (r`i'sayret==1 | r`i'sayret==2)
	gen partret`i'=1 if (r`i'sayret==2)
	replace partret`i'=0 if (r`i'sayret<=1)
	gen compret`i'=1 if (r`i'sayret==1)
	replace compret`i'=0 if (r`i'sayret==0 | r`i'sayret==2)
}

*** Marital status ***
forv i=9/11 {
	gen marr`i'=1 if (r`i'mstat==1 | r`i'mstat==2 | r`i'mstat==3)
	replace marr`i'=0 if (r`i'mstat>=4 & r`i'mstat<=8)
	gen sdw`i'=1 if (r`i'mstat==4 | r`i'mstat==5 | r`i'mstat==6 | r`i'mstat==7)
	replace sdw`i'=0 if (r`i'mstat>=1 & r`i'mstat<=3) | (r`i'mstat==8)
	gen sing`i'=1 if (r`i'mstat==8)
	replace sing`i'=0 if (r`i'mstat>=1 & r`i'mstat<=7)
}



****************************
*** DATA IN HRS CODEBOOK ***
****************************


*** _F177 : Num times get together with people - per ***
ren lf177 r9f177
ren mf177 r10f177
ren nf177 r11f177

forv i=9/11 {
	gen togday`i'=1 if (r`i'f177==1)
	replace togday`i'=0 if (r`i'f177==2 | r`i'f177==3 | r`i'f177==4 | r`i'f177==5 | r`i'f177==6)
	gen togweek`i'=1 if (r`i'f177==2)
	replace togweek`i'=0 if (r`i'f177==1 | r`i'f177==3 | r`i'f177==4 | r`i'f177==5 | r`i'f177==6)
	gen togtwo`i'=1 if (r`i'f177==3)
	replace togtwo`i'=0 if (r`i'f177==1 | r`i'f177==2 | r`i'f177==4 | r`i'f177==5 | r`i'f177==6)
	gen togmon`i'=1 if (r`i'f177==4)
	replace togmon`i'=0 if (r`i'f177==1 | r`i'f177==2 | r`i'f177==3 | r`i'f177==5 | r`i'f177==6)
	gen togyr`i'=1 if (r`i'f177==5)
	replace togyr`i'=0 if (r`i'f177==1 | r`i'f177==2 | r`i'f177==3 | r`i'f177==4 | r`i'f177==6)
	gen tognvr`i'=1 if (r`i'f177==6)
	replace tognvr`i'=0 if (r`i'f177<=5)
}
	
*** _F174 : Relatives Near ***
ren lf174 r9f174
ren mf174 r10f174
ren nf174 r11f174

forv i=9/11 {
	gen relnear`i'=1 if (r`i'f174==1)
	replace relnear`i'=0 if (r`i'f174==5)
}

*** _D112 : Was sleep restless w/in prev week ***
ren ld112 r9d112
ren md112 r10d112
ren nd112 r11d112

forv i=9/11 {
	gen sleeprst`i'=1 if (r`i'd112==1)
	replace sleeprst`i'=0 if (r`i'd112==5)
}

*** _G025 : Difficulty get in/out bed ***
ren lg025 r9g025
ren mg025 r10g025
ren ng025 r11g025

forv i=9/11 {
	gen diffbed`i'=1 if (r`i'g025==1)
	replace diffbed`i'=0 if (r`i'g025==5)
}	
	
*** _G210 : Difficulty with balance ***
ren lg210 r9g210
ren mg210 r10g210
ren ng210 r11g210

forv i=9/11 {
	gen baloft`i'=1 if (r`i'g210==1)
	replace baloft`i'=0 if (r`i'g210==2 | r`i'g210==3 | r`i'g210==4)
	gen balsome`i'=1 if (r`i'g210==2)
	replace balsome`i'=0 if (r`i'g210==1 | r`i'g210==3 | r`i'g210==4)
	gen balrar`i'=1 if (r`i'g210==3)
	replace balrar`i'=0 if (r`i'g210==1 | r`i'g210==2 | r`i'g210==4)
	gen balnvr`i'=1 if (r`i'g210==4)
	replace balnvr`i'=0 if (r`i'g210==1 | r`i'g210==2 | r`i'g210==3)
}	
	

keep hhidpn wght9-wght11 wghth9-wghth11 age9-age11 hhnum9-hhnum11 chnum9-chnum11 fmale9-fmale11 notret9-notret11 partret9-partret11 compret9-compret11 marr9-marr11 sdw9-sdw11 sing9-sing11 togday9-togday11 togweek9-togweek11 togtwo9-togtwo11 togmon9-togmon11 togyr9-togyr11 tognvr9-tognvr11 relnear9-relnear11 sleeprst9-sleeprst11 diffbed9-diffbed11 baloft9-baloft11 balsome9-balsome11 balrar9-balrar11 balnvr9-balnvr11

reshape long wght wghth age hhnum chnum fmale notret partret compret marr sdw sing togday togweek togtwo togmon togyr tognvr relnear sleeprst diffbed baloft balsome balrar balnvr, i(hhidpn) j(year)
sort hhidpn year



*** cleaning ***
drop if age<50

foreach v in wght wghth age hhnum chnum fmale notret partret compret marr sdw sing togday togweek togtwo togmon togyr tognvr relnear sleeprst diffbed baloft balsome balrar balnvr  {
	drop if missing(`v')
}

by hhidpn: gen count=_N

drop if count==1



*** descriptive statistics - mean ***
tabstat age hhnum chnum fmale notret partret compret marr sdw sing togday togweek togtwo togmon togyr tognvr relnear sleeprst diffbed baloft balsome balrar balnvr [fweight=wght], by(sleeprst) stat(mean) save
tabstatmat temp
matrix temp = temp'
mat li temp, noheader

*** descriptive statistics - midean ***
tabstat age hhnum chnum fmale notret partret compret marr sdw sing togday togweek togtwo togmon togyr tognvr relnear sleeprst diffbed baloft balsome balrar balnvr [fweight=wght], by(sleeprst) stat(median) save
tabstatmat temp
matrix temp = temp'
mat li temp, noheader











