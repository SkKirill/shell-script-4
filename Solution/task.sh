#!/bin/bash

echo "Начало выполнения задания"

output_file="output_file.txt"
# Очищаем файл перед записью (если он уже существует)
> "$output_file"

# Перебираем все объекты в корневой директории
for item in /*; do
  # Проверяем права доступа объекта
  if [ "$(stat -c '%a' "$item")" == "755" ]; then
    # Если права совпадают с 755, записываем путь к объекту в файл
    echo "$item" >> "$output_file"
  fi
done

echo "Результат записан в файл: $output_file:"
echo "Файл:"

cat $output_file
