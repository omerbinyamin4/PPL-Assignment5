:- module('ex5',
        [author/2,
         genre/2,
         book/4
        ]).

/*
 * **********************************************
 * Printing result depth
 *
 * You can enlarge it, if needed.
 * **********************************************
 */
maximum_printing_depth(100).
:- current_prolog_flag(toplevel_print_options, A),
   (select(max_depth(_), A, B), ! ; A = B),
   maximum_printing_depth(MPD),
   set_prolog_flag(toplevel_print_options, [max_depth(MPD)|B]).



author(1, "Isaac Asimov").
author(2, "Frank Herbert").
author(3, "William Morris").
author(4, "J.R.R Tolkein").


genre(1, "Science").
genre(2, "Literature").
genre(3, "Science Fiction").
genre(4, "Fantasy").

book("Inside The Atom", 1, 1, 500).
book("Asimov's Guide To Shakespeare", 1, 2, 400).
book("I, Robot", 1, 3, 450).
book("Dune", 2, 3, 550).
book("The Well at the World's End", 3, 4, 400).
book("The Hobbit", 4, 4, 250).
book("The Lord of the Rings", 4, 4, 1250).

% You can add more facts.
% Fill in the Purpose, Signature as requested in the instructions here

% Signature: authorOfGenre(GenreName, AuthorName)/2
% Purpose: Check if AuthorName wrote a GenreName book
authorOfGenre(GenreName, AuthorName) :-
    	genre(GID, GenreName),
    	author(AID, AuthorName),
    	book(_X,AID, GID, _Y).

% Signature: longestBook(AuthorId, BookName)/2
% Purpose: Check if BookName is the longest of AuthorId
longestBook(AuthorId, BookName) :-
	book(BookName, AuthorId, _X, Length),
    not(longerBook(AuthorId, Length)).

% Signature: longerBook(AuthorId, Length)/2
% Purpose: Check if AuthorId wrote a longer then Length
longerBook(AuthorId, Length) :-
    book(_Y, AuthorId, _Z, CurrLength),
    (CurrLength > Length).

% Signature: versatileAuthor(AuthorName)/1
% Purpose: Check if AuthorName has written books in at least three different genres
versatileAuthor(AuthorName) :-
    author(AuthorId, AuthorName),
    book(_A, AuthorId, FirstGenre, _B),
    book(_C, AuthorId, SecondGenre, _D),
    book(_E, AuthorId, ThirdGenre, _F),
    notEqual3(FirstGenre, SecondGenre, ThirdGenre).
    
% Signature: notEqual3(First, Second, Third)/3
% Purpose: Check if 3 integers are not equal
notEqual3(First, Second, Third) :-
    (First =\= Second),
    (Second =\= Third),
    (Third =\= First).
    	