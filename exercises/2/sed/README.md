Try to figure these out by doing them one step at the time. If you get stuck, move to the next point.

Unless stated, you are assumed to use `sed`, but feel free to try combining other commands.

You can choose to use `sed arguments file`, `cat file | sed arguments`, or `sed arguments < file`.

# Exercises for second session of Bash course on Yabs #

Use the same file as the exercises for `grep`.

Format of `playlist.txt` is `artist - songtitle (length)` where the `length` is of format `M:SS`.

*Note:* You might need some [regular expressions](https://en.wikipedia.org/wiki/Regular_expression) for this.

* There are those who are offended by words like `Fuck`. Can you substitute all occurrences of `Fuck` with `****`?

You can try the same substitution with words which offends you.

* Use `-e` flag to define expressions to remove a few lines. Write at `cat -n playlist.txt | sed -e [expression]`.

* See how many lines the file has with `wc`. Run `sed -e 'p'` at the file before and pipe to `wc`. Note the difference.

* * Try an integer before the `p`. What happens? Did you try a negative number as well? 

* Instead of using `/` when substituting, try any other characters.

