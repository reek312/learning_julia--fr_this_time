# This is a julia learning repo, im tracking my progress

<p align="center">
  <img src="images/img1.jpg" alt="nothing to see here" width="600"/>
</p>


## Project 1: Number guessing game

very simple concept. have 7 tries to guess the answer(a number between 1 and 100). i used basic loops, if/else, and function. also learned how julia handles global vs local variables.

>hint: to win everytime, use binary search

## Project 2: Conway's Game of Life
conway's game of life in the terminal, 20x30 grid, random start, runs for 100 generations. used a mutable struct for each cell (agent) and printed the grid with ascii. i thought about using plots and an interactive UI but maybe in another project

it works but the code is kinda bad. every cell scans the whole agent list to find its neighbors, so it's O(n^2). should've used a grid/matrix from the start, the struct storing location is what caused the problem. learned that the hard way.

next: rewrite with a matrix instead of structs, and learn @views on the way. will update it if my ADHD lets me come back to it.

>you can search "conway's game of life" and play it there too