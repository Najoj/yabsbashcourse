Print the first word of each row in the file.

* `head -n1 playlist.txt`
* `awk '(NR==1)' < playlist.txt`

Count number of lines in `playlist.txt`. Does it differ from `wc`? Are there more ways to do the same?

* `awk END{print NR} < playlist.txt`
* `wc -l playlist.txt`

Only print the lines with artist having `The` to start with.

* `awk '/^The/' < playlist.txt`

How many lines are there matching with starting `The`?

* `awk 'BEGIN{i=0} /^The/ {i++} END{print i}' < playlist.txt`
* `grep -c ^The playlist.txt`

