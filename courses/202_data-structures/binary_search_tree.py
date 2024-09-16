#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Feb  5 16:47:39 2022

@author: mollysandler
"""
class TreeNode: #nodes class
    def __init__(self, key): 
        self.left = None 
        self.right = None 
        self.key = key 
        self.data = None 
    
    def insert(self, key): #inserts a node with key into the correct position if not a duplicate. #works?
        if self.key == None: #if tree is empty
            self.key = key #current key becomes the key
        else: #if tree is not empty 
            if key < self.key: #starts with left subtree
                if self.left == None: #if no left subtree
                    self.left = TreeNode(key) #insert the new node there
                else: #if there is a left subtree
                    self.left.insert(key) #recursion until there is no left subtree
            elif key > self.key: #goes to right subtree
                if self.right == None: #if no right subtree                                    
                    self.right = TreeNode(key) #inserts new node there
                else: #if there is a right subtree
                    self.right.insert(key) #recursion until there is no right subtree
    
    def find_successor(self): #returns successor node in inorder traversal (left, root, right) #works?
        if self.left != None: #if there is a left
            return self.left #return the one thats left
        if self.left == None and self.right != None: #if there is not a left and there is a right 
            return self.right #return the right 
        if self.left == None and self.right == None:
            return None #returns none if no successor
            #gets it wrong for first node
        
    def find_min(self): # returns min value in the tree #works
         if not self.left:
            return self.key
         return self.left.find_min()
   
    def find_max(self): # returns max value in the tree #works
        if not self.right:
            return self.key
        return self.right.find_max()
       
    def inorder_print_tree(self): # print inorder the subtree of self
        if self.left != None: #if there is a left subtree
            self.left.helper_inorder_print_tree() #calls helper function on the left              
        print(self.key) #prints root                              
        if self.right != None: #if there is a right subtree
            self.right.helper_inorder_print_tree() #calls helper fucntion on the right             

    def helper_inorder_print_tree(self): #helper function prints tree in inorder traversal
        if self.left != None: #if there is a left subtree                           
            self.left.helper_inorder_print_tree() #recursion on left
        print(self.key) #prints root                     
        if self.right != None: #if there is a right subtree                           
            self.right.helper_inorder_print_tree() #recursion on right
    
    def print_levels(self, level = 0): #inorder traversal prints list of pairs, [key, level of the node] where root is level 0 
        if self.left != None:                                   
            self.left.print_levels(level + 1)
        print("[" + str(self.key) + "," + str(level) + "]")
        if self.right != None:
            self.right.print_levels(level + 1)
            
    def helper_delete(self, key): #helper function to for delete used later on
        if self.key == key: #if the current key is the key to be deleted
            if self.right and self.left:                         
                [parent, follow] = self.right.find_min(self) #find successor/parent
                if parent.left == follow: #get rid of the successor by setting equal     
                    parent.left = follow.right
                else:
                    parent.right = follow.right #fix the lefts and rights of the rest of the nodes
                follow.left = self.left               
                follow.right = self.right
                return follow
            else:
                if self.left: #the left subtree
                    return self.left                            
                else: #the right subtree
                    return self.right                           
        else:
            if self.key > key:          #if the key is in the left subtree                        
                if self.left:
                    self.left = self.left.helper_delete(key) #recursion magic
            else: #if the key is in the right subtree                            
                if self.right:
                    self.right = self.right.helper_delete(key) #recursion magic
        return self
     
class BinarySearchTree: #binary tree class
    def __init__(self):
        self.root = None   
        
    def find(self, key): # returns True if key is in a node of the tree, else False #works
        current_root = self.root #current is the root                                                
        while current_root != None and current_root.key != key: #if current is not key but exists
            if key < current_root.key: #if key is less than the current                                          
                current_root = current_root.left #goes through left subtree                             
            else: #if the key is larger
                current_root = current_root.right  #goes through right subtree                            
        if current_root == None: #if there is no tree                                           
            return False
        else: #if key equals the root
            return True
   
    def insert(self, newkey): #inserts a node with key into the correct position if not a duplicate #works
        tnode = TreeNode(newkey) #makes new node
        if self.root == None: #if no tree
            self.root = tnode #root becomes new node
        else:
            return self.insert_help(tnode, self.root, newkey) #calls helper function

    def insert_help(self, tnode, comp, key): #takes new node and comparison node
        if tnode.key < comp.key: #if less than comparison node
            if comp.left != None: #left tree
                return self.insert_help(tnode, comp.left, key) #recursion 
            else:
                comp.left = tnode #if no left tree, add node there
        elif tnode.key > comp.key: #if larger than comparison
            if comp.right != None: #if right subtree
                return self.insert_help(tnode, comp.right, key) #recursion 
            else:
                comp.right = tnode #if no subtree, add there
        else:
            if tnode.key == comp.key: #if duplicate
                return #do nothing
    
    def delete(self, key): # deletes the node containing key, assumes such a node exists #works?
        if self.root: #if tree exists then call helper function
            self.root = self.root.helper_delete(key) 
     
    def print_tree(self): # print inorder the entire tree #works
        if self.root: #if root exists                                             
            self.root.inorder_print_tree() #call indorder function frome earlier
             
     
    def is_empty(self): #returns True if tree is empty, else False #works
        if self.root == None: #if root does not exist, return false
            return True
        else: #if root exists, return true
            return False
            

        
        
        
        
        