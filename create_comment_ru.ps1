function Create-Comment {
    $comment = @"
/

"@

    # Определение обязательных и необязательных тегов
    $обязательныеТеги = @(
        "@brief"
    )

    $обязательныеТеги2 = @(
        "@param",
        "@return"
    )

    $необязательныеТеги = @(
        "@throws",
        "@note",
        "@warning",
        "@todo",
        "@deprecated",
        "@see",
        "@file"
    )

    # Запрос обязательных тегов
    foreach ($tag in $обязательныеТеги) {
        $input = Read-Host "Введите текст для $tag (обязательно)"
        if (-not [string]::IsNullOrWhiteSpace($input)) {
            $comment += " * $tag $input`n"
        }
        else {
            Write-Host "Ошибка: $tag обязательный. Пожалуйста, введите значение." -ForegroundColor Red
            return
        }
    }

    # Запрос текста функции
    $input = Read-Host "Введите текст для описания функции (обязательно)"
    if (-not [string]::IsNullOrWhiteSpace($input)) {
        $comment += " * $input`n * `n"
    }
    else {
        Write-Host "Ошибка: текст для описания функции обязателен. Пожалуйста, введите значение." -ForegroundColor Red
        return
    }

    # Запрос дополнительных обязательных тегов
    foreach ($tag in $обязательныеТеги2) {
        $input = Read-Host "Введите текст для $tag (обязательно)"
        if (-not [string]::IsNullOrWhiteSpace($input)) {
            $comment += " * $tag $input`n"
        }
        else {
            Write-Host "Ошибка: $tag обязательный. Пожалуйста, введите значение." -ForegroundColor Red
            return
        }
    }

    # Запрос необязательных тегов
    foreach ($tag in $необязательныеТеги) {
        $input = Read-Host "Введите текст для $tag (нажмите Enter для пропуска)"
        if (-not [string]::IsNullOrWhiteSpace($input)) {
            $comment += " * $tag $input`n"
        }
    }

    $comment += '*/'
    
    Write-Output $comment
}

Write-Output @"
Пример:

/
 * @brief Чтение содержимого из файла
 * 
 * Эта функция открывает файл, читает его содержимое и возвращает его как строку.
 * 
 * @param filename - Имя файла для чтения.
 * 
 * @return Строка, содержащая содержимое файла, или NULL, если файл не может быть открыт.
 * @throws std::runtime_error если файл не найден или не может быть открыт.
 * @note Убедитесь, что файл существует перед вызовом этой функции, чтобы избежать исключений.
 * @warning Эта функция выделяет память для выходной строки; убедитесь, что вы освободили её после использования.
 * @todo Добавить поддержку чтения бинарных файлов.
 * @deprecated Используйте read_file_with_buffer() вместо этого для лучшего управления памятью.
 * @see read_file_with_buffer()
 * @file file_utils.c
*/
"@

# Вызов функции
Create-Comment
