# Results

on the hyper-v platform, Tested with linux debien so far, it seems, that tubing to the sytem resources is
not straightforward. 

it was found, as our payload operates on the cpu resources, that the debien os was able, under
the hyper v platform, to kill the payload after a couple of runs.

so we crafted a python boost, that killed the os. the payload is attached.

# NOTE
given that the payload is compiled at your system, the boost scripts will execute it before the system could,
kill the program, or before the user can terminate the program.

![](DebienOnHyperV.gif)
