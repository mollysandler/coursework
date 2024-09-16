# Lab 6 — Generics

## Motivation

Anybody that uses Java will very quickly be faced with the concepts of generics.
Generics provide an ability to generalize code by abstracting over types (much like parameters to a method abstract over values).
In much of the code we write, we need only use the existing generic classes in the standard Java library or a third-party library (this is certainly the case in most courses that introduce Java).
Even so, there is great benefit from writing our own generic classes and from understanding some of the more advanced aspects of generics that go beyond using provided classes.

See lecture notes on Generics if you need a reminder about them.

## Goals

* Implement and test a generic class. 
* Identify and address common issues that arise when using generics. 

## Tasks

Obtain the starter code at this GitHub classroom link: **LINK IN CANVAS**

### Task 1 — Multiset

For this task you will implement a class that represents a "multiset" (sometimes called a bag). This is an unordered collection that allows duplicates.

(Note: The two steps are presented in sequence below, but really you should interleave between the two.)

1. You are given an interface `Multiset.java` in the `multiset` package.Write a class that implements the interface. You may choose whatever data structure you feel is appropriate to store the data within your multiset; review the operations dictated by the interface before making this decision.
2. Create a test file in `test/multiset/`. Write some tests to verify that your multiset implementation is working as intended. Do your best to achieve high branch coverage of your multiset implementation with these tests. I've added both JUnit 5 and AssertJ as dependencies to this lab, so you can use whichever assertion library you want.

### Task 2 — Fixing incorrect uses of generics

Code for this part is in the `issues` package (source code in `src/issues/` and test code in `test/issues/`).

For this task you are presented with a collection of files (not necessarily exhibiting good design principles in order ot keep the amount of code small) containing various uses of generics.
Some of these uses are invalid and you are expected to correct them.
A set of extremely primitive unit tests are included (`src/test/issues`) simply to provide some guidance into expected behaviour. (I acknowledge that this is a very academic task, but sometimes this is the right way to focus on specific concepts and issues.)

1. Look at the provided code and note each error.
2. Correct each error in the code itself.

Note that this part of the lab involves compiler errors. IntelliJ won't let you run tests if there are syntax errors in any part of the project even if those parts are not being touched by the test cases. Therefore, this part of the lab frequently asks you to un-comment lines of code to reveal the syntax error. Otherwise, for example, you wouldn't be able to handle Issue #1 because of syntax errors in Issues #2—#5.

These calls to uncomment things are marked with "TODO" comments — they should be flagged by SonarLint.

## Submitting

As usual, submit your code to GitHub and demonstrate your code to me in lab before the deadline.
