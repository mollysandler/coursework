# Lab 3 — Testing

## Motivation

One of the greatest challenges in programming is balancing the need to validate or
test code with the complexity of this validation. Testing a full system is, of course,
incredibly complicated, so we typically start with unit testing. You should have
some exposure to unit testing from the introductory course sequence (CPE/CSC
101, 202, and 203), though you may have found writing such tests to be tedious. In
those courses, the "units" being tested were typically stand-alone functions or
classes with few or simple dependencies. How can we test a single unit (e.g., a class)
with complex dependencies? What if the class interfaces with a database or with a
service across a network?
In this lab we will explore unit testing best practices to improve your skills at writing
such tests, to reduce the tedium of writing tests, and to increase the quality of
these tests. Furthermore, this lab introduces the use of a mock object library to
facilitate the robust testing of classes with complex dependencies.

In this lab we will explore unit testing best practices to improve your skills at writing
such tests, to reduce the tedium of writing tests, and to increase the quality of
these tests. Furthermore, this lab introduces the use of a mock object library to
facilitate the robust testing of classes with complex dependencies.

## Lab goals

1. Devise a set of unit tests utilizing best practices to achieve test coverage.
2. Employ a mock object library when building unit tests for a class with complex,
external dependencies.
3. Explain how dependency injection can facilitate unit testing and the use of
mock object libraries.

## Course learning objectives 

The lab addresses the following course learning objectives.

### Direct

* Use module-level testing.
* Use, at an intermediate level, a language-standard class library.
* Use polymorphic methods and interface types.
* Use Makefiles or a standard IDE.
* Develop and properly organize multi-source file projects.

### Indirect (depending on your process and solution)

* Discuss the features of a standard OO language.
* Use a standard debugger.
* Describe class members and methods

## Overview

This lab is broken up into 3 parts.

* Part 1 gives you an opportunity to refresh your skills using the JUnit assertion library for writing tests. 
* Part 2 gives you experience with using Dependency Injection in your unit tests.
* Part 3 gives you experience with a _mocking_ library, Mockito.

Note that we will cover content in class needed for this lab over a period of a week or so. So by the end of the lab period, we will have covered the information you need to complete the lab, even if we haven't done so on the day the lab is released.

**Starting materials.** Obtain the starter code using this GitHub Classroom link: **LINK IN CANVAS**

## Part 1 — Test writing refresher

For this part you'll work with code in the `part1` package. You are asked to develop a set of unit tests for a provided class (`MovieTicketPriceCalculator`).

To satisfy SonarLint, you should create a package called `test` (within the `part1`) package, and write your tests there.

You can write your tests in one of two ways: 

* **JUnit 5 assertions.** See the [JUnit 5 User Guide](https://junit.org/junit5/docs/current/user-guide/#writing-tests) as a reference (or refer back to your code from CPE/CSC 203).
* **AssertJ.** Alternatively, you can use the AssertJ library for writing "fluent" assertions. See the [AssertJ user guide](https://assertj.github.io/doc/) as a reference.

Necessary dependencies for both testing libraries are provided, so you shouldn't have to install anything.

### Test adequacy

You should develop a small number of tests to account for edge cases and for standard cases (relying on equivalence classes) to achieve 100% branch coverage.
To see code coverage information in IntelliJ IDEA, see [IntelliJ's documentation on code coverage](https://www.jetbrains.com/help/idea/code-coverage.html).

For this part, and in general throughout the course, you should aim for 100% test
coverage (or as close to 100% that you can get).

A quick note on coverage testing: ome people have developed a belief that coverage testing is a measure of quality of both the code being tested and the tests themselves. As such, 100% test coverage has morphed into the primary goal instead of it being a reasonable result of proper testing.

The reality is that 100% test coverage does not guarantee that the tests are good or that the code being tested functions properly. I am not the only coder/programmer that feels this way (https://www.stickyminds.com/article/100-percent-unit-test-coverage-not-enough ). This can be particularly misleading when one is first learning to program
and/or to test. Should we strive for 100% test coverage? Sure, when appropriate. But our primary goal should be to write high quality tests that verify proper functionality.

## Part 2 — Dependency injection and unit tests

For this part, you'll be working with code in the `part2` package.

It contains a simple `EmailService` class, a consumer class `MessagingApp`, and a testing class called `test.TestMessagingApp`. 

**Reduce the coupling (hard-coded dependency) between the service and the consumer classes by refactoring the code and
introducing interfaces.** Additionally, add support for a different kind of message service (`SMSService`) that can be used
by the `MessagingApp`. Use a `MessageService` interface with a `sendMessage` abstract method to do this.

For testing, `test.TestMessagingApp` should choose which `MessageService` to use for any given `MessagingApp` instance.

Dependency injection in Java requires at least the following:

1. Service components should be designed with a base class or an interface. It's better to prefer interfaces or abstract
classes that would define a contract for the services.
2. Consumer classes should be written in terms of the service interfaces.

Write unit tests that tests for the correct printed output from the `processMessages()`
method. In other words, inside the test case, you’ll need to create a `MessageApp` object and then check if it
displays the correct output. One way to test the output that is printed using `System.out.println()` is to
redirect the output stream to an `outputStreamCaptor` object. The following snippets of
code are provided to help you in doing this:

```java
private final PrintStream standardOut = System.out; // save a reference to this so you can give it back later
private final ByteArrayOutputStream outputStreamCaptor = new ByteArrayOutputStream();

@Before
public void setUp() {
    System.setOut(new PrintStream(outputStreamCaptor));
}

@After
public void tearDown() {
    System.setOut(standardOut);
}
```

Be sure to write tests for both types of message services you're supporting.

## Part 3 — Mock object introduction

For this part, you'll deal with code in the `part3` package.

You are asked to develop a unit test for a provided class called `Service`.
That class, however, depends on another class `Database` that you’ll assume to be
not presently available. This dependency is not coded into the `Service` class itself.
Instead, when an instance of this class is created, a concrete implementation of the
expected `Database` class must be provided through a dependency injection. This is
useful to reduce coupling in general, but also provides a useful mechanism to
facilitate testing in a variety of contexts.

Without a concrete implementation of `Database`, however, how can we test the `Service` class?
Certainly, we need to provide an implementation, but in many cases (not this lab, necessarily)
such an implementation can be incredibly complicated or may rely on external resources like a
network connection.

Instead, we can provide a sort of "fake implementation". For this purpose, we will provide a mock 
object as the implementation of the `Database` by using the Mockito library (https://site.mockito.org/)
(there are others, but we will use this one for now).

**First, add the Mockito library to your project.** Download the jar file from here
(https://mvnrepository.com/artifact/org.mockito/mockito-core/5.3.0). You should just be able to add the jar file to
your project's `lib` directory.

**Using a mock object, implement a unit test for `getDatabaseID()`.**
See the [Mockito team's guide](https://javadoc.io/doc/org.mockito/mockito-core/latest/org/mockito/Mockito.html)
as a reference.

When creating a mock object, you're essentially "hard-coding" its behaviours. So for example, you might create a 
fake database object, for which you hard-code behaviours like `isAvailable` and `getUniqueId`. So for a mock database,
you tell Mockito that "when `isAvailable` is called, return `true`". That's because that `isAvailable` check is not
the focus of our testing right now—the `Service` class is. So we _assume_ certain behaviours for the `Database` dependency. 

Dependency injection is what allows the test method to "inject" this mock object into the `Service` instance for testing.
If the `Service` had been responsible for initialising the `Database`, we would not have been able to mock it. 

## Submitting

As usual, the primary deliverable will be a demo shown to me during lab or office hours. **Note that you should still push your code to GitHub by the deadline; changes after the deadline are considered late work unless approved by me.**
