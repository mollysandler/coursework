#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Feb  6 16:49:03 2022

@author: mollysandler
"""

#from queue_array import Queue

class TreeNode:
    def __init__(self, key, data, left=None, right=None): #initializes the nodes
        self.key = key
        self.data = data
        self.left = left
        self.right = right


class BinarySearchTree:
    def __init__(self):
        # Returns empty BST
        self.root = None

    def is_empty(self):
        # returns True if tree is empty, else False
        if self.root is None:
            return True
        return False

    def search(self, key):
        # returns True if key is in a node of the tree, else False
        if self.is_empty():
            return False
        else:
            return self.search_help(key, self.root)

    def search_help(self, key, holder):
        if holder is None:
            return False
        elif holder.key == key:
            return True
        elif holder.key > key:
            return self.search_help(key, holder.left)
        elif holder.key < key:
            return self.search_help(key, holder.right)

    def insert(self, key, data=None):
        # inserts new node w/ key and data
        # If an item with the given key is already in the BST, 
        # the data in the tree will be replaced with the new data
        if type(key) != int:
            raise ValueError
        tnode = TreeNode(key, data)
        if self.is_empty():
            self.root = tnode
        else:
            return self.insert_help(key, data, self.root)

    def insert_help(self, key, data, holder):
        if key == holder.key:
            holder.data = data
        elif key < holder.key:
            if holder.left is not None:
                self.insert_help(key, data, holder.left)
            else:
                holder.left = TreeNode(key, data)
        elif key > holder.key:
            if holder.right is not None:
                self.insert_help(key, data, holder.right)
            else:
                holder.right = TreeNode(key, data)

    def find_min(self):
        #returns mind value in the tree
        if self.is_empty():
            return None
        return self.min_helper(self.root)

    def min_helper(self, holder):
        while holder.left is not None:
            return self.min_helper(holder.left)
        tuplee = (holder.key, holder.data)
        return tuplee

    def find_max(self):
        #returns max value in the tree
        if self.is_empty():
            return None
        return self.max_help(self.root)

    def max_help(self, holder):
        while holder.right is not None:
            return self.max_help(holder.right)
        tuplee = (holder.key, holder.data)
        return tuplee

    def tree_height(self):  # return the height of the tree
        # returns None if tree is empty
        if self.is_empty():
            return None
        else:
            return self.tree_help(self.root) - 1

    def tree_help(self, holder):
        if holder is None:
            return 0
        counter_left = self.tree_help(holder.left) + 1
        counter_right = self.tree_help(holder.right) + 1
        if counter_left >= counter_right:
            return counter_left
        if counter_right > counter_left:
            return counter_right

    def inorder_list(self):
        # return Python list of BST keys representing in-order traversal of BST
        # DON'T use a default list parameter
        if self.root is None:
            return []
        else:
            return self.in_help(self.root)

    def in_help(self, root):
        listt = []
        if root.right and root.left:
            return listt + self.in_help(root.left) + [root.key] + self.in_help(root.right)
        elif root.right:
            return listt + [root.key] + self.in_help(root.right)
        elif root.left:
            return listt + self.in_help(root.left) + [root.key]
        else:
            listt = listt + [root.key]
            return listt

    def preorder_list(self):
        # return Python list of BST keys representing pre-order traversal of BST
        # DON'T use a default list parameter
        if self.root is None:
            return []
        else:
            return self.pre_help(self.root)

    def pre_help(self, current):
        listt = []
        if current == None:
            return []
        else:
            listt.append(current.key)
            self.pre_help(current.left)
            self.pre_help(current.right)

        return listt

    '''def level_order_list(self):  # return Python list of BST keys representing level-order traversal of BST
        # You MUST use your queue_array data structure from lab 3 to implement this method
        # DON'T attempt to use recursion
        q = Queue(25000)  # Don't change this!
        if self.is_empty():
            return []
        q.enqueue(self.root)
        listt = []
        while q.size() != 0:
            temp = q.dequeue()
            listt.append(temp.key)
            if temp.left is not None:
                q.enqueue(temp.left)
            if temp.right is not None:
                q.enqueue(temp.right)
        return listt'''
    
    
    
if __name__ == '__main__' :
    
    tree = BinarySearchTree()
    tree.insert(5)    
    
    
    