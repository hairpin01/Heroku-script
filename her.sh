#!/bin/zsh

# if [[ $(whoami) == "root" ]]; then
#     echo "Скрипт запушен от имени root или sudo вы написали блять"
#     exit 1
# fi

sleep 0.5
echo " _   _                _            _           _        _ _           "
sleep 1
echo "| | | | ___ _ __ ___ | | ___   _  (_)_ __  ___| |_ __ _| | | ___ _ __ "
sleep 0.5
echo "| |_| |/ _ \ .__/ _ \| |/ / | | | | | ._ \/ __| __/ _  | | |/ _ \ .__|"
sleep 0.3
echo "|  _  |  __/ | | (_) |   <| |_| | | | | | \__ \ || (_| | | |  __/ |   "
sleep 0.2
echo "|_| |_|\___|_|  \___/|_|\_\__.__| |_|_| |_|___/\__\__._|_|_|\___|_|   "
sleep 0.5
echo "======================================================="
sleep 0.3
echo "by @Hairpin00"

echo "\nЗапуск хероку"

if [[ ! -d "Heroku" ]]; then
    echo "Установи хероку для начала"
    sleep 0.7
    echo "лан ща установлю, и инет проверим"
    sleep 1
    echo "[...]"
    
    if ! ping -c 4 1.1.1.1 &>/dev/null; then
        echo "У вас нету инета, пака"
        exit 1
    fi
    
    echo "[###]"
    sleep 1
    echo "сматрю есть ли у вас нужные пакеты"
    
    install_packages() {
        if command -v pacman &>/dev/null; then
            echo "у вас pacman"
            sleep 1
            if command -v pip &>/dev/null && command -v python3 &>/dev/null && command -v git &>/dev/null; then
                echo "кочать пакеты не надо"
                sleep 0.5
            else
                echo "опа у вас ниту чивота"
                sleep 1
                sudo pacman -S python-pip python3 git --noconfirm
            fi
        elif command -v apt &>/dev/null; then
            echo "У вас ubunta/дебиан"
            sleep 0.5
            if command -v pip &>/dev/null && command -v python3 &>/dev/null && command -v git &>/dev/null; then
                echo "кочать пакеты не надо"
            else
                echo "опа у вас ниту чивота"
                sleep 1
                if command -v pkg &>/dev/null; then
                    echo "а, у вас термукс нахуй"
                    sleep 0.5
                    pkg update -y
                    pkg upgrade -y
                    pkg install python python-pip git rust -y
                else
                    sudo apt update -y
                    sudo apt upgrade -y
                    sudo apt install python3-pip python3 git -y
                fi
            fi
        else
            echo "под вашу ос ниту скачки пакетов сами как нибуть сделайте ок?"
            echo "припер поддерживаемых os:"
            sleep 0.5
            echo "arch linux <- (под него писался скрипт)"
            echo "дебиан или его форк убунта"
            echo "termux (бета, ну типа да)"
            sleep 0.9
            echo "всо, большего не дано"
            exit 1
        fi
    }
    
    install_packages
    
    sleep 0.5
    echo "лан, качаю хероку"
    
    if ! git clone https://github.com/coddrago/Heroku &>/dev/null; then
        echo "сори, но скочать не удаётся"
        exit 1
    fi
    
    echo "Успешно, тэпэрь делаем виртуалку"
    cd Heroku || exit 1
    
    echo "[#. ]"
    if ! python3 -m venv .venv; then
        echo "[ERROR] ни найдет venv/python, ахуй"
        exit 1
    fi
    
    if ! source .venv/bin/activate; then
        echo "[ERROR] source error"
        exit 1
    fi
    
    echo "[###]"
    sleep 1
    echo "Скачиваем библиотеки питона через pip"
    echo "[   ]"
    sleep 0.5
    
    if ! pip install --upgrade pip &>/dev/null; then
        echo "[ERROR] не удалось обновить pip"
        exit 1
    fi
    
    echo "[#. ]"
    
    if ! pip install -r requirements.txt &>/dev/null; then
        echo "ой чот нито, ща ща"
        if command -v pacman &>/dev/null; then
            sudo pacman -S python-pip --noconfirm
        fi
        echo "пробую заного"
        if ! pip install -r requirements.txt &>/dev/null; then
            echo "та бля тахда я хз"
            sleep 1
            exit 1
        fi
    fi
    
    echo "[###]"
    sleep 1
    echo "ну всо"
    sleep 0.5
    echo "патом ещо раз запусти скрипт, или сам запусти хероку"
    echo "так щас пажди не многа"
    python3 -m heroku --no-web --root &>/dev/null 
    exit 0
fi

cd Heroku || exit 1

if [[ ! -d ".venv" ]]; then
    python3 -m venv .venv
fi

source .venv/bin/activate

echo "[   ]"
sleep 3
echo "Запуск"
sleep 0.3

if ! ping -c 1 1.1.1.1 &>/dev/null; then
    echo "\n[!!!]"
    echo "[ERROR] No internet connection..."
    sleep 1
    exit 1
fi

echo "[.  ]"
sleep 0.5

echo "[.. ]"
sleep 0.6

if ! command -v python3 &>/dev/null; then
    echo "[!!!]"
    sleep 0.1
    echo "[ERROR] python is not install"
    exit 1
fi

echo "[#..]"
sleep 0.3

echo "[###]"
python3 -m heroku --no-web --root
