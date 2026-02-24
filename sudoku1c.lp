% Sudoku Solver
%
% Hints:
% For subgrid of size sub_n, subgrids can be identified by labels 1..sub_n*sub_n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/sub_n)*sub_n+(y-1)/sub_n)

% Your implementation please...


%* FACTS *%
#const n = 4. % grid length
#const sub_n = 2. % subgrid length

sudoku(X,Y,N) :- initial(X,Y,N). % initialize sudoku instance



%* GENERATE *%
{ sudoku(X,Y,N) : N = 1..n } = 1 :- X = 1..n, Y = 1..n.
% achieved: each sudoku square has a number from 1-n

subgrid(X,Y,G) :- G = 1+(((X-1)/sub_n)*sub_n+(Y-1)/sub_n) , X = 1..n, Y = 1..n.
% achieved: assigned sudoku subgrids



%* CONSTRAINTS *%
:- sudoku(X1,Y1,N), sudoku(X1,Y2,N), sudoku(X1,Y1,N) != sudoku(X1,Y2,N).
% achieved: squares in the same ROW w/ same number are terminated.

:- sudoku(X1,Y1,N), sudoku(X2,Y1,N), sudoku(X1,Y1,N) != sudoku(X2,Y1,N).
% achieved: squares in the same COLUMN w/ same number are terminated.

:- subgrid(X1,Y1,G), subgrid(X2,Y2,G), sudoku(X1,Y1,N), sudoku(X2,Y2,N), X1 != X2, Y1 != Y2.
% achieved: squares in the same subgrid, w/ same number, and different positions are terminated.



#show sudoku/3.
