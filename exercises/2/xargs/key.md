Populate a file with names of files (you should know how to do this by now). Feed this file to `xargs` to run `grep` on for some pattern.

* `ls file*.txt | xargs grep word`

Use `find` to locate your newly created files, and feed those in to `xargs`, e. g. `find . | xargs grep`.

* `find . | xargs grep word`
