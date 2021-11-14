Use `find` to list all of the directories you have in folder.

* `find . -type d`

Do you have any directories with the letter _a_ in their names?

* `find . -type d -name "*a*"`

Do you have any directories with the letters _a_ and _b_ in their names?

* `find . -type d \( -name "*a*" -and -name "*b*" \)`

Do you have any directories with the letters _a_ or _b_ in their names?

* `find . -type d \( -name "*a*" -or -name "*b*" \)`


Use `find` to list all of the files you have in folder.

* `find . -type f 

Do you have any files with the letter _a_ in their names?

* `find . -type f -name "*a*"`
 
Do you have any files with the letters _a_ and _b_ in their names?

* `find . -type f \( -name "*a*" -and -name "*b*" \)`

Do you have any files with the letters _a_ or _b_ in their names?

* `find . -type f \( -name "*a*" -and -name "*b*" \)`

Put some text into a few of the files, and then use `find` with `-exec grep` on that word.

* `find . -type f -exec grep word {} +`
* `find . -type f -exec grep word {} \;`

Replace `-exec` with `-ok`. Can you spot any difference? Try looking in the manual.

* `find . -type f -ok grep word {} +`
* `find . -type f -ok grep word {} \;`
