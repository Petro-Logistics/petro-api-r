Verifying the PetroLogistics API in R
=======================================

First time installation
-----------------------

1. Download and install RStudio from this link:
       https://www.rstudio.com/products/rstudio/download/#download .
   This is the IDE we'll use to write code for R.
2. Open RStudio. You'll now be able to see a window subdivided into smaller
   windows. Find the window labeled 'Console'. It should have a prompt starting
   with the '>' character.
3. Type in these commands sequentially to install and use "devtools":
       install.packages("devtools")
       library(devtools)
   This will allow installation of the API package.
4. Extract petrologistics.zip somewhere on the computer, let's say in
  C:\petrologistics . After extracting, you should be able to see this directory
  structure:
    C:\petrologistics
       |
       |- example.R
       |
       `- petrologistics
          |
          |- man
          |
          `- R
5. In RStudio's Console window, type this in (based on the above path) to
   change to the directory containing the API client code:
       setwd("c:/petrologistics/petrologistics")
   If installed in a separate directory, you'll need to change c:/petrologistics
   to that directory.
6. Install the API client with this command:
       install(".")
7. Run the example:
       source("../example.R")
   That should print a list of 'movements' after calling the API.

Subsequent runs
---------------

To experiment with the library, the easiest way is to change the example.R file
and run it from within RStudio.

1. Launch RStudio
2. Run this command to execute the example file:
    source("c:/petrologistics/petrologistics/example.R")
3. To change the query name in the API, edit the 'example.R' file and replace
   "Angola_Test_Data" with the query name of your choice. Then repeat step 2.


