# Math 2001 Lean Information

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

## Important Information

It is recommended that each student install and use Lean on their own personal computer (instead of simply using the web browser interface).  It is also helpful to install VS Code, which is a powerful integrated development environment (IDE) in which you can edit and run your Lean code.  (However, VS Code is not required; if you prefer you can use emacs, which also has good Lean support.)

### Linux Users

It should be straightforward to download and install both Lean and VS Code on Linux, but if you have any trouble, please let me know so I can help you.

### Windows Users

Here is a summary of the steps that I *think* will work on Windows (but I cannot test this since I don't have a Windows machine, so please let me know if these steps don't work for you so I can help you).

1. **Download and Unzip Lean.** Go to [https://github.com/leanprover/lean/releases/tag/v3.4.2](https://github.com/leanprover/lean/releases/tag/v3.4.2) and download the binary that matches your operating system.  If you're using Windows, that will probably be the [lean-3.4.2-windows.zip](https://github.com/leanprover/lean/releases/download/v3.4.2/lean-3.4.2-windows.zip) file. Unzip this file in a convenient location on your hard drive (recommended location: `C:\Users\USERNAME\` where you should replace `USERNAME` with your username).

2. **Download and install VS Code** from [https://code.visualstudio.com/](https://code.visualstudio.com/)

3. **Install the vscode lean extension.**  Start vscode and open the `File > Preferences > Extensions` menu. In the search box, type `lean` and then select "lean, an extension for vscode..."  Click "Install" then "Reload"

4. **Tell VS Code where to find Lean.** Open the `File > Preferences > Settings` menu in vs code and search for `lean`. When you see "Lean: Extra Options" click the link "Edit in settings.json." This will open up your `settings.json` file.  In that file, you should enter the following:

   ```json
       {
         "lean.executablePath": "C:\\Users\\YourUserName\\lean-3.4.2-windows\\bin\\lean.exe"
       }
   ```

   **Important.** Note the double backslashes.  Also, confirm that, if you replace the double with single backslashes, then the line above is the actual path to the `lean.exe` file on your computer, which should be present after you downloaded and unzipped the Lean program in Step 1 above.

More information can be found on [this page](https://xenaproject.wordpress.com/2017/09/26/installing-lean-on-windows-from-scratch/) which provides nice and detailed instructions explaining how to download and install both [VS Code] and [Lean] on a Windows machine. (Of course, you should not follow the first instruction on that page, which is to download an older version of Lean.)

### Mac Users

If you are using a Mac, I suspect it will be easy to install Lean and VS Code, but unfortunately, as yet, I have no information about this.  Please let me know if you try it and run into any problems so I can help you.

### Other important info

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

