# STP_p3
_Created for the course "Stack of programming technologies" V. N. Karazin Kharkiv National University_

Ruby 3.3.5 "Raisin pie".
___

The main executable file Program.rb.

The program divides the raisin pie (matrix) into equal-sized segments, number of segments = number of raisins, as a standard constraint the number of raisins < 10 (can be changed with the maxRaisins argument).

The selection of the division option is based on the largest width of the segment (column), each segment is rectangular, the divisors of its area are used as the options for the segment shape (because `S = row * col`), that is, the options are selected first with the largest `row`, which smoothly flow into the largest `col`.

The program performs the search recursively, first finding a segment from the upper left corner of the matrix such that it contains only one raisin, then the segment to the right of the previous one, the next one, and so on, after running out of virgin parts on the right, the program moves down from the already found (first) segment and goes to the right again, if it turns out that it is impossible to create a segment on the free area that would meet the conditions, the program returns to the previous step and tries to find another segment (from the largest `row` to the largest `col`) if it is not found, then again one step back, as a result, if it was not possible to find the necessary segments at any such step, the program returns `nil`, if it was successful, then an array of segments (matrices).

The program is executed only in interactive mode, follow the instructions carefully!

# Examples

```ruby
> ruby Program.rb
"Raisin pie" by Shkilnyi V. CS31
Enter the character that represents the raisins:
> о  
Enter a number of rows in the matrix (pie):
> 4
Enter a Raisin pie (matrix) line by line:
> .о......
>   ......о.
>   ....о...
>   ..о.....
Result of split a Raisin pie:
[
.о......
,
......о.
,
....о...
,
..о.....
]

> ruby Program.rb
"Raisin pie" by Shkilnyi V. CS31
Enter the character that represents the raisins:
> о 
Enter a number of rows in the matrix (pie):
> 6
Enter a Raisin pie (matrix) line by line:
> .о.о....
>   ........
>   ....о...
>   ........
>   ..... о..
>   ........
Result of split a Raisin pie:
[
.о
..
..
..
..
..
,
.о....
......
,
..о...
......
,
...о..
......
]

> ruby Program.rb
"Raisin pie" by Shkilnyi V. CS31
Enter the character that represents the raisins:
> 
Enter a number of rows in the matrix (pie):
> 6
ERROR! Invalid input. Check that the input is correct! Number > 0 !

> ruby Program.rb
"Raisin pie" by Shkilnyi V. CS31
Enter the character that represents the raisins:
> o
Enter a number of rows in the matrix (pie):
> 4
Enter a Raisin pie (matrix) line by line:
> ..o.
> ..o.
> .o.o
> o.o.
ERROR! Invalid input. Check that the input is correct! This matrix may not have a solution, check the conditions, maxRaisins = 9 !    

> ruby Program.rb
"Raisin pie" by Shkilnyi V. CS31
Enter the character that represents the raisins:
> o
Enter a number of rows in the matrix (pie):
> 4
Enter a Raisin pie (matrix) line by line:
> .o..
> ..o..
> o...
> ...o
ERROR! Invalid input. Check that the input is correct!
ERROR! Invalid input. Check that the input is correct! This matrix may not have a solution, check the conditions, maxRaisins = 9 ! 
```

# More tests and examples in tests.rb (passed tests 10/10)