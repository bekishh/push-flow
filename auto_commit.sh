#!/bin/bash

# Переходим в директорию репозитория
cd /home/beqishh/push-flow || exit

# Генерация случайного количества коммитов (от 65 до 76)
commits_today=$((6000 + RANDOM % 12))

# Цикл для выполнения нужного количества коммитов
for ((i=1; i<=commits_today; i++))
do
    # Записываем текущую дату и время в файл
    echo "$(date) - Commit $i of $commits_today" >> auto_update.txt

    # Добавляем все изменения
    git add .

    # Коммитим изменения
    git commit -m "Auto commit $i of $commits_today on $(date)"

done

# Пушим изменения в удаленный репозиторий
git push origin main
