% Возможные действия игроков
player_action(cooperate).
player_action(defect).

% Матрица выигрышей (Игрок1, Игрок2, Выигрыш1, Выигрыш2)
payoff(cooperate, cooperate, 3, 3).
payoff(cooperate, defect, 0, 5).
payoff(defect, cooperate, 5, 0).
payoff(defect, defect, 1, 1).

% Проверка, что действие A1 оптимально при действии A2
best_response(A1, A2, U1) :-
    payoff(A1, A2, U1, _),
    \+ (player_action(OtherA1), 
        payoff(OtherA1, A2, OtherU1, _), 
        OtherU1 > U1).

% Поиск равновесия Нэша
nash_equilibrium(A1, A2) :-
    player_action(A1),
    player_action(A2),
    best_response(A1, A2, _),
    best_response(A2, A1, _).
