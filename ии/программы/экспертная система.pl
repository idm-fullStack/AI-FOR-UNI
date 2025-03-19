% База знаний
% Проблемы с ESP32 и рекомендации по их устранению

% Проверка питания
check_power :- 
    ask('Подключен ли ESP32 к источнику питания 5V?'), 
    !.

% Проверка прошивки
check_software :- 
    ask('Обновлена ли прошивка ESP32 до последней версии?'), 
    !.

% Проверка подключения модулей
check_modules :- 
    ask('Правильно ли подключены все модули?'), 
    !.

% Проверка на наличие короткого замыкания
check_short_circuit :- 
    ask('Проверяли ли вы наличие короткого замыкания на плате?'), 
    !.

% Проверка температуры
check_temperature :- 
    ask('Не перегревается ли ESP32?'), 
    !.

% Проверка на наличие повреждений
check_damage :- 
    ask('Есть ли видимые повреждения на плате?'), 
    !.

% Проверка Wi-Fi соединения
check_wifi :- 
    ask('Правильно ли настроено Wi-Fi соединение?'), 
    !.

% Проверка конфигурации пинов
check_pin_configuration :- 
    ask('Правильно ли настроены пины в коде?'), 
    !.

% Проверка на наличие конфликтов с другими устройствами
check_device_conflicts :- 
    ask('Нет ли конфликтов с другими подключенными устройствами?'), 
    !.

% Проверка на наличие ошибок в коде
check_code_errors :- 
    ask('Есть ли ошибки в коде программы?'), 
    !.

% Рекомендации
recommendation(power_issue, 'Проверьте источник питания и убедитесь, что он выдает 5V.').
recommendation(software_issue, 'Обновите прошивку до последней версии.').
recommendation(module_issue, 'Проверьте соединения и целостность модулей.').
recommendation(short_circuit_issue, 'Проверьте плату на наличие короткого замыкания.').
recommendation(temperature_issue, 'Убедитесь, что ESP32 не перегревается.').
recommendation(damage_issue, 'Проверьте плату на наличие видимых повреждений.').
recommendation(wifi_issue, 'Проверьте настройки Wi-Fi соединения.').
recommendation(pin_configuration_issue, 'Убедитесь, что пины настроены правильно в коде.').
recommendation(device_conflict_issue, 'Проверьте наличие конфликтов с другими устройствами.').
recommendation(code_error_issue, 'Проверьте код на наличие ошибок и исправьте их.').

% Функция для запроса у пользователя
ask(Question) :- 
    write(Question), nl, 
    read(Response), 
    (Response == yes -> true ; false).

% Основная функция для диагностики
diagnose :- 
    (   \+ check_power -> 
        recommendation(power_issue, Recommendation), 
        write('Проблема обнаружена: Питание. '), 
        write(Recommendation), nl 
    ;   true 
    ), 
    (   \+ check_software -> 
        recommendation(software_issue, Recommendation), 
        write('Проблема обнаружена: Прошивка. '), 
        write(Recommendation), nl 
    ;   true 
    ), 
    (   \+ check_modules -> 
        recommendation(module_issue, Recommendation), 
        write('Проблема обнаружена: Подключение модулей. '), 
        write(Recommendation), nl 
    ;   true 
    ), 
    (   \+ check_short_circuit -> 
        recommendation(short_circuit_issue, Recommendation), 
        write('Проблема обнаружена: Короткое замыкание. '), 
        write(Recommendation), nl 
    ;   true 
    ), 
    (   \+ check_temperature -> 
        recommendation(temperature_issue, Recommendation), 
        write('Проблема обнаружена: Перегрев. '), 
        write(Recommendation), nl 
    ;   true 
    ), 
    (   \+ check_damage -> 
        recommendation(damage_issue, Recommendation), 
        write('Проблема обнаружена: Повреждение. '), 
        write(Recommendation), nl 
    ;   true 
    ), 
    (   \+ check_wifi -> 
        recommendation(wifi_issue, Recommendation), 
        write('Проблема обнаружена: Wi-Fi. '), 
        write(Recommendation), nl 
    ;   true 
    ), 
    (   \+ check_pin_configuration -> 
        recommendation(pin_configuration_issue, Recommendation), 
        write('Проблема обнаружена: Конфигурация пинов. '), 
        write(Recommendation), nl 
    ;   true 
    ), 
    (   \+ check_device_conflicts -> 
        recommendation(device_conflict_issue, Recommendation), 
        write('Проблема обнаружена: Конфликты устройств. '), 
        write(Recommendation), nl 
    ;   true 
    ), 
    (   \+ check_code_errors -> 
        recommendation(code_error_issue, Recommendation), 
        write('Проблема обнаружена: Ошибки в коде. '), 
        write(Recommendation), nl 
    ;   true 
    ).

% Запуск системы
start :- 
    write('Запуск диагностики ESP32...'), nl, 
    diagnose.