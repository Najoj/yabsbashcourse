There are those who are offended by words like `Fuck`. Can you substitute all occurrences of `Fuck` with `****`?

* `sed "s/Fuck/****/g" playlist.txt`

Use `-e` flag to define expressions to remove a few lines. Write at `cat -n playlist.txt | sed -e [expression]`.

* `cat playlist.txt | sed -e 1,100d`

See how many lines the file has with `wc`. Run `sed -e 'p'` at the file before and pipe to `wc`. Note the difference.

* `wc -l playlist.txt; sed -e p playlist.txt | wc -l`

Try an integer before the `p`. What happens? Did you try a negative number as well? 

* `wc -l playlist.txt; sed -e 20p playlist.txt | wc -l`

Instead of using `/` when substituting, try any other characters.

* `sed "sxFuckx****xg" playlist.txt`

