show databases; 
use covid_19db;
show tables;
select * from `covid-19 coronavirus`;


#How many lines does the dataset have?
SELECT 
    COUNT(*)
FROM
    `covid-19 coronavirus`;  #to select table name having space then use back tick
#225 lines
  
  
#Exploring some important columns of the dataset "covid-19 coronavirus"
SELECT Country, Population, Continent, `Total Cases`, `Total Deaths`, `Death percentage`
FROM `covid-19 coronavirus`
ORDER BY Continent,Country;


#Checking for duplicate values
SELECT Country, continent,
COUNT(*) as Checking_Dup
FROM `covid-19 coronavirus`
GROUP BY Continent, Country
HAVING Checking_Dup > 1;
#no duplicate values are there


#Checking the quantity of continents and countries
#continents Query:
SELECT COALESCE(Continent, "Total") as Continent,
COUNT(Continent) as Count
FROM(SELECT DISTINCT Continent
FROM `covid-19 coronavirus`) as Subquery
GROUP BY Continent with rollup
ORDER BY Continent;
#The dataset has a total of 6 continents

#Countries Query:
SELECT COUNT(Country) as Qtt_Countries
FROM(SELECT DISTINCT Country
FROM `covid-19 coronavirus`) as Subquery;
#The quantity os countries in the covid_deaths dataset is 225


#Number of deaths per Total Cases Query:
SELECT Country,
(`Total Deaths`/`Total Cases`) AS Ratio_Deaths
FROM `covid-19 coronavirus`
ORDER BY Ratio_Deaths DESC;
#Yemen, Western Sahara and sudan have More Death to Cases Ratio


#Countries having high Deaths
select Country, `Total Deaths` 
from `covid-19 coronavirus`
ORDER BY `Total Deaths` DESC;
#Usa, Brazil and India are the top 3 in the number of deaths. But this information is not enough to say if they are also the higher percentage of deaths versus population.


#which countries have the highest rate of infection in relation to population? (TOP 10) Query:
SELECT Continent, Country,
ROUND((`Total Cases`/Population*100), 2) AS Perc_Pop_Infected
FROM `covid-19 coronavirus`
ORDER BY Perc_Pop_Infected DESC
LIMIT 10;
#This is the percentage of people infected of each country. Of the 10 countries, all are from europe
#The top three countries with highest percentage of people infected is: 'Faeroe Islands', 'Iceland' and 'Andorra'.


#Countinents with the highest number of deaths Query:
SELECT Continent,
Sum(`Total Deaths`) as Total_deaths
FROM `covid-19 coronavirus`
Group By Continent
ORDER BY Total_deaths DESC;
#Europe has the highest Number of Deaths


#Countries with the highest number of Cases Query:
SELECT Country,
`Total Cases` as Total_Cases
FROM `covid-19 coronavirus`
ORDER BY Total_Cases DESC;
#USA, India and Brazil are the top three in total covid cases

#Continents with the highest number of Cases Query:
SELECT Continent,
Sum(`Total Cases`) as Total_Cases
FROM `covid-19 coronavirus`
Group By Continent
ORDER BY Total_Cases DESC;
#Europe has the highest Number of Cases



