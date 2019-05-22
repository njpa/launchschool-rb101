### Debugging

A bug is a human error in code.  Debugging is the process of finding and fixing those errors.
To debug, we must:
1. Identify the problem: where in the code is the problem ocurring?
2. understand the problem: why is the line/code creating a problem (reference, inputs, outputs, iteration issues, etc.)?
3. implement a solution: change the code to eliminate the bug.

We can run into two types of errors:

1. Syntax errors:   error in the writing of the code.  Your code does not conform to the grammar of the language you are using.  They generally stop the code from running.
2. Logical errors:  The code might generally run without raising an exception, yet the code will not produce the results that are expected.  They are usually harder to debug.

#### Pry

Pry is a Rubygem.  It has to be required at the top of a file in order for it to be available for use.  It is a REPL.
Pry has some very useful features such as,

* the ability to change scope, by `cd`ing in and out of an object.
* the ability to find out more about the context of the object with `ls`.  This lists the different methods that are available to the object that we are currently `cd`ing into.
* the different methods can even be invoked on the object by simply entering the method name at the prompt.  Pry will show the return value for such an invocation on the object.
* We can find out more about the different methods using Pry.show-doc.  It will provide some documentation for the method along with some usage examples.

The most powerful feature of Pry is that it can be invoked at runtime.  This is done using `binding.pry`.
What is a binding?  A binding is something that contains references to any variables that were in scope at point where it was created. We could call the the 'state' of the program at that point in its execution.  `pry` is called on the `binding` to then pry open the binding allowing us to inspect it.

#### Pry in use

* We can always call `whereami` to bring back up the current line of execution.
* We call `exit` every time we want to progress on to the next line of execution.
* `Ctrl + d` jumps to the next line (shortcut)
* We can also use `system 'clear'` to clear up the screen, just as in `irb`.
* `exit!` takes us out of `pry`
* `pry` can detect the variables that are in scope through hoisting.  This means that evaluating a variable for which execution has not yet reached, but that is actually in scope, will return `nil` instead of a `NameErorr` exception.
* `whereami` can take an integer as an argument.  This will determine the number of lines visible before and after the current line of execution.





