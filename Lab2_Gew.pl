% Предикат для сортировки списка
quicksort([], []).
quicksort([Pivot | Tail], Sorted) :-
    partition(Pivot, Tail, Smaller, Greater),
    quicksort(Smaller, SmallerSorted),
    quicksort(Greater, GreaterSorted),
    append(SmallerSorted, [Pivot | GreaterSorted], Sorted).

% Предикат для разделения списка на две части: те, что меньше опорного элемента, и те, что больше
partition(_, [], [], []).
partition(Pivot, [X | Tail], [X | Smaller], Greater) :-
    X =< Pivot,
    partition(Pivot, Tail, Smaller, Greater).
partition(Pivot, [X | Tail], Smaller, [X | Greater]) :-
    X > Pivot,
    partition(Pivot, Tail, Smaller, Greater).

% Пример использования
main :-
   % InputList = [3, 1, 5, 7, 9, 2, 5, 4, 14, 3],
    InputList = [9,8,7,6,5,4,3,2,1,2,3,4,6,5,7,8,9],
    writeln("Исходный массив:"),
    writeln(InputList),
    quicksort(InputList, SortedList),
    writeln("Отсортированный массив:"),
    writeln(SortedList).

% Вызов главного предиката
main.
