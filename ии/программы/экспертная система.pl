% Основной предикат для диагностики ESP32
diagnose_esp32 :-
    check_power_supply,
    check_serial_communication,
    check_wifi_connection,
    check_gpio_pins,
    check_memory.

% Проверка питания
check_power_supply :-
    power_supply_status(Status),
    (Status == ok ->
        write('Power supply: OK'), nl;
        write('Power supply: NOT OK'), nl,
        write('Что не исправно: Проблема с питанием'), nl).

% Проверка последовательной коммуникации
check_serial_communication :-
    serial_communication_status(Status),
    (Status == ok ->
        write('Serial communication: OK'), nl;
        write('Serial communication: NOT OK'), nl,
        write('Что не исправно: Проблема с последовательной коммуникацией'), nl).

% Проверка Wi-Fi соединения
check_wifi_connection :-
    wifi_connection_status(Status),
    (Status == ok ->
        write('Wi-Fi connection: OK'), nl;
        write('Wi-Fi connection: NOT OK'), nl,
        write('Что не исправно: Проблема с Wi-Fi соединением'), nl).

% Проверка GPIO пинов
check_gpio_pins :-
    gpio_pins_status(Status),
    (Status == ok ->
        write('GPIO pins: OK'), nl;
        write('GPIO pins: NOT OK'), nl,
        write('Что не исправно: Проблема с GPIO пинами'), nl).

% Проверка памяти
check_memory :-
    memory_status(Status),
    (Status == ok ->
        write('Memory: OK'), nl;
        write('Memory: NOT OK'), nl,
        write('Что не исправно: Проблема с памятью'), nl).

% Примеры предикатов для проверки статуса
power_supply_status(ok).
serial_communication_status(ok).
wifi_connection_status(not_ok).
gpio_pins_status(ok).
memory_status(ok).  




diagnose_esp32.
