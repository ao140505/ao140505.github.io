---
layout: post
title: A Better Technical Interview
date: 2013-07-23
published: true
comments: true
keywords: "interview, interviewing, technical interviews, how to interview"
---

![imagine a world...where interviews are relevant](http://i.qkme.me/3va13d.jpg)

Eight months ago, I was asked my first whiteboarding question during an
interview. I had to write a ruby method that used an algorithm I
had never heard of to validate a number. I was very nervous and
failed miserably.

Whiteboarding, API quizzes, and riddles are very common interviewing
techniques these days. I think this is a poor approach to interviewing
and will outline suggestions for more effective interview techniques.

## Interview Purpose

I think a good interview should at least answer the following three
questions:

1. Does the candidate know how to do the job?
1. Can they learn new things as needed?
1. Are they a good cultural/personality fit?

## Current Approach

The following techniques are commonly used today:

* writing code on a whiteboard
* puzzle and riddle questions
* reading your resume
* framework and language memorization questions
* programming language design questions

### Writing Code On A Whiteboard

...which is a skill that no programming job requires. Anyone who spends
their time trying to write production-quality code without testing or
executing it is simply **wasting their time**. This gives you
little relevant info about a candidate.

### Puzzles And Riddles

Again, this will never come up in real work. After
several years of programming on the job, I have yet to be asked to solve a riddle
at work. These questions are **completely irrelevant**.

### Reading Your Resume

Resumes are often full of fabrications and half-truths; there is
little value in analyzing them.  Anyone who thinks their hiring
decision should primarily be based on a resume should consider this question
by Rob Mee (Pivotal Labs founder):

> Would you hire an actor without an audition?

Actors are hired to act. Programmers are hired to program. Your resume
does not prove that you can program.

### Framework And Language Memorization Questions

Interviewers often want to see that you have framework and language details memorized.
But framework and language details change frequently. Is it that
valuable to memorize the details of ActiveRecord if
its APIs and best practices change every 3-6 months?

I would rather see that a candidate can do the following:

1. know where to find docs and answers to questions as they come up
2. keep up to date on best practices (read blogs, listen to podcasts,
   etc.)
3. be able to find and read the source code of a library they are using.

### Programming Language Design Questions

Topics such as Tail Call Optimization, Closures and other language
design details do not come up often when writing web apps.
Especially, early on in an app.  Why ask these questions if they
aren't relevant to the work?

## A Relevant Interview

Here are two interview approaches that solve the
problems above:

1. Have the candidate write code on a computer that solves a real
   problem. Allow them to use any reference material they wish.
1. Pair with the candidate on real work. Preferably, not a contrived
   example problem.

### Real Code

Benefits:

* see what they can come up with on real work
* how quick are they on a sizable project?
* how do they solve a problem without an answer that is clearly correct?

### Pair on Work

I think this is the best approach to interviewing. A
notable benefit is that both the interviewer and the candidate get to
know one another. This is different from a traditional interview where
the candidate usually does not get to know their potential future
co-workers.

Almost every job that I have accepted has turned out to be different
from what I expected in some ways. I think this could be minimized by
interviewing in a way that both people learn about each other. Pairing
pretty much ensures that this is going to happen.

Benefits:

* candidate gets to know a bit about the skill level of the person
  interviewing them
* you get to see them write real code. how they solve problems and
  design a solution.

## More Info

* [37signals - programming puzzles](http://37signals.com/svn/posts/3071-why-we-dont-hire-programmers-based-on-puzzles-api-quizzes-math-riddles-or-other-parlor-tricks)
* [37signals - Google's hiring puzzle data](http://37signals.com/svn/posts/3543-google-uses-big-data-to-prove-hiring-puzzles-useless-and-gpas-meaningless)
* [Google - Big Data May Not Be Such a Big Deal](http://www.nytimes.com/2013/06/20/business/in-head-hunting-big-data-may-not-be-such-a-big-deal.html?pagewanted=all)
