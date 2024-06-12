#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Jan  6 09:36:45 2022

@author: mollysandler
"""

# CPE 202 Location Class, Lab 1
# represents a location using name, latitude and longitude

class Location:
    #defines the Class
    def __init__(self, name, lat, lon):
        #initializes the class to create objects
        self.name = name    # string for name of location
        self.lat = lat      # latitude in degrees (-90 to 90)
        self.lon = lon      # longitude in degrees (-180 to 180)
        
    def  __repr__(self):
        #allows objects to be printed in this specific way 
        return ("Location('" + str(self.name)+ "', " + str(self.lat)+ ", " + str(self.lon) + ')')
    
    def __eq__(self, other):
        #allows two objects to be equal to each other if they have the same location name
        return (self.name == other.name and self.lat == other.lat and self.lon == other.lon)

def main():
    #defines all the objects as their respective names, latitudes, and longitudes
    loc1 = Location("SLO", 35.3, -120.7)
    loc2 = Location("Paris", 48.9, 2.4)
    loc3 = Location("SLO", 35.3, -120.7)
    #defines object loc4 as loc1
    loc4 = loc1
   
    #prints each object using the repr function 
    print("Location 1:",loc1)
    print("Location 2:",loc2)
    print("Location 3:",loc3)
    print("Location 4:",loc4)
    
    #prints whether or not the locations are equal using the eq function 
    print("\nLocation 1 equals Location 2:",loc1==loc2)
    print("Location 1 equals Location 3:",loc1==loc3)
    print("Location 1 equals Location 4:",loc1==loc4)
    
    locations = [loc1, loc2]
    
    print(loc1 in locations)
    print(loc2 in locations)
    print(loc3 in locations)
    print(loc4 in locations)
    
if __name__ == "__main__":
    main()