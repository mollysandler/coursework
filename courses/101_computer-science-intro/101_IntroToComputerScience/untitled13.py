#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Nov  2 00:36:17 2021

@author: mollysandler
"""

import math


class Point:
    def __init__(self, x1, y1,):
        self.x1 = x1
        self.y1 = y1
    
    
class Circle:
    def __init__(self, x2, y2, radius):
        self.x2 = x2
        self.y2 = y2
        self.radius = radius
        
        
def point_location(point, circle) :
    distance = math.sqrt((point.x1 - circle.x2)**2 + (point.y1 - circle.y2)**2)
    if distance > circle.radius : 
        return "Outside Circle"
    elif distance < circle.radius :
        return "Inside Circle"
    else:
        return "On Circle" 


Point1 = Point(3, 4)
Circle1 = Circle(0, 0, 6)

point_location(Point1, Circle1)