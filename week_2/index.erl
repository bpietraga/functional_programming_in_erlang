-module(index).
-export([index/1,show_file_contents/1]).

% Example files available in:
%   gettysburg-address.txt (short)
%   dickens-christmas.txt  (long)

% index/1 returns tuple with {"word", "List of lines in file where exact word occurs"}.
% Words are in lexicographic order.
% Strings are normalized so "Foo" will match "foo".

% Run in in erl via index:index("./gettysburg-address.txt").

index(File) ->
    Lines = file_contents(File),
    WordsInLines = lists:map(fun processed/1, Lines),
    AllWords = lists:append(lists:map(fun lists:usort/1, WordsInLines)),
    SortedWords = lists:sort(AllWords),

    lists:usort(lists:map(fun(X) -> occurrence(X, Lines) end, SortedWords)).

occurrence(Word, Lines) ->
    Count = lists:map(fun(X) -> string:rstr(string:to_lower(X), Word) end, Lines),
    {Word, lists:flatten(lines(Count, 1))}.

% Split line into words

processed(X) ->
    re:split(string:to_lower(X), "\\W+", [{return,list}]).

% Add index to list if word is present.

lines([], _ACC) -> [];
lines([X|Y], ACC) ->
    [is_index(X, ACC) | lines(Y, ACC + 1)].

is_index(0, _) -> [];
is_index(_, N) -> N.

% Get the contents of a text file into a list of lines.
% Each line has its trailing newline removed.

file_contents(Name) ->
    {ok,File} = file:open(Name,[read]),
    Rev = get_all_lines(File,[]),
lists:reverse(Rev).

% Auxiliary function for file_contents.
% Not exported.

get_all_lines(File,Partial) ->
    case io:get_line(File,"") of
        eof -> file:close(File),
               Partial;
        Line -> {Strip,_} = lists:split(length(Line)-1,Line),
                get_all_lines(File,[Strip|Partial])
    end.

% Show the contents of a list of strings.
% Can be used to check the results of calling file_contents.

show_file_contents([L|Ls]) ->
    io:format("~s~n",[L]),
    show_file_contents(Ls);
 show_file_contents([]) ->
    ok.
