% Определяем граф в виде ребер
edge(0, 1).
edge(0, 2).
edge(0, 3).
edge(1, 0).
edge(1, 3).
edge(1, 4).
edge(2, 0).
edge(2, 3).
edge(3, 0).
edge(3, 1).
edge(3, 2).
edge(3, 4).
edge(4, 1).
edge(4, 3).

% Предикат для проверки, является ли путь гамильтоновым
hamiltonian_path(Path) :-
    length(Path, Length),
    Length =< 5, % Задаем максимальное количество вершин в графе
    Path = [Start|_],
    Start = 0, % Начинаем с первой вершины
    hamiltonian_path_helper(Path, [Start]).

hamiltonian_path_helper([_], _). % Если осталась одна вершина, путь найден
hamiltonian_path_helper([Current, Next|Rest], Visited) :-
    edge(Current, Next), % Проверяем наличие ребра между Current и Next
    \+ member(Next, Visited), % Убедимся, что Next еще не посещен
    hamiltonian_path_helper([Next|Rest], [Next|Visited]). % Рекурсивно продолжаем

% Для поиска пути, вызовите предикат hamiltonian_path с нужной длиной
find_hamiltonian_path(Path) :-
    length(Path, Length),
    Length =< 5, % Задаем максимальное количество вершин в графе
    hamiltonian_path(Path).
