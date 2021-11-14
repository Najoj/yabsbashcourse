Look at the first artist in the playlist with `head -n1`.

* `head -n1 playlist.txt`

Can you find all songs by the first artist?

* `grep $(head -n1 playlist.txt) playlist.txt`

Use `grep` to count how many songs by this artist.

* `grep -c $(head -n1 playlist.txt) playlist.txt`

Can you find all songs which are shorter than 1:00?

* `grep "(0:..) playlist.txt`

Print only the songs which contain the the word `Cop`, i. e. not in artist's name, and exactly this word.

* `grep -E " - (.*) Cop[^A-Za-z]" playlist.txt`

How would you go about finding the artist `$wingin' Utter$` in the playlist? Think of it as a general script to find artist `A`. By default, `grep` will try to do regex match by default.

* `A="\$wingin' Utter$"; grep -F "$A" playlist.txt`

From the `man` page of `grep`:
```
       -F, --fixed-strings
              Interpret PATTERNS as fixed strings, not regular expressions.
```

