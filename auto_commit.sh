#!/bin/bash

# Переходим в директорию репозитория
cd /home/beqishh/push-flow || exit

# Записываем текущую дату и время в файл
echo "$(date)" >> auto_update.txt

# Добавляем все изменения
git add .

# Коммитим изменения с текущей датой и временем
git commit -m "Auto commit on $(date)"

# Пушим изменения в удаленный репозиторий
git push origin main
