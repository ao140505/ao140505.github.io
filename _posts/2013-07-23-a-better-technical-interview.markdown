---
layout: post
title: A Better Technical Interview
date: 2013-07-23
published: true
comments: true
keywords: "interview, interviewing, technical interviews, how to interview"
---

![imagine a world...where interviews are relevant](/img/imagine_interviews_relevant.jpg)

Eight months ago, I was asked my first whiteboarding question during an
interview. I had to write a ruby method that used an algorithm I
had never heard of to validate a number. I was very nervous and
failed miserably.

Whiteboarding, API quizzes, and riddles are very common interviewing
techniques these days. I think this is a poor approach to interviewing
and will outline suggestions for more effective interview techniques.

## Interview Goals

I think a good interview should at least answer the following
questions about a candidate:

1. Can they program well?
1. Can they learn new things when they need to?
1. Are they a good cultural/personality fit?

## Current Approach

The following techniques are commonly used today:

* writing code on a whiteboard
* puzzle and riddle questions
* reading your resume
* framework and language memorization questions
* programming language design questions

### Writing Code On A Whiteboard

Anyone who spends their time trying to write production-quality code
without testing or executing it is **wasting their time**. Of course,
whiteboarding is useful for brainstorming and sketching out ideas.
Being able to produce bug-free code at the whiteboard is
certainly not a requirement for a programming job though.

### Puzzles And Riddles

Again, this will never come up in real work. After
several years of programming on the job, I have yet to need to solve a riddle
at work. These questions are **completely irrelevant**.

### Reading Your Resume

Resumes are often full of fabrications and half-truths. Consequently, there is
little value in analyzing them.  Anyone who thinks their hiring
decision should primarily be based on a resume should consider this question
by Rob Mee:

> Would you hire an actor without an audition?

Actors are hired to act. Programmers are hired to program. Your resume
does not prove that you can program.

### Framework And Language Memorization Questions

Interviewers often want to see that you have framework and language details memorized.
Yet, framework and language details change frequently. Is it that
valuable to memorize the details of ActiveRecord if
its APIs and best practices change every 3-6 months?

I would rather see that a candidate can:

1. know where to find docs and answers to questions as they come up
2. keep up to date on best practices (read blogs, listen to podcasts,
   etc.)
3. be able to find and read the source code of a library they are using.

So Again, I do not think these questions are relevant.

### Programming Language Design Questions

Topics such as Tail Call Optimization, Closures and other language
design details do not come up often when writing web apps.
Especially, early on in an app.  Why ask these questions if they
aren't relevant to the work?

## What Should We Do?

Clearly, these current interview practices are imperfect.
Let's review the questions we want to answer when interviewing a
programmer:

1. Can they program well?
1. Can they learn new things when they need to?
1. Are they a good cultural/personality fit?

I think there is an easy way that we can get to the point and answers these
questions.

### Pair Programming

As the name suggests, pair programming involves programming. So,
we are off to a good start here already. You can quickly get a
feel for someone's coding ability when you pair with them. So, that
takes care of question #1.

Question #2 is a bit more abstract. For this, I would be looking to see
how the candidate reacts when their code is not working. Or, when they
need to work on something they are unfamiliar with.

A third benefit of pairing is that it gives you insight into the person's
personality.

### Supporting Ideas

I think pairing works even better when supported by a few additional things:

* ask to see their side projects and/or open source projects
* ask behavioral questions (i.e. tell me about a time you worked through
  a team conflict)
* if possible, give them access to some of your code repos and campfire
* have them work on a small project for a day or two

### Benefits:

One of the things that I like best about pairing to interview is
that candidate gets to learn about you. In a traditional interview,
it can be tricky to determine the interviewer's skill level when all they
are doing is asking you how to code up a Fibonacci method or implement a
stack. With pairing, they can get a feel for your skill by interacting
with you.

With this approach, both parties leave the interview better informed. I
think this is great as it should serve to minimize post-hiring surprises
on the job.

Ultimately, this approach forces the interviewer to use their
best judgment to make the hiring call more than they would have to in a
traditional interview. It is no longer about the candidate getting x of n
questions correct. It is less clear than that, but more relevant.

## Further Reading

* [37signals - programming puzzles](http://37signals.com/svn/posts/3071-why-we-dont-hire-programmers-based-on-puzzles-api-quizzes-math-riddles-or-other-parlor-tricks)
* [37signals - Google's hiring puzzle data](http://37signals.com/svn/posts/3543-google-uses-big-data-to-prove-hiring-puzzles-useless-and-gpas-meaningless)
* [Google - Big Data May Not Be Such a Big Deal](http://www.nytimes.com/2013/06/20/business/in-head-hunting-big-data-may-not-be-such-a-big-deal.html?pagewanted=all)
