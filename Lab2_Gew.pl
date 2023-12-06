% �������� ��� ���������� ������
quicksort([], []).
quicksort([Pivot | Tail], Sorted) :-
    partition(Pivot, Tail, Smaller, Greater),
    quicksort(Smaller, SmallerSorted),
    quicksort(Greater, GreaterSorted),
    append(SmallerSorted, [Pivot | GreaterSorted], Sorted).

% �������� ��� ���������� ������ �� ��� �����: ��, ��� ������ �������� ��������, � ��, ��� ������
partition(_, [], [], []).
partition(Pivot, [X | Tail], [X | Smaller], Greater) :-
    X =< Pivot,
    partition(Pivot, Tail, Smaller, Greater).
partition(Pivot, [X | Tail], Smaller, [X | Greater]) :-
    X > Pivot,
    partition(Pivot, Tail, Smaller, Greater).

% ������ �������������
main :-
   % InputList = [3, 1, 5, 7, 9, 2, 5, 4, 14, 3],
    InputList = [9,8,7,6,5,4,3,2,1,2,3,4,6,5,7,8,9],
    writeln("�������� ������:"),
    writeln(InputList),
    quicksort(InputList, SortedList),
    writeln("��������������� ������:"),
    writeln(SortedList).

% ����� �������� ���������
main.
