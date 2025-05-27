Описание, что есть:

 * create_comment_eng.bash
 * create_comment_ru.bash
 * create_comment_eng.ps1
 * create_comment_ru.ps1

Пример запуска скрипта:

```
USER@DESKTOP-INFFBBO MINGW64 ~/Desktop/
$ bash create_comment_ru.bash

/**
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
Введите текст для @brief (обязательно): Описание для теста запуска скрипта
Введите текст для описания функции (обязательно): Тут должен быть текст
Введите текст для @param (обязательно): отсутсвуют
Введите текст для @return (обязательно): успех
Введите текст для @throws (нажмите Enter для пропуска): 
Введите текст для @note (нажмите Enter для пропуска): 
Введите текст для @warning (нажмите Enter для пропуска): 
Введите текст для @todo (нажмите Enter для пропуска): 
Введите текст для @deprecated (нажмите Enter для пропуска): 
Введите текст для @see (нажмите Enter для пропуска): 
Введите текст для @file (нажмите Enter для пропуска): 
/**
 * @brief Описание для теста запуска скрипта
 * Тут должен быть текст
 *
 * @param отсутсвуют
 * @return успех
*/
```

Описание тегов:

| Тег         | Описание                                             | Пример использования                                                                 |
|-------------|------------------------------------------------------|-------------------------------------------------------------------------------------|
| @brief    | Краткое описание функции или метода                 | @brief Convert log level to syslog severity                                       |
| @param    | Описание параметров функции                          | @param llev - ste log level.                                                       |
| @return   | Описание возвращаемого значения                      | @return syslog severity if OK and -1 if FAIL.                                     |
| @throws   | Указывает, какие исключения могут быть выброшены    | @throws InvalidLogLevelException if the log level is invalid.                     |
| @note     | Дополнительная информация или примечания             | @note This function is used for converting internal logging levels to syslog standards. |
| @warning  | Указывает на потенциальные проблемы                  | @warning Ensure that the input level is within the defined range to avoid unexpected behavior. |
| @todo     | Указывает на задачи или улучшения                    | @todo Implement error handling for invalid inputs.                                |
| @deprecated| Указывает на устаревшие функции                      | @deprecated Use newLoggingFunction() instead.                                     |
| @see      | Указывает на связанные функции или классы           | @see newLoggingFunction()                                                           |
| @file     | Имя файла, к которому относится данный блок комментариев | @file logging.c                                                                    |
| @class    | Указывает на класс, если документируется класс      | @class Logger                                                                      |

Пример 1

```
/**
 * @brief Calculate the factorial of a non-negative integer
 * 
 * This function computes the factorial of a given non-negative integer n.
 * 
 * @param n - Non-negative integer for which the factorial is to be calculated.
 * 
 * @return The factorial of n if n is non-negative, or -1 if n is negative.
 * @throws std::invalid_argument if n is negative.
 * @note This function uses recursion to compute the factorial.
 * @warning Be cautious with large values of n, as this may lead to stack overflow.
 * @todo Optimize the function to use an iterative approach instead of recursion.
 * @deprecated Use factorial_iterative() instead for better performance.
 * @see factorial_iterative()
 * @file math_utils.c
 */
```

Пример 2

```
/**
 * @brief Read content from a file
 * 
 * This function opens a file, reads its content, and returns it as a string.
 * 
 * @param filename - The name of the file to be read.
 * 
 * @return A string containing the content of the file, or NULL if the file cannot be opened.
 * @throws std::runtime_error if the file cannot be found or opened.
 * @note Ensure that the file exists before calling this function to avoid exceptions.
 * @warning This function allocates memory for the output string; make sure to free it after use.
 * @todo Add support for reading binary files.
 * @deprecated Use read_file_with_buffer() instead for better memory management.
 * @see read_file_with_buffer()
 * @file file_utils.c
 */
char* read_file(const char* filename) {
    FILE* file = fopen(filename, "r");
    if (!file) {
        throw std::runtime_error("File cannot be opened.");
    }
    // Чтение содержимого файла и возврат его как строку...
}
```
