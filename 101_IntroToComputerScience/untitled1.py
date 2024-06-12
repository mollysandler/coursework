#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Sep 30 16:12:42 2021

@author: mollysandler
"""
 
userLocation = input('please enter a location for the AQI to be calculated for: ')

userPM2 = int(input('please enter the concentration of the PM.25 pollutant: '))
userPM10 = int(input('please enter the concentration of the PM10 pollutant: '))
userNO = int(input('please enter the concentration of the NO2 pollutant: '))
userSO = int(input('please enter the concentration of the SO2 pollutant: '))
userCO = int(input('please enter the concentration of the CO pollutant: '))

if 0 < userPM2 < 12.0 :
    print ("The PM2.5 concentration is " +str(userPM2)+ " and the category is Good")
    aqiPM2 = (50-0)/(12.0-0)*(userPM2-0)+0
elif 12.1 < userPM2 < 35.4 :
    print ("The PM2.5 concentration is " +str(userPM2)+ " and the category is Moderate")
    aqiPM2 = (100-51)/(35.4-12.1)*(userPM2-12.1)+51
elif 35.5 < userPM2 < 55.4 :
    print ("The PM2.5 concentration is " +str(userPM2)+ " and the category is Unhealthy for Sensetive Groups")
    aqiPM2 = (150-101)/(55.4-35.5)*(userPM2-35.5)+101
elif 55.5 < userPM2 < 150.4 :
    print ("The PM2.5 concentration is " +str(userPM2)+ " and the category is Unhealthy")
    aqiPM2 = (200-151)/(150.4-55.5)*(userPM2-55.5)+151
elif 150.5 < userPM2 < 250.4 :
    print ("The PM2.5 concentration is " +str(userPM2)+ " and the category is Very Unhealthy")
    aqiPM2 = (300-201)/(250.4-150.4)*(userPM2-150.5)+201
elif 250.5 < userPM2 < 500.4 :
    print ("The PM2.5 concentration is " +str(userPM2)+ " and the category is Hazardous")
    aqiPM2 = (500-301)/(500.4-250.5)*(userPM2-250.5)+301
else:
    print ("That PM2.5 concentration is not an option")

if 0 < userPM10 < 54 :
    print ("The PM2.5 concentration is " +str(userPM10)+ " and the category is Good")
    aqiPM10 = (50-0)/(54-0)*(userPM10-0)+0
elif 55 < userPM10 < 154 :
    print ("The PM2.5 concentration is " +str(userPM10)+ " and the category is Moderate")
    aqiPM10 = (100-51)/(154-55)*(userPM10-55)+51
elif 155 < userPM10 < 254:
    print ("The PM2.5 concentration is " +str(userPM10)+ " and the category is Unhealthy for Sensetive Groups")
    aqiPM10 = (150-101)/(254-155)*(userPM10-155)+151
elif 255 < userPM10 < 354:
    print ("The PM2.5 concentration is " +str(userPM10)+ " and the category is Unhealthy")
    aqiPM10 = (200-151)/(354-255)*(userPM10-255)+151
elif 355 < userPM10 < 424:
    print ("The PM2.5 concentration is " +str(userPM10)+ " and the category is Very Unhealthy")
    aqiPM10 = (300-201)/(424-355)*(userPM10-355)+201
elif 425 < userPM10 < 604:
    print ("The PM2.5 concentration is " +str(userPM10)+ " and the category is Hazardous")
    aqiPM10 = (500-301)/(604-425)*(userPM10-425)+301
else:
    print ("That PM10 concentration is not an option")
    
if 0 < userNO < 53:
    print ("The PM2.5 concentration is " +str(userNO)+ " and the category is Good")
    aqiNO = (50-0)/(53-0)*(userNO-0)+0
elif 54 < userNO < 100:
    print ("The PM2.5 concentration is " +str(userNO)+ " and the category is Moderate")
    aqiNO = (100-51)/(100-54)*(userNO-54)+51
elif 101 < userNO < 360:
    print ("The PM2.5 concentration is " +str(userNO)+ " and the category is Unhealthy for Sensetive Groups")
    aqiNO = (150-101)/(360-101)*(userNO-101)+101
elif 361 < userNO < 649:
    print ("The PM2.5 concentration is " +str(userNO)+ " and the category is Unhealthy")
    aqiNO = (200-151)/(649-361)*(userNO-361)+151
elif 650 < userNO < 1249:
    print ("The PM2.5 concentration is " +str(userNO)+ " and the category is Very Unhealthy")
    aqiNO = (300-201)/(1249-650)*(userNO-650)+201
elif 1250 < userNO < 2049:
    print ("The PM2.5 concentration is " +str(userNO)+ " and the category is Hazardous")
    aqiNO = (500-301)/(2049-1250)*(userNO-1250)+301
else:
    print ("That NO2 concentration is not an option")
    
if 0 < userSO < 35:
    print ("The PM2.5 concentration is " +str(userSO)+ " and the category is Good")
    aqiSO = (50-0)/(35-0)*(userSO-0)+0
elif 36 < userSO < 75:
    print ("The PM2.5 concentration is " +str(userSO)+ " and the category is Moderate")
    aqiSO = (100-51)/(75-36)*(userSO-36)+51
elif 76 < userSO < 185:
    print ("The PM2.5 concentration is " +str(userSO)+ " and the category is Unhealthy for Sensetive Groups")
    aqiSO = (150-101)/(185-76)*(userSO-76)+101
elif 186 < userSO < 304:
    print ("The PM2.5 concentration is " +str(userSO)+ " and the category is Unhealthy")
    aqiSO = (200-151)/(304-186)*(userSO-186)+151
elif 305 < userSO < 604:
    print ("The PM2.5 concentration is " +str(userSO)+ " and the category is Very Unhealthy")
    aqiSO = (300-201)/(604-305)*(userSO-305)+201
elif 605 < userSO < 1004:
    print ("The PM2.5 concentration is " +str(userSO)+ " and the category is Hazardous")
    aqiSO = (500-301)/(1004-605)*(userSO-605)+301
else:
    print ("ERROR-that SO2 level is not an option")
    
if 0 < userCO < 4.4:
    print ("The PM2.5 concentration is " +str(userCO)+ " and the category is Good")
    aqiCO = (50-0)/(4.4-0)*(userCO-0)+0
elif 4.5 < userCO < 9.4:
    print ("The PM2.5 concentration is " +str(userCO)+ " and the category is Moderate")
    aqiCO = (100-51)/(9.4-4.5)*(userCO-4.5)+51
elif 9.5 < userCO < 12.4:
    print ("The PM2.5 concentration is " +str(userCO)+ " and the category is Unhealthy for Sensetive Groups")
    aqiCO = (150-101)/(12.4-9.5)*(userCO-9.5)+101
elif 12.5 < userCO < 15.4:
    print ("The PM2.5 concentration is " +str(userCO)+ " and the category is Unhealthy")
    aqiCO = (200-151)/(15.4-12.5)*(userCO-12.5)+151
elif 15.5 < userCO < 30.4:
    print ("The PM2.5 concentration is " +str(userCO)+ " and the category is Very Unhealthy")
    aqiCO = (300-201)/(30.4-15.5)*(userCO-15.5)+201
elif 30.5 < userCO < 50.4:
    print ("The PM2.5 concentration is " +str(userCO)+ " and the category is Hazardous")
    aqiCO = (500-301)/(50.4-30.5)*(userCO-30.5)+301
else:
    print ("That CO concentration is not an option")
    
    
    
if 0 < aqiPM2 < 50:
    AQ1 = ("Good")
elif 51 < aqiPM2 < 100:
    AQ1 = ("Moderate")
elif 101 < aqiPM2 < 150:
    AQ1 = ("Unhealthy for Sensitive Groups")
elif 151 < aqiPM2 < 200:
    AQ1 = ("Unhealthy")
elif 201 < aqiPM2 < 300:
    AQI = ("Very Unhealthy")
elif 301 < aqiPM2 < 500:
    AQ1 = ("Hazardous")
else:
    print ("Oops! Something went wrong. Please try again")
    
if 0 < aqiPM10 < 50:
    AQ2 = ("Good")
elif 51 < aqiPM10 < 100:
    AQ2 = ("Moderate")
elif 101 < aqiPM10 < 150:
    AQ2 = ("Unhealthy for Sensitive Groups")
elif 151 < aqiPM10 < 200:
    AQ2 = ("Unhealthy")
elif 201 < aqiPM10 < 300:
    AQ2 = ("Very Unhealthy")
elif 301 < aqiPM10 < 500:
    AQ2 = ("Hazardous")
else:
    print ("Oops! Something went wrong. Please try again")
    
if 0 < aqiNO < 50:
    AQ3 = ("Good")
elif 51 < aqiNO < 100:
    AQ3 = ("Moderate")
elif 101 < aqiNO < 150:
    AQ3 = ("Unhealthy for Sensitive Groups")
elif 151 < aqiNO < 200:
    AQ3 = ("Unhealthy")
elif 201 < aqiNO < 300:
    AQ3 = ("Very Unhealthy")
elif 301 < aqiNO < 500:
    AQ3 = ("Hazardous")
else:
    print ("Oops! Something went wrong. Please try again")
    
if 0 < aqiSO < 50:
    AQ4 = ("Good")
elif 51 < aqiSO < 100:
    AQ4 = ("Moderate")
elif 101 < aqiSO < 150:
    AQ4 = ("Unhealthy for Sensitive Groups")
elif 151 < aqiSO < 200:
    AQ4 = ("Unhealthy")
elif 201 < aqiSO < 300:
    AQ4 = ("Very Unhealthy")
elif 301 < aqiSO < 500:
    AQ4 = ("Hazardous")
else:
    print ("Oops! Something went wrong. Please try again")
    
if 0 < aqiCO < 50:
    AQ5 = ("Good")
elif 51 < aqiCO < 100:
    AQ5 = ("Moderate")
elif 101 < aqiCO < 150:
    AQ5 = ("Unhealthy for Sensitive Groups")
elif 151 < aqiCO < 200:
    AQ5 = ("Unhealthy")
elif 201 < aqiCO < 300:
    AQ5 = ("Very Unhealthy")
elif 301 < aqiCO < 500:
    AQ5 = ("Hazardous")
else:
    print ("Oops! Something went wrong. Please try again")
    

largest = []
largest.append(str(aqiPM2))
largest.append(str(aqiPM10))
largest.append(str(aqiNO))
largest.append(str(aqiSO))
largest.append(str(aqiCO))  

final = max(largest)

if 0 <= float(final) <= 50:
    print('In ' +userLocation+ ' the overall AQI is ' +final+ ' and the overall category is Good')
elif 51 <= float(final) <= 100:
    print('In ' +userLocation+ ' the overall AQI is ' +final+ ' and the overall category is Moderate')
elif 101 <= float(final) <= 150:
    print('In ' +userLocation+ ' the overall AQI is ' +final+ ' and the overall category is Unhealthy for Sensetive Groups')
elif 151 <= float(final) <= 200:
    print('In ' +userLocation+ ' the overall AQI is ' +final+ ' and the overall category is Unhealthy')
elif 201 <= float(final) <= 300:
    print('In ' +userLocation+ ' the overall AQI is ' +final+ ' and the overall category is Very Unhealthy')
elif 301<= float(final) <= 500:
    print('In ' +userLocation+ ' the overall AQI is ' +final+ ' and the overall category is Hazardous')
else:
    print('Oops! Something went wrong. Please try again.')




