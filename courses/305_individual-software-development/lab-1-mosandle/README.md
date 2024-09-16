# Lab 1 — Development environment

## Motivation

This lab is all about setting up your development environment for the course.
For this course, we'll use IntelliJ IDEA as our preferred development environment.
It's an industry-standard development environment for Java.

If you need to install the IDE and Java, follow the instructions in the video "Downloading and installing IntelliJ IDEA" and then come back to this lab.

If you want to use something else, you're free to do so.
We'll use some IDE features like linting and code coverage feedback, so be sure to learn how to use those in your preferred environment if you're not using IntelliJ IDEA.


This quarter, we'll be using [SonarLint](https://sonarlint.org) to help flag common coding mistakes that are likely to lead to bugs or vulnerabilities.
It will also flag "code smells" that might be indicative of poor design decisions.
SonarLint is available as a plugin in many major IDEs.
This lab assumes you're using IntelliJ IDEA, as I will assume for the rest of the quarter.

This lab is in two parts.
The first part has you install and set up SonarLint, and the second part has you work through an example linting process.

## Objectives

The lab addresses the following objectives:

* Use a standard IDE.

## Part 1

### Installing the plugin

1. Open IntelliJ IDEA and open the Settings window (`IntelliJ IDEA -> Settings` on macOS or `File -> Settings` on Windows).
2. In the pane on the left-hand side, click on `Plugins`. You should see a pane on the right containing a search bar and a list of plugins.
3. Search for "SonarLint" and install the plugin. The plugin vendor should be "SonarSource".
4. After installing, it will prompt you to restart the IDE. Do so.

### Setting up the plugin 

Part of your grade on all programming assignments will depend on you having *no warnings*, either through IntelliJ's own code analysis, or through SonarLint.
Therefore, it's important that you set up SonarLint as described below.

We'll be mostly sticking to the default SonarLint rules with some additions. If you're not using IntelliJ IDEA, please do the due diligence to ensure that your settings in your IDE match with what we'll end up with IntelliJ IDEA.

1. Open the Settings window in IntelliJ IDEA and go to the SonarLint settings (`Settings -> Tools -> Sonarlint`).
2. Go to the `Rules` tab, and expand the list of Java rules. There are a lot of rules! But thankfully there is a search bar.
3. Enable the rules listed below, using the search bar to search for them.
  - Source code should be indented consistently. (Set the indentation level to 4 instead of 2. This is so that the rules don't clash with what the editor in IntelliJ IDEA expects.)
  - An open curly brace should be at the beginning of the line.
  - Close curly brace and the next "else", "catch", and "finally" keywords should be located on the same line.
  - Public types, methods, and fields (API) should be documented with Javadoc.
  - "\=\=" and "!=" should not be used when "equals" is overridden.
  - Lines should not be too long. The default threshold of 120 characters is fine.

Explore the rest of the rules—the plugin has nicely detailed explanations and examples for the reasoning behind individual rules.
You may not agree with all of them.
That is fine—it's a reality of professional and open-source software development that you must adhere to the conventions of the project or the community despite your own preferences.

## Part 2

Now that you've got SonarLint setup, let's look at an example codebase and practice addressing SonarLint warnings.  

We will use GitHub classroom for all programming assignments this quarter.
Use the following link to accept the GitHub classroom repository: **LINK IN THE CANVAS ASSIGNMENT**
If you have not used GitHub classroom before, please see the page on "Accepting a GitHub Classroom assignment" in the "Getting Started" module on Canvas for instructions. (I wrote the instructions for CSC 203, so some Git-related instructions may seem "obvious" to you if you've had experience with Git.)

Once you've cloned the assignment and opened it in IntelliJ IDEA, you should see the following files and folder:

* `src` — By convention, all source code in Java projects are placed in a directory called `src`
  * `Driver.java`
  * `Example.java`

The code in the files above is intentionally buggy and "smelly".
By now, you should have SonarLint set up so that when you open the source files, you see a bunch of warnings. You can see SonarLint warnings for the currently opened file by clicking on the SonarLint tab at the bottom of the screen.

Explore the code, and address the SonarLint warnings.
You can decide which file to start with, depending on how you tend to make sense of code.

The warnings are mostly self-explanatory. You should be able to address most of them (this is also a good opportunity to refresh your memory about how various Java constructs work).

**Note:** For this assignment, ignore the warning about the print statement in `Driver.java`.

One particular warning may not be clear: "Move this file to a named package."

A "package" in Java is really just a folder used to group related classes. Placing source files directly within the `src` folder is considered an anti-pattern. Henceforth, in all programming assignments _all_ source files will be placed inside a named package within the `src` folder. For now, just create a folder called `main` and put the two source files in there, and give them the appropriate package declaration at the top of each file.

In general, you have freedom to organise your files as you see fit—this is yet another design choice you will learn to make this quarter.
This does raise some complications for my ability to auto-grade your assignments.
Therefore, one of the few design/naming restrictions I will place upon you is that you will _always_ have a `Driver.java` file containing your `main` method, and it will _always_ be in the `main` package.

## Submission

All labs will be checked off during the lab session before or on the day it's due. You will need to obtain approval from me beforehand if you're unable to demonstrate your labs to me in person.

Whether you demo your lab to me or not, you will also submit your labs through GitHub. To do this, simply commit and push your changes to the GitHub repository that you cloned when you started the assignment. Make sure to do this _before_ the assignment deadline.