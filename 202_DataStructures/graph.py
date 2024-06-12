#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Mar  7 23:12:56 2022

@author: mollysandler
"""
from queue_nodelist import * #Needed for Breadth First Search
from stack_array import *

class Vertex:
    '''Add additional helper methods if necessary.'''
    
    def __init__(self, key):
        '''Add other attributes as necessary'''
        self.id = key
        self.adjacent_to = []
        self.visited = False
        self.color = None
    
    def getId(self):     #returns the key of vertex
        return self.id
       
    def __lt__(self, other):
       return self.id < other.id


class Graph:
    '''Add additional helper methods if necessary.'''
    
    def __init__(self, filename):
        '''reads in the specification of a graph and creates a graph using an 
           adjacency list representation.  
           You may assume the graph is not empty and is a correct specification.  
           E.g. each edge is 
           represented by a pair of vertices.  Note that the graph is not directed 
           so each edge specified 
           in the input file should appear on the adjacency list of each vertex of 
           the two vertices associated 
           with the edge.'''
        self.vertList = {}
        self.conn = []
        self.numVertices = 0            
            
        self.vert_list = []
        try:
           f = open(filename)
           for line in f:
               list_of_verts = line.split()
               #print(list_of_verts)
               for i in list_of_verts:
                   self.add_vertex(i)
               
               if len(list_of_verts) == 1: #if only one point 
                   continue 
               else: #if a pair of points
                   self.add_edge(list_of_verts[0], list_of_verts[1])
           
           f.close()
        except FileNotFoundError:
           raise FileNotFoundError('this file does not exist')

    
    def add_vertex(self, key): #works ? 
        '''Add vertex to graph, only if the vertex is not already in the graph.'''
        if key not in self.vertList:
            self.numVertices = self.numVertices + 1
            newVertex = Vertex(key)
            self.vertList[key] = newVertex
            #print(newVertex)
            #print(self.vertList)
            return newVertex
        
        else:
            return
        #print(self.vertList)

    def get_vertex(self, key): #works
        '''Return the Vertex object associated with the id. If id is not in the 
        graph, return None'''
        #print(key)
        if self.in_list(key):
            return self.vertList[key] 
        return None
    
    def in_list(self, key):  #works 
        return str(key) in list(self.vertList.keys())
    
    def add_edge(self, v1, v2):
        '''v1 and v2 are vertex id's. As this is an undirected graph, add an 
           edge from v1 to v2 and an edge from v2 to v1.  You can assume that
           v1 and v2 are already in the graph'''
           
        self.vertList[v2].adjacent_to.append(v1) 
        self.vertList[v1].adjacent_to.append(v2)
    
    def get_vertices(self): #works 
        '''Returns a list of id's representing the vertices in the graph, in 
        ascending order'''
        verts = []
        for vertex in self.vertList:
            verts.append(self.vertList[vertex].id)
        return sorted(verts)
    
    def conn_components(self): #works!!!!!!
        '''Returns a list of lists. For example, if there are three connected 
           components then you will return a list of three lists.  Each sub list will contain 
           the vertices (in ascending order) in the connected component represented by 
           that list. The overall list will also be in ascending order based on the first item
           of each sublist.
           This method MUST use Depth First Search logic!''' 
        final = []
        visited = []
        
        vertices = self.get_vertices()
        stack = Stack(len(vertices))
       
        for vertex in vertices:
            temp = []
            
            if vertex not in visited:
                stack.push(vertex)
            
            while stack.is_empty() == False:
                vertex = stack.pop()  
                
                if vertex not in visited:
                    visited.append(vertex)
                    
                    temp.append(vertex)
                        
                    #print(self.get_vertex(vertex).adjacent_to)
                    for num in self.get_vertex(vertex).adjacent_to:
                        if num not in temp and num not in visited:
                            stack.push(num)
            
            if len(temp) > 0:
                final.append(sorted(temp))
        
        return sorted(final)
        
    
    def is_bipartite(self):
       '''Returns True if the graph is bicolorable and False otherwise.
           This method MUST use Breadth First Search logic!'''
       """graphs = self.conn_components()
       for graph in graphs: 
           visited = []
           q = Queue(len(graph))
           q.enqueue(graph[0])
           while not q.is_empty():
               v = q.dequeue()
               if v not in visited:
                   v1_color = self.get_vertex(v).color
                   visited.append(v)
                   v2_color = self.get_vertex(adjacent).color 
                   if v1.color == v2.color:
                       return False
                   if adjacent not in visited:
                       visited.append(adjacent)
       return True""
       """
       color = []
       
       for v in self.vertList.keys(): 
            Vertex(v).color = -1
        
       for v in self.vertList.keys():
            if Vertex(v).color == -1 :
              if setColor(self, Vertex(v), 0) == False:
                    return False
        
       return True
    
    def setColor(self, v, c):
        color = []
        
        Vertex(v).color = c
        
        for w in self[v]:
            #print(w)
            if Vertex(w).color == -1:
                if setColor(self, w, 1-c) == False:
                    return False
            else:
                if color[w] == c:
                    return False
                       
        return True
    

p = Graph("test2.txt")
print(p.conn_components())
print(p.is_bipartite())


    