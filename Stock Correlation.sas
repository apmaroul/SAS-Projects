/*Lexi Maroulakis
ICA 5

TASK 1
a. a SAS library is a collection of SAS files stored together in the SAS program.
b. dates- for example, 07/30/00 would need "ddmmyy8."
c. SAS stores dates as the number of days since the date entered.
d. The : indicates to SAS to skip blank columns in a dataset.
e. DSD changes delimeter to a "," and allows SAS to read in missing data

TASK 2. creating ICA 5 library*/

LIBNAME ICA5 "C:\Users\apmaroul\Desktop\ICA5";

/* TASK 3. Read in stock.txt*/

DATA ICA5.stock; 
	INFILE "C:\Users\apmaroul\Desktop\ICA5\stock.txt";
		DELIMETER = ",";
		INPUT date YYMMDD11. name : $17 open close high low volume;
RUN;

/*Use SAS PROC to find average daily volume*/

PROC UNIVARIATE data = ICA5.stock;
	VAR volume;
RUN;
/* Use SERIES statement in PROC SGPLOT*/


PROC SGPLOT data = ICA5.stock;
	SERIES X=apple Y=date;
	FORMAT ?day? ?mmddyy10.?; WHERE? name = ?“Apple”?; 
RUN;

/*Use a PROC to investigate all the pairwise correlations*/
PROC CORR data = ICA.stock;
RUN;
