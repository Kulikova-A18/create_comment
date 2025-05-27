#!/bin/bash

# Функция для создания комментария
function create_comment {
    comment="/**\n"

    # Определение обязательных и необязательных тегов
    required_tags=(
        "@brief"
    )

    required_tags2=(
        "@param"
        "@return"
    )

    optional_tags=(
        "@throws"
        "@note"
        "@warning"
        "@todo"
        "@deprecated"
        "@see"
        "@file"
    )

    # Запрос обязательных тегов
    for tag in "${required_tags[@]}"; do
        read -p "Введите текст для $tag (обязательно): " input
        if [[ -n "$input" ]]; then
            comment+=" * $tag $input\n"
        else
            echo "Ошибка: $tag обязательный. Пожалуйста, введите значение."
            return
        fi
    done

    # Запрос описания функции
    read -p "Введите текст для описания функции (обязательно): " input
    if [[ -n "$input" ]]; then
        comment+=" * $input\n * \n"
    else
        echo "Ошибка: текст для описания функции обязателен. Пожалуйста, введите значение."
        return
    fi

    # Запрос дополнительных обязательных тегов
    for tag in "${required_tags2[@]}"; do
        read -p "Введите текст для $tag (обязательно): " input
        if [[ -n "$input" ]]; then
            comment+=" * $tag $input\n"
        else
            echo "Ошибка: $tag обязательный. Пожалуйста, введите значение."
            return
        fi
    done

    # Запрос необязательных тегов
    for tag in "${optional_tags[@]}"; do
        read -p "Введите текст для $tag (нажмите Enter для пропуска): " input
        if [[ -n "$input" ]]; then
            comment+=" * $tag $input\n"
        fi
    done

    comment+="*/"

    # Вывод результата
    echo -e "$comment"
}

# Пример использования
example_comment="
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
*/"

echo -e "$example_comment"

# Вызов функции
create_comment
