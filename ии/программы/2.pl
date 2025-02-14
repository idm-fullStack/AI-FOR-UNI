% Пример списка имён
список_имен([иван, мария, петр, анна, ольга]).

% Предикат для замены элемента в списке
replace([], _, _, []). % Базовый случай: пустой список
replace([Old|Tail], Old, New, [New|TailResult]) :- 
    replace(Tail, Old, New, TailResult). % Замена элемента
replace([Head|Tail], Old, New, [Head|TailResult]) :- 
    Head \= Old, 
    replace(Tail, Old, New, TailResult). % Пропуск элемента
