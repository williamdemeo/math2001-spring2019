## Math 2001 Lean Information

The files in this subdirectory contain some of the Lean examples we discuss in lecture.
They are based on the examples presented in the book 
[Logic and Proof](https://leanprover.github.io/logic_and_proof/), 
and students are advised to consult the book when trying to understand the examples, 
since they are well documented there.

For more information about the Lean proof assistant, head over to the

[official Lean homepage: http://leanprover.github.io/](http://leanprover.github.io/) 

There you will find instructions that explain how to install Lean on your own machine. (Students are advised, but not required, to have the full version of Lean installed on their own computers in order to pass the course.  Alternatively, the chrome web browser can be used to complete the Lean assignments.)

In the online version of the textbook [Logic and Proof](https://leanprover.github.io/logic_and_proof/), each example of Lean code is presented inside a box that contains a "try it" link at the top right. Clicking this link launches a new browser tab running a version of Lean and containing a window into which Lean commands can be entered and executed (or "type-checked").

In fact, it may even be possible to complete all the Lean homework assignments using only the browser-based version.  However, the assignments that involve Lean will be team-based, and it's highly recommended that at least one person on each team should have a full version of Lean installed on their computer.

---

### Important Information

It is recommended that each student install and use Lean on their own personal computer (instead of simply using the web browser interface).

All the Lean code we look at this semester will work fine in the web browser version of Lean. Up to Chapter 11, the same should be true for locally installed version of Lean (say, on your laptop). However, once we get to Chapter 12, we will need to import a standard 
Lean library by placing the following line *at the top* of your .lean file (this does not apply to the browser interface to Lean):

``` lean
import data.set
```

Unfortunately, this will not work unless Lean knows how to find the `data/set` directory
on your machine. There are at least two ways to tell Lean how to find that directory, which we now describe.  

**If you have any difficulty with this, or any other aspect of using Lean, please post a message on Piazza!**

The first way to tell Lean how to find the `data/set` directory involves creating your own Lean package with a configuration file that lists the library dependencies of your package.  You are welcome to investigate how to do this if you wish, but *it is more than we need*.  

The second approach is much simpler.  If you want to import any Lean libraries from inside an individual Lean file (that is not associated with any package), then you should first download and compile the libraries on your machine.  The good news is that this can be done with a single command.  The bad news is that it may take a long time (15 minutes or so) to download and compile the libraries you need.

Here is the command to download and compile the Lean mathlib library on your machine.

``` shell
leanpkg install https://github.com/leanprover/mathlib.git
```

This will only work if you have already installed Lean on your computer by following 
the instructions given here

https://leanprover.github.io/download/

for precompiled binaries.

If you want to download and compile Lean from scratch, see this page:

https://github.com/leanprover/lean/blob/master/doc/make/index.md


--- 

### The Lean API

In a previous version of the course, one student asked about a "Lean API." If you don't know what an API is, you can ignore this section.

While Lean doesn't seem to have a formal API, per se, you can browse the source code of the core Lean library to see what built-in mathematical objects and operations are available.  For example, some of the most important basic mathematical objects are implemented in the files listed below. These (and many more) can be found in (or under) the [lean/library/init](https://github.com/leanprover/lean/tree/master/library/init) directory of the official [Lean GitHub repository](https://github.com/leanprover/lean).

+ [classical.lean](https://github.com/leanprover/lean/blob/master/library/init/classical.lean)
+ [core.lean](https://github.com/leanprover/lean/blob/master/library/init/core.lean)
+ [function.lean](https://github.com/leanprover/lean/blob/master/library/init/function.lean)
+ [logic.lean](https://github.com/leanprover/lean/blob/master/library/init/logic.lean)
+ [wf.lean](https://github.com/leanprover/lean/blob/master/library/init/wf.lean)

+ In [lean/library/init/data](https://github.com/leanprover/lean/tree/master/library/init/data):
  - [nat (dir)](https://github.com/leanprover/lean/blob/master/library/init/data/nat)
  - [prod.lean](https://github.com/leanprover/lean/blob/master/library/init/data/prod.lean)
  - [quot.lean](https://github.com/leanprover/lean/blob/master/library/init/data/quot.lean)
  - [set.lean](https://github.com/leanprover/lean/blob/master/library/init/data/set.lean)
  - [sigma (dir)](https://github.com/leanprover/lean/blob/master/library/init/data/sigma/)
  
+ In [lean/library/init/algebra](https://github.com/leanprover/lean/blob/master/library/init/algebra):
  - [classes.lean](https://github.com/leanprover/lean/blob/master/library/init/algebra/classes.lean)
  - [functions.lean](https://github.com/leanprover/lean/blob/master/library/init/algebra/functions.lean)
  - [order.lean](https://github.com/leanprover/lean/blob/master/library/init/algebra/order.lean)

