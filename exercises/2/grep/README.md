Try to figure these out by doing them one step at the time. If you get stuck, move to the next point.

Unless stated, you are assumed to use `grep`, but feel free to try combining other commands.

You can choose to use `grep arguments file`, `cat file | grep arguments`, or `grep arguments < file`.

# Exercises for second session of Bash course on Yabs #

Files for you to play with should be available in `files/'.

Format of `playlist.txt` is `artist - songtitle (length)` where the `length` is of format `M:SS`.

*Note:* You might need some [regular expressions](https://en.wikipedia.org/wiki/Regular_expression) for this.

* Look at the first artist in the playlist with `head -n1`.

* * Can you find all songs by the first artist?

* * Use `grep` to count how many songs by this artist.

* Can you find all songs which are shorter than 1:00?

* Print only the songs which contain the the word `Cop`, i. e. not in artist's name, and exactly this word.

* How would you go about finding the artist `$wingin' Utter$` in the playlist? Think of it as a general script to find artist `A`. By default, `grep` will try to do regex match by default.

