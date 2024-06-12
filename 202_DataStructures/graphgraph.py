#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Mar 13 19:37:22 2022

@author: mollysandler
"""

from stack_array import *  # Needed for Depth First Search
from queue_nodelist import *  # Needed for Breadth First Search



class Vertex:
   """Add additional helper methods if necessary."""

   def __init__(self, key):
       """Add other Attributes as necessary"""
       self.id = key
       self.adjacent_to = []
       self.visited = False
       self.color = None

   def __lt__(self, other):
       return self.id < other.id

   def __repr__(self):
       return self.id



class Graph:
   """Add additional helper methods if necessary."""
   def __init__(self, filename):

       """reads in the specification of a graph and creates a graph using an adjacency list representation.
          You may assume the graph is not empty and is a correct specification.  E.g. each edge is
          represented by a pair of vertices.  Note that the graph is not directed so each edge specified
          in the input file should appear on the adjacency list of each vertex of the two vertices associated
          with the edge."""

       self.vert_list = []
       try:
           f = open(filename)
           for line in f:
               list_of_verts = line.split()
               for i in list_of_verts:
                   self.add_vertex(i)
               self.add_edge(list_of_verts[0], list_of_verts[1])

           f.close()

       except FileNotFoundError:
           raise FileNotFoundError


   def add_vertex(self, key):
       """Add vertex to graph only if the vertex is not already in the graph."""
       if self.get_vertex(key) is not None:
           return
       else:
           vertex = Vertex(key)
           self.vert_list.append(vertex)

   def add_edge(self, v1, v2):
       """v1 and v2 are vertex ID's. As this is an undirected graph, add an
          edge from v1 to v2 and an edge from v2 to v1.  You can assume that
          v1 and v2 are already in the graph"""
       self.get_vertex(v1).adjacent_to.append(self.get_vertex(v2))
       self.get_vertex(v2).adjacent_to.append(self.get_vertex(v1))

   def get_vertex(self, key):
       """Return the Vertex object associated with the ID. If ID is not in the graph, return None"""
       for i in self.vert_list:
           if key == i.id:
               return i
       return None

   def get_vertices(self):
       """Returns a list of ID's representing the vertices in the graph, in ascending order"""
       new_list = []
       for i in self.vert_list:
           new_list.append(i.id)
       new_list.sort()
       return new_list


   def conn_components(self):
       """Return a Python list of lists.  For example: if there are three connected components
          then you will return a list of three lists.  Each sub list will contain the
          vertices (in ascending order) in the connected component represented by that list.
          The overall list will also be in ascending order based on the first item in each sublist."""
       # This method MUST use Depth First Search logic!
       stack = Stack(len(self.vert_list))
       main_list = []
       temp_list = []

       while len(self.vert_list) > 0:
           minimum = min(self.vert_list)
           lst = []

           stack.push(minimum)
           minimum.visited = True

           while not(stack.is_empty()):
               vert = stack.pop()
               self.vert_list.remove(vert)
               temp_list.append(vert)
               lst.append(str(vert))


               for i in vert.adjacent_to:
                   if i.visited is False:
                       stack.push(i)
                       i.visited = True

           lst.sort()
           main_list.append(lst)

       self.vert_list = temp_list
       for i in self.vert_list:
           i.visited = False
       
       return main_list


   def is_bipartite(self):
       """Return True if the graph is bipartite, False otherwise."""

       # This method MUST use Breadth First Search logic!
       for k in self.conn_components():
           queue = Queue(len(self.vert_list))
           lst = []
           for m in k:
               vert = self.get_vertex(m)
               lst.append(vert)
           minimum = min(lst)
           minimum.color = 'lime'
           queue.enqueue(minimum)
           lst.remove(minimum)
           while len(lst) > 0:
               item = queue.dequeue()
               for i in item.adjacent_to:
                   if i.color is None:
                       if item.color == 'lime':
                           i.color = 'cyan'
                       elif item.color == 'cyan':
                           i.color = 'lime'
                       queue.enqueue(i)
                       lst.remove(i)

                   else:
                       if i.color == item.color:
                           return False
           temp = self.is_bipartite_helper(k)
           if temp is False:
               return False
       return True


   def is_bipartite_helper(self, k):
       for i in k:
           vert = self.get_vertex(i)
           for p in vert.adjacent_to:
               if p.color == vert.color:
                   return False
       return True


p = Graph('test1.txt')
print(p.get_vertex(3))

