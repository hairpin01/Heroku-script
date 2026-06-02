#!/usr/bin/env fish
# fish verion 

set cwd (pwd) 
set heroku_userbot_url 'https://github.com/coddrago/Heroku'

function main --description "установка + установка зависимостей"
	if not test -d "$cwd/Heroku"
		echo "start install Hikoky"
	else
		echo "Уже установлено, пака"
		return 0
	end
	function create_venv --description "создание venv, args: venv_name"
		if set -q argv[1]
			set venv_name $argv[1]
		else
			set venv_name ".venv"
		end
		if command -v python3 >/dev/null 2>&1
			python3 -m venv "$venv_name"
			if test -d "$venv_name"
				echo "> venv created in $cwd/$venv_name"
				return 0
			else
				echo "> venv not created"
				return 1

			end
		else
			echo "> python3 not found"
			return 1
		end
	end
	function install_requirements_and_Heroku --description "установка зависимостей и установка Heroku"
		function check_package
			if command -v pacman >/dev/null 2>&1
				pacman -Q git python3 python-pip &>/dev/null 1>&2
			else if command -v git &>/dev/null 1>&2 && command -v python3 &>/dev/null 1>&2 && command -v pip3 &>/dev/null && command -v rustc &>/dev/null 1>&2
				return 0
			else
				return 1
			end
		end
		if check_package
			echo '> requirements already installed'
		else 
			echo '> installing requirements'		
			if command -v pacman >/dev/null 2>&1
				sudo pacman -Sy git python3 python-pip --noconfirm
				echo '> arch base distro'
			else if command -v apt-get >/dev/null 2>&1
				echo '> ubuntu/debian base distro'
				sudo apt-get install git python3 python3-pip -y
			else if command -v pkg >/dev/null 2>&1
				echo '> termux'
				# rm -rf /data/data/com.termux/files/usr а ой
				pkg update
				pkg upgrade -y	
				pkg install git python3 python-pip rust -y 
			else if command -v dnf >/dev/null 2>&1
				echo '> fedora'
				sudo dnf install git python3 python-pip -y
			else
				echo '> unknown distro'
			end
		end
		
		set base_name (path basename "$heroku_userbot_url")

		if git clone "$heroku_userbot_url" "$cwd/$base_name"
			echo "> git clone $heroku_userbot_url in $cwd/$base_name"
		else
			echo "> git clone $heroku_userbot_url in $cwd/$base_name failed"
			return 1
		end

		if test -d "$cwd/$base_name"
			cd "$cwd/$base_name"
			if not create_venv ".venv_$base_name"
				return 1
			else
				source "$cwd/$base_name/.venv_$base_name/bin/activate.fish"
				echo "source $cwd/$base_name/.venv_$base_name/bin/activate.fish" >> "$__fish_config_dir/config.fish"
			end

			python3 -m pip install -q --disable-pip-version-check --no-warn-script-location -r "$cwd/$base_name/requirements.txt"
		else
			echo "> $cwd/$base_name not found"
			return 1
		end
	end

	if not install_requirements_and_Heroku
		return 1
	end

	echo "> Heroku installed in $cwd/Heroku"
	return 0
end

if not main
	exit 1
end
set dirname (path basename $heroku_userbot_url)
cd "$dirname"
echo 'done'
python3 -m heroku --no-web



	

