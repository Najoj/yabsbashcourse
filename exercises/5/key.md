# Suggestied solutions for day 5 exercises

Run `shellcheck` either online on installed on you computer: [Shellcheck.com](https://shellcheck.com/)

_Note that this scripts are not very useful. Just ful of issues._

## script1.bash

```
$ shellcheck script1.bash
In script1.bash line 3:
echo $USER
     ^---^ SC2086: Double quote to prevent globbing and word splitting.

Did you mean: 
echo "$USER"


In script1.bash line 4:
echo 2 + 2 = `echo 2+2 | bc`
             ^-------------^ SC2046: Quote this to prevent word splitting.
             ^-------------^ SC2006: Use $(...) notation instead of legacy backticked `...`.

Did you mean: 
echo 2 + 2 = $(echo 2+2 | bc)


In script1.bash line 8:
        let ++$A
        ^------^ SC2219: Instead of 'let expr', prefer (( expr )) .


In script1.bash line 11:
sleep $A 1s
      ^-- SC2086: Double quote to prevent globbing and word splitting.

Did you mean: 
sleep "$A" 1s


In script1.bash line 13:
read NAME
^--^ SC2162: read without -r will mangle backslashes.


In script1.bash line 15:
echo Hi $NAME. A is now \"$A\".
        ^---^ SC2086: Double quote to prevent globbing and word splitting.
                          ^-- SC2086: Double quote to prevent globbing and word splitting.

Did you mean: 
echo Hi "$NAME". A is now \""$A"\".

For more information:
  https://www.shellcheck.net/wiki/SC2046 -- Quote this to prevent word splitt...
  https://www.shellcheck.net/wiki/SC2086 -- Double quote to prevent globbing ...
  https://www.shellcheck.net/wiki/SC2162 -- read without -r will mangle backs...
```

Have a look at the links `shellchick` provides. SC2046 and SC2086 should be easy to fix. Surround with `"` where applicable.

```
In script1.bash line 4:
echo "2 + 2 = `echo 2+2 | bc`"
              ^-------------^ SC2006: Use $(...) notation instead of legacy backticked `...`.

Did you mean: 
echo "2 + 2 = $(echo 2+2 | bc)"


In script1.bash line 8:
        let ++$A
        ^------^ SC2219: Instead of 'let expr', prefer (( expr )) .


In script1.bash line 13:
read NAME
^--^ SC2162: read without -r will mangle backslashes.

For more information:
  https://www.shellcheck.net/wiki/SC2162 -- read without -r will mangle backs...
  https://www.shellcheck.net/wiki/SC2006 -- Use $(...) notation instead of le...
  https://www.shellcheck.net/wiki/SC2219 -- Instead of 'let expr', prefer (( ...
```

Have a look at the links `shellchick` provides.

* Add `-r` before read
* Use `$(echo 2+2 | bc)` notion instead of ``` `echo 2+2 | bc` ```.
* Use `((++A))` insead of using `let ++$A`.

## script2.bash

This script is more complicated than `script1.bash`. It is a good idea to comment out sections and adjust the other sections.

```
In script2.bash line 6:
function fun()
^-- SC1009: The mentioned syntax error was in this function.


In script2.bash line 7:
{
^-- SC1073: Couldn't parse this brace group. Fix to allow more checks.


In script2.bash line 9:
        << eof while read line; do echo $line; done | tr x s | tr [:upper:] [:lower:]
                                ^-- SC1056: Expected a '}'. If you have one, try a ; or \n in front of it.
                                   ^-- SC1072: Unexpected keyword/token. Fix any mentioned problems and try again.

For more information:
  https://www.shellcheck.net/wiki/SC1056 -- Expected a '}'. If you have one, ...
  https://www.shellcheck.net/wiki/SC1072 -- Unexpected keyword/token. Fix any...
  https://www.shellcheck.net/wiki/SC1073 -- Couldn't parse this brace group. ...
```

Start by commenting the entire function `fun`, you can now see:
```
In script2.bash line 36:
echo {1..20} | while read i; do (( $i > 20 )) && sum=$(($i+RANDOM + $sum + $A[0]); done
                                                     ^-- SC1073: Couldn't parse this $((..)) expression. Fix to allow more checks.
                                                     ^-- SC1009: The mentioned syntax error was in this $((..)) expression.
                                                                             ^-- SC1072:  Fix any mentioned problems and try again.

For more information:
  https://www.shellcheck.net/wiki/SC1072 --  Fix any mentioned problems and t...
  https://www.shellcheck.net/wiki/SC1073 -- Couldn't parse this $((..)) expre...
  https://www.shellcheck.net/wiki/SC1009 -- The mentioned syntax error was in...
```

Here, the `sum` calculation is missing a `)`. Add and re-run `shellcheck`:

```
The issue here is the missing `)` in the expression.
In script2.bash line 41:
eof 
   ^-- SC1118: Delete whitespace after the here-doc end token.


In script2.bash line 45:
while getopts "a" f; do
^-- SC1073: Couldn't parse this while loop. Fix to allow more checks.
                     ^-- SC1061: Couldn't find 'done' for this 'do'.


In script2.bash line 48:

^-- SC1062: Expected 'done' matching previously mentioned 'do'.
^-- SC1072: Expected 'done'. Fix any mentioned problems and try again.

For more information:
  https://www.shellcheck.net/wiki/SC1061 -- Couldn't find 'done' for this 'do'.
  https://www.shellcheck.net/wiki/SC1118 -- Delete whitespace after the here-...
  https://www.shellcheck.net/wiki/SC1062 -- Expected 'done' matching previous...
```

There happen to be an extra space after `eof`. Remove it.

The while loop at the end looks incomplete, as do the switch-case. Did you not finnish the script? Complete or remove those lines.

```

In script2.bash line 3:
alias WHO="whoami | grep $1"
                         ^-- SC2139: This expands when defined, not when used. Consider escaping.


In script2.bash line 16:
if ls $HOME; then
      ^---^ SC2086: Double quote to prevent globbing and word splitting.

Did you mean: 
if ls "$HOME"; then


In script2.bash line 17:
        cd $HOME
        ^------^ SC2164: Use 'cd ... || exit' or 'cd ... || return' in case cd fails.
           ^---^ SC2086: Double quote to prevent globbing and word splitting.

Did you mean: 
        cd "$HOME" || exit


In script2.bash line 18:
        LS=ls
        ^-- SC2209: Use var=$(command) to assign output (or quote to assign string).


In script2.bash line 23:
        echo "Running Debug mode\n"
             ^--------------------^ SC2028: echo may not expand escape sequences. Use printf.


In script2.bash line 27:
        find ${HOME} -exec grep 'hello' {} + -type f -iname *.txt -maxdepth 1
             ^-----^ SC2086: Double quote to prevent globbing and word splitting.
                                                            ^---^ SC2061: Quote the parameter to -iname so the shell won't interpret it.
                                                            ^-- SC2035: Use ./*glob* or -- *glob* so names with dashes won't become options.

Did you mean: 
        find "${HOME}" -exec grep 'hello' {} + -type f -iname *.txt -maxdepth 1


In script2.bash line 30:
if [ -z $@ ] & [[ 2 < "3" ]]; then
        ^-- SC2068: Double quote array expansions to avoid re-splitting elements.
        ^-- SC2198: Arrays don't work as operands in [ ]. Use a loop (or concatenate with * instead of @).
                    ^-- SC2071: < is for string comparisons. Use -lt instead.
                    ^-- SC2050: This expression is constant. Did you forget the $ on a variable?


In script2.bash line 31:
        for _ in $@; do echo hello; done | sed sfhellofgoodbye\nf
                 ^-- SC2068: Double quote array expansions to avoid re-splitting elements.
                                                              ^-- SC1012: \n is just literal 'n' here. For line feed, use a quoted, literal line feed instead.


In script2.bash line 32:
        for f in "*.txt"; do echo cat $f; done | shuf
                 ^-----^ SC2066: Since you double quoted this, it will not word split, and the loop will only run once.
                                      ^-- SC2086: Double quote to prevent globbing and word splitting.

Did you mean: 
        for f in "*.txt"; do echo cat "$f"; done | shuf


In script2.bash line 36:
echo {1..20} | while read i; do (( $i > 20 )) && sum=$(($i+RANDOM + $sum + $A[0])); done
                     ^--^ SC2162: read without -r will mangle backslashes.
                                   ^-- SC2004: $/${} is unnecessary on arithmetic variables.
                                                     ^-- SC1102: Shells disambiguate $(( differently or not at all. For $(command substition), add space after $( . For $((arithmetics)), fix parsing errors.
                                                        ^-- SC2086: Double quote to prevent globbing and word splitting.
                                                                           ^-- SC1087: Use braces when expanding arrays, e.g. ${array[idx]} (or ${var}[.. to quiet).
                                                                           ^-- SC2128: Expanding an array without an index only gives the first element.
                                                                           ^-- SC2086: Double quote to prevent globbing and word splitting.

Did you mean: 
echo {1..20} | while read i; do (( $i > 20 )) && sum=$(("$i"+RANDOM + $sum + "$A"[0])); done


In script2.bash line 38:
while read line; do echo $line; done << eof
      ^--^ SC2162: read without -r will mangle backslashes.
                         ^---^ SC2086: Double quote to prevent globbing and word splitting.

Did you mean: 
while read line; do echo "$line"; done << eof


In script2.bash line 45:
[ false ] && exit 1
  ^---^ SC2158: [ false ] is true. Remove the brackets.

For more information:
  https://www.shellcheck.net/wiki/SC1087 -- Use braces when expanding arrays,...
  https://www.shellcheck.net/wiki/SC1102 -- Shells disambiguate $(( different...
  https://www.shellcheck.net/wiki/SC2066 -- Since you double quoted this, it ...

```

Now you will a ha lot of fairly easy isseus to correct, all but the function.

Now you should see this as you run `shellcheck`:

```

In script2.bash line 3:
function fun()
^-- SC1009: The mentioned syntax error was in this function.


In script2.bash line 4:
{
^-- SC1073: Couldn't parse this brace group. Fix to allow more checks.


In script2.bash line 6:
        << eof while read line; do echo $line; done | tr x s | tr [:upper:] [:lower:]
                                ^-- SC1056: Expected a '}'. If you have one, try a ; or \n in front of it.
                                   ^-- SC1072: Unexpected keyword/token. Fix any mentioned problems and try again.

For more information:
  https://www.shellcheck.net/wiki/SC1056 -- Expected a '}'. If you have one, ...
  https://www.shellcheck.net/wiki/SC1072 -- Unexpected keyword/token. Fix any...
  https://www.shellcheck.net/wiki/SC1073 -- Couldn't parse this brace group. ...
```

SC1009 only says that there is an issue within the for loop.

Due to the `<< eof`, `shellchek` seem to be unable to parse this line. Put it after the loop, just after `done`. The rest of the issues should be fairly easy to fix now.

- - -
A suggested solution for `script2.bash` would be:

```bash
#!/bin/bash

function fun()
{

        while read -r line; do echo "$line"; done << eof | tr x s | tr "[:upper:]" "[:lower:]"
Tthix ix xome text
which Xix on multiple linex
eof
}


if ls "$HOME"; then
        cd "$HOME" || exit 1
        # shellcheck disable=SC2034
        LS="ls"
fi

if ${DEBUG+x}; then
        # Can set other flags and options here
        printf "Running Debug mode\n"
fi

if which find; then
        find "${HOME}" -exec grep 'hello' {} + -type f -iname "*.txt" -maxdepth 1
fi

if [ -z "$*" ] & [[ 2 -lt "3" ]]; then
        for _ in "$@"; do echo hello; done | sed sfhellofgoodbye\\nf
        for f in *.txt; do echo cat "$f"; done | shuf
fi

# shellcheck disable=SC2034
sum=0
echo {1..20} | while read -r i; do
        [[ i -lt 20 ]] && (( sum=i+RANDOM+sum+A[0] ))
done

while read -r line; do echo "$line"; done << eof
This is some text
which is on multiple lines
eof

$LS && bash -x function 1 2 3

[ "$(false)" ] && exit 1

```
