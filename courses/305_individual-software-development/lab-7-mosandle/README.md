# Lab 7 — Lambdas, streams and concurrency

## Motivation

Lambda expressions and functional interfaces facilitate a style of programming that at once offers an alternative to and meshes well with the traditional object-oriented approach.

Given that applications are commonly run on machines with multiple processors, that we often want programs to perform multiple tasks, and since we want programs to be responsive to the user while performing these tasks, it is important to break free of the common perception of single-threaded programs.

This lab is meant to give you more practice writing lambdas and using stream pipelines to analyse or transform data. Additionally, you will briefly explore parallel processing using parallel streams, before we dive more deeply into Java concurrency next week.  

## Core tasks

Accept the assignment using the following GitHub classroom link: **LINK IN CANVAS**

### Task 1 — Lambdas

We'll start by just getting some practice writing lambdas.
This task involves the `LambdaTests` file in the `partA` package.

The file contains starter code along with a number of test cases that you need to complete.

The starter code comprises the `mapIt`, `filterIt` and `reduceIt` functions.
These are analogous to the `map`, `filter`, and `reduce` stream operations, but for now we won't use streams.
Read the code and Javadocs for these functions and ensure that you understand what they are doing.
As a bonus, they also use Optionals and generics, so you can get some more practice with those as well.

Your main task is to go through the test cases and complete the assertions (they are marked with `TODO` comments).
The assertions contain the correct expected values, and "dummy" actual values (e.g., `null` or `Optional.empty()`).
Your job is to replace the dummy values with calls to `mapIt`, `filterIt`, and `reduceIt` to perform the operations
that are described in the `TODO` comments.

As you work on these tests, reflect on the flexibility afforded to you when you use lambdas (or more generally, "first-class functions").
The `mapIt`, `filterIt`, and `reduceIt` are _higher-order_ functions—they take functions as parameters.
This enables them to work at a more abstract level, meaning you can use the same functions to do very different things.

### Task 2 — Streams

In this task, you will work files in the `partB` package.

The `CaliforniaCounty` file contains a simple record describing a county in California containing the following information:
 
* `countyName` — The name of the county
* `schoolsWithCS` — The percentage of public high schools in that county that offer any CS courses
* `isRural` — A boolean value indicating whether the county is rural (`true`) or urban (`false`)
* `medianHouseholdIncome` — The median household income in that county, in dollars

Also in `CaliforniaCounty` is a static helper method `readFromFile` that reads the data in the `ca-county-data.json` file and returns a `List<CaliforniaCounty>`.
The data about schools with CS and rural/urban status comes from the California non-profit [CS for CA](https://csforca.org).
They publish [a report](https://csforca.org/the-data/) every few years about the state of access to CS Education in California public schools.

The `readFromFile` method uses the [Jackson Databind](https://github.com/FasterXML/jackson-databind) library to parse a JSON file into a list of Java objects.

We will use stream operations to make sense of this data.

Open up the `StreamTests.java` file and work through the `TODO` comments. You must use stream pipelines to accomplish the required tasks.

**Note**: It would be easy to simply call `forEach` on the list and write code as if we are working with plain old for loops. But that goes against the spirit of the functional programming paradigm that we are afforded with streams and lambdas. Therefore, **you cannot use the `forEach` function except for the first test case that explicitly asks for it.** Explore the Stream API in the IDE or in your browser to identify operations that you can use to solve the problems listed in the test cases.

Note that there is a brief written reflection portion at the end of the `StreamTests.java` file. Don't forget to do that.

## Task 3 — More streams

For this part of the lab, you'll work with the `partC` package.

Thus far, we have seen and used Streams to work with existing collections of data, i.e., data that is already held in memory.
But recall that Streams can be backed by various types of sources other than lists: you can also build stream pipelines to work with generator functions or external sources like data files or, perhaps, continuous streams of data, e.g., clickstreams for user interaction data analytics.

These uses of Streams are in fact closer to what one means when one talks about "streaming" data. (E.g., think about "streaming on Netflix", or "streaming music". You don't have the entire Spotify catalogue downloaded to your computer—your Spotify client is streaming that data and processing chunks of it at a time.)

Consider the example of reading a file in Java.
You may use something like a `Scanner` or a `BufferedReader` to read the file sequentially.
Rarely does one read the entire contents of a file into a list in memory.
This is certainly an option, but is often precluded if the file's contents are too large.

In practice, with streams of large data coming our way, we process data "one by one".
That is, the entire file is not loaded into memory, but it is _streamed_ through our data processing code.

Streams and lambdas in Java 8 onward allow us to write our data processing pipelines as though we are operating on a regular old data structure, without worrying about the fact that our entire data is never read into memory at once.

**Begin by downloading these data files: http://users.csc.calpoly.edu/~ayaank/csc305-lab-7-data.zip**

It is a zipped folder containing two files. Unzip the file and check that you have the following:

* `100-mb.txt` — A roughly 100 mega-byte file containing randomly generated integers, one per line.
* `1-gb.txt` — A roughly 1 giga-byte file containing randomly generated integers, one per line.

(It may take a minute.)

### Task 3.1

Begin working in the file `LargeStreams.java`. Address the `TODO` comments in the two tests:

1. `testReadAllLines` — This test asks you to use the Stream API to declare and execute a stream pipeline, but you won't actually be "streaming" the data through your pipeline. You will be reading the entire file's contents into a `List<String>` using the `Files.readAllLines` method.
  - In addition to asking you to compute a value and pass the test case, the test records and prints its running time in milliseconds. On my computer, this test takes just over 3 seconds to run. That's really long!
  - Once you've run it, write your running time down in a comment in the test case.
2. `testStreamLines` — This test asks you to compute the same information as `testReadAllLines`, but this time you will stream the data through your pipeline instead of reading all the data upfront.
  - You will stream the data using the `Files.lines` method.
  - The `Files.lines` method returns a `Stream<String>`, which will need to be wrapped in a `try-with-resources` block. See [this page](https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html) for details about `try-with-resources` blocks, and ask me or your neighbour if you need assistance with this.
  - Just like before, the test records the time taken to perform the task. On my computer, this took just over 1 second. Much better.
  - Once you've run it, write your running time down in a comment in the test case.

The performance of `testStreamLines` can be attributed to the fact that there's no added upfront cost of reading the entire file before processing it.
We process the data _as we read it_.
The beauty of the Stream API is that we can define our data analysis/transformation pipelines identically either way.

### Task 3.2

Make copies of both tests, and name the new test methods `testReadAllLinesGIANT` and `testStreamLinesGIANT`.
In each new test, change the data file path from `csc305-lab-7-data/10-mb.txt` to `csc305-lab-7-data/1-gb.txt`.

**Your new expected value for these tests is `2147483552`** Paste that number as the expected value in your assertions.

(It is strongly recommended to only run one test at a time from this point forward.)

1. What happens when you run `testReadAllLinesGIANT`?  Answer in a comment in the test method itself.
2. What happens when you run `testStreamAllLinesGIANT`? Answer in a comment in the test method itself (and write the recorded running time).

These two tests should demonstrate the memory-related benefit of _streaming_ large data sources as opposed to reading it all upfront.

### Task 3.3 — Parallel streams

Finally, we will try to speed things up further by using a Parallel Stream.

Make a copy of the `testStreamAllLinesGIANT`, and name the new test `testStreamLinesParallel`.

You only need to change one thing in the new test: before adding stream operations to the stream you obtained from the call to `Files.lines(....)`, turn the stream into a parallel stream. You can do this by calling `parallel()` on it as one of the intermediate operations.

If you copied the test, it should have printed out its running time. Is it faster than the previous, non-parallel (sequential) stream? By how much? On my laptop the parallel stream is about 4 seconds faster.

4 seconds is a big win! It may be tempting to use a parallel stream everywhere. But please recall the very real drawbacks to doing this indiscriminately from our lecture discussion.

## Submission

As usual, push to GitHub and demonstrate your lab to me during lab or office hours. Since some of these tests (in part 3 specifically) will take quite long to run, please don't forget to write your running times down as comments in all those tests where applicable.
