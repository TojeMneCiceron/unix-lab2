#!/bin/bash
echo ""
echo "========== КОНСОЛЬНЫМ МАЧО ПРИВЕТ ОСТАЛЬНЫМ СОБОЛЕЗНУЮ =========="
echo ""

while true; do
	OPTIONS="Список_файлов Удалить_файл Переименовать_файл Выход"
	select opt in ${OPTIONS}
	do
		case ${opt} in
			"Список_файлов")
				echo ""
				ls
				echo ""
				break
			;;
			"Удалить_файл")
				echo "===== Введите имя файла"
				while true; do
					read name
					if [[ "$name" == "" ]]; then
						break
					elif [[ -f $name ]]; then
						rm $name
						echo "===== Файл ${name} удален"
						break
					elif [[ -d $name ]]; then
						rm -r $name
						echo "===== Файл ${name} удален"
						break
					else
						echo "===== Файл не найден. Введите другое имя"
					fi
				done
				break
			;;
			"Переименовать_файл")
				echo "===== Введите старое имя файла"
				while true; do
					read name
					if [[ "$name" == "" ]]; then
						break
					elif [[ -f $name || -d $name ]]; then
						break
					else
						echo "===== Файл не найден. Введите другое имя"
					fi
				done

				if [[ "$name" == "" ]]; then
					break
				fi

				echo "===== Введите новое имя файла"
				while true; do
					read new_name
					if [[ "$new_name" == "" ]]; then
						break
					elif [[ -f $new_name || -d $new_name ]]; then
						echo "===== Такой файл уже существует. Введите другое имя"
					else
						mv $name $new_name
						echo "===== Файл успешно переименован"
						break
					fi
				done
				break
			;;
			"Выход")
				echo ""
				echo "========== ПОЖЕЛАНИЕ ДОБРОГО ДНЯ =========="
				echo ""
				exit
			;;
			*)
				echo "Неверная команда"
			;;
		esac
	done
done
