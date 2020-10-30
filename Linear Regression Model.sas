/**************************
ST307
Lexi Maroulakis
ICA 10
***************************

1. Create ICA 10 library*/

LIBNAME ICA10 "C:\Users\apmaroul\Desktop\ICA10";

/*2. read in iris.txt and call it ICA10.Iris*/

DATA ICA10.iris;
	INFILE "C:\Users\apmaroul\Desktop\ICA10\iris.txt" DSD FIRSTOBS=2;
	INPUT sepal_length sepal_width petal_length petal_width species : $16.;
RUN;

/*3a. Use SGPLOT to create vertical box plot of the sepal_length variable grouped by 
species.*/

PROC SGPLOT data=ICA10.iris;
	vbox sepal_length / group=species;
RUN;
/*Q1: Iris Virginica*/

/*3b. create a scatter plot and make the dots green*/
PROC SGPLOT data=ICA10.iris;
	SCATTER x = sepal_length y = petal_length / MARKERATTRS= (color= green) ;
RUN;

/*4. Fit a linear regression model where petal_length is the dependent variable and 
sepal_length is the independent variable*/

PROC GLM data= ICA10.iris PLOTS= ALL;
	MODEL petal_length = sepal_length/ CLPARM;
RUN;

/*Q1: No, the assumptions for normality hold. The residual plot looks like it may not fit
the assumption for homoskedacisity, but is normal enough.

Q2:
slope estimate:1.857509 
intercept estimate:-7.09583
95% interval: [1.687932993 2.027086338] 

Q3: We are 95% confident that the sepal length of an iris will be between 
1.687932993 and 2.027086338. Petal length and sepal length are highly correlated but 
one length does not cause the other.*/
