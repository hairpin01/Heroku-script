#!/bin/zsh
echo "start heroku-dev"
sleep 1
for i in {1..10}; do bar=$(printf '▰%.0s' $(seq 1 $i)); empty=$(printf '▱%.0s' $(seq $i 9)); echo -ne "\r$bar$empty $(($i*10))%"; sleep 0.2; done; echo && for i in ▁ ▂ ▃ ▄ ▅ ▆ ▇ █ ▇ ▆ ▅ ▄ ▃ ▂;
if cd Heroku-dev &> /dev/null; then
	python -m venv .venv
        source .venv/bin/activate
        python3 -m heroku --root --no-web
else
	mkdir Heroku-dev 
	cd Heroku-dev
	echo "==> build heroku-dev"
	# echo "[   ]"
	sleep 1
	echo "=> build .github [   ]"
	mkdir .github
        mkdir assets
        mkdir heroku 
	mkdir web-resource
	cd .github
	mkdir ISSUE_TEMPLATE workflows
	cd ISSUE_TEMPLATE
	if wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/.github/ISSUE_TEMPLATE/heroku-improvement-request.md &>> her-dev.log; then
		echo "install heroku-improvement-request.md [##.]"
	else
		cat her-dev.log
		exit 1
	fi
	cd ..
	cd workflows
	# echo "[## ]"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/.github/workflows/docker-deploy.yml &>> her-dev.log
	cd ..
	cd ..
	echo ".github build [OK]"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/.deepsource.toml &>> her-dev.log
	echo "build her" # echo "[.  ]"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/.dockerignore &>> her-dev.log
	
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/.flake8 &>> her-dev.log
	# echo "[.. ]"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/.gitignore &>> her-dev.log
	
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/CHANGELOG.md &>> her-dev.log
	
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/CODE_OF_CONDUCT.md &>> her-dev.log
	# echo "[...]"
	if cd assets &>> her-dev.log; then
		;
	else
		mkdir assets
		cd assets
	fi
	echo "=> build assets"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/assets/2fa.txt &>> her-dev.log
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/assets/banner.txt &>> her-dev.log
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/assets/download.txt &>> her-dev.log 
	echo "[50%]"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/assets/font.ttf &>> her-dev.log
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/assets/font.ttf &>> her-dev.log
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/assets/success.txt &>> her-dev.log
	echo "build assets [OK]"
	cd ..
	echo "=> build heroku"
	cd heroku
	mkdir compat inline langpacks modules secure utils web 
	if cd compat &>> her-dev.log; then
		;
	else
		mkdir compat
		cd compat
	fi
	echo "build compat/heroku"
	if wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/compat/geek.py &>> her-dev.log; then
		echo "[.  ]"
	else
		cat her-dev.log
		exit 1
	fi
	echo "build compat/heroku [OK]"
	sleep 1
	echo "build inline/heroku"
	cd ..
	cd inline
	if wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/inline/bot_pm.py &>> her-dev.log; then
		;
	else
		cat her-dev.log
		exit 1
	fi
	echo "build inline/heroku [OK]"
	sleep 1
	echo "build core/inline/heroku"
	if wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/inline/core.py &>> her-dev.log; then
		;
	else
		cat her-dev.log
		exit 1
	fi
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/inline/events.py &>> her-dev.log
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/inline/form.py &>> her-dev.log
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/inline/gallery.py &>> her-dev.log
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/inline/list.py &>> her-dev.log
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/inline/query_gallery.py &>> her-dev.log
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/inline/token_obtainment.py &>> her-dev.log
	# echo "[.. ]"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/inline/types.py &>> her-dev.log
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/inline/utils.py &>> her-dev.log
	cd ..
	if ! cd langpacks; then
		mkdir langpacks
		cd langpacks
	fi
	echo "build langpacks/heroku"
	if wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/langpacks/ru.yml &>> her-dev.log; then
		;
	else 
		cat her-dev.log
		exit 1
	fi
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/langpacks/de.yml &>> her-dev.log
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/langpacks/en.yml &>> her-dev.log
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/langpacks/ua.yml &>> her-dev.log
	echo "build langpacks/heroku [OK]"
	cd ..
	sleep 1
	cd modules
	echo "build modules/heroku"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/modules/api_protection.py &>> her-dev.log
	echo "install api_protection.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/modules/eval.py &>> her-dev.log
	echo "install eval.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/modules/help.py &>> her-dev.log
	echo "install help.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/modules/heroku_backup.py  &>> her-dev.log
	echo "install heroku_backup.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/modules/heroku_config.py  &>> her-dev.log	
	echo "install heroku_config.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/modules/heroku_info.py &>> her-dev.log
	echo "install heroku_info.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/modules/heroku_security.py &>> her-dev.log
	echo "install heroku_security.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/modules/heroku_settings.py &>> her-dev.log
	echo "install heroku_settings.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/modules/heroku_web.py &>> her-dev.log
	echo "install heroku_web.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/modules/inline_stuff.py &>> her-dev.log
	echo "install inline_stuff.py"
	wget https://raw.githubusercontent.com/MuRuLOSE/limoka/refs/heads/main/Limoka.py &>> her-dev.log
	echo "install Limoka.py"
	wget https://x0.at/sVPI.py &>> her-dev.log
	echo "install GitRepo"
	if wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/modules/loader.py &>> her-dev.log; then
		echo "install loader.py"
	else
  		cat her-dev.log
		exit 1
	fi
	wget https://raw.githubusercontent.com/Fixyres/FHeta/refs/heads/main/FHeta.py &>> her-dev.log
	echo "install Fheta"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/modules/presets.py &>> her-dev.log
	echo "install presets.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/modules/quickstart.py &>> her-dev.log
	echo "install quickstart.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/modules/settings.py &>> her-dev.log
	echo "install settings.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/modules/terminal.py &>> her-dev.log
	echo "install terminal.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/modules/test.py &>> her-dev.log
	echo "install test.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/modules/translate.py &>> her-dev.log
	echo "install translate.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/modules/translations.py &>> her-dev.log
	echo "install translations.py"
	wget https://files.catbox.moe/qcejvt.py &>> her-dev.log
	echo "install SilentTags"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/master/heroku/modules/updater.py  &>> her-dev.log
	echo "install updater.py"
	sleep 1
	# потом тут будет проверка но мне щас лень
	echo "build modules/heroku [OK]"
	cd ..
	if cd secure &>> her-dev.log; then
		;
	else
		mkdir secure
		cd secure
	fi
	echo "build secure/heroku"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/secure/__init__.py &>> her-dev.log
	echo "build __init__.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/secure/customtl.py &>> her-dev.log
	echo "build customtl.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/secure/patcher.py &>> her-dev.log
	echo "build patcher.py"
	sleep 1
	echo "build secure/heroku [OK}"
	cd ..
	if cd utils &>> her-dev.log; then
		echo "build utils"
	else
		mkdir utils
		cd utils
	fi
	if wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/utils/__init__.py &>> her-dev.log; then
		echo "build __init__.py"
	else
		cat her-dev.log
		exit 1
	fi
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/utils/args.py &>> her-dev.log
	echo "build args.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/utils/entity.py &>> her-dev.log
	echo "build entity.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/utils/git.py &>>  her-dev.log
	echo "build git.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/utils/heroku.py &>> her-dev.log
	echo "build heroku.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/utils/messages.py &>> her-dev.log
	echo "build messages.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/utils/other.py &>> her-dev.log
	echo "build other.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/utils/platform.py &>> her-dev.log
	echo "build platform.py"
	sleep 1
	echo "build utils/heroku [OK]"
	cd ..
	if cd web &>> her-dev.log; then
		echo "build web/heroku"
	else
		mkdir web
		cd web
	fi
	
	
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/web/core.py &>> her-dev.log
	echo "build core"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/web/debugger.py &>> her-dev.log
	echo "build debugger.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/web/proxypass.py &>> her-dev.log
	echo "build proxypass.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/web/root.py &>> her-dev.log
	echo "build root"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/web/ssh_tunnel.py &>> her-dev.log
	echo "build ssh_tunnel.py"
	sleep 1
	echo "build web [OK]"
	sleep 0.1
	cd ..
	echo "build heroku"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/__init__.py &>> her-dev.log
	echo "[#. ]"
	sleep 0.1
	echo "build __init__.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/__main__.py &>> her-dev.log
	echo "build __main__"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/_internal.py &>> her-dev.log
	echo "build _internal.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/_local_storage.py &>> her-dev.log
	echo "build _local_storage.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/_reference_finder.py &>> her-dev.log
	echo "build _reference_finder.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/_types.py &>> her-dev.log
	echo "build _types.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/configurator.py &>> her-dev.log
	echo "build configurator.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/database.py &>> her-dev.log
	echo "build database.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/dispatcher.py &>> her-dev.log
	echo "build dispatcher.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/loader.py &>> her-dev.log
	echo "build loader"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/log.py &>> her-dev.log
	echo "build log.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/main.py &>> her-dev.log
	echo "build main.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/pointers.py &>> her-dev.log
	echo "build pointers.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/qr.py &>> her-dev.log
	echo "build qr.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/security.py &>> her-dev.log
	echo "build security.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/tl_cache.py &>> her-dev.log
	echo "build tl_cache.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/translations.py &>> her-dev.log
	echo "build translations.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/types.py &>> her-dev.log
	echo "build types.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/validators.py &>> her-dev.log
	echo "build validators.py"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/heroku/version.py &>> her-dev.log
	echo "build version.py"
	sleep 1
	echo "build heroku [OK]"
	cd ..
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/Dockerfile &>> her-dev.log
	echo "install Dockerfile"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/LICENSE &>> her-dev.log
	echo "install LICENSE"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/banner.sh &>> her-dev.log
	echo "install banner.sh"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/optional_requirements.txt &>> her-dev.log
	echo "install optional_requirements.txt"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/poetry.lock &>> her-dev.log
	echo "install poetry.lock"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/pyproject.toml &>> her-dev.log
	echo "install pyproject.toml"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/requirements.txt &>> her-dev.log
	echo "install requirements.txt"
	cd heroku
	sleep 1
	if cd web-resources &>> her-dev.log; then
		echo "build web-resources"
		wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/web-resources/base.jinja2 &>> her-dev.log
		echo "build base.jinja2"
		wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/web-resources/root.jinja2 &>> her-dev.log
		echo "build root.jinja2"
	else
		mkdir web-resources
		cd web-resources
		echo "build web-resources"
                wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/web-resources/base.jinja2 &>> her-dev.log
                echo "build base.jinja2"
                wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/web-resources/root.jinja2 &>> her-dev.log
                echo "build root.jinja2"
	fi
	mkdir static
	cd static
	sleep 1
	echo "build static/web-resources"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/web-resources/static/4T7FajtZbx.lottie &>> her-dev.log
	echo "build 4T7FajtZbx.lottie"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/web-resources/static/Movement.ttf &>> her-dev.log
	echo "build Movement.ttf"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/web-resources/static/base.css &>> her-dev.log
	echo "build base.css"
	wget https://raw.githubusercontent.com/coddrago/Heroku/refs/heads/dev/web-resources/static/root.js &>> her-dev.log
	cd ..
	cd ..
	cd ..
	echo "build .git"
	wget https://x0.at/tmvL.zip  &>> her-dev.log
	unzip -o -q tmvL.zip
	rm -rf tmvL.zip
	echo "build .git [OK]"
	echo "==> build heroku-dev [OK]"
	exit 0	
f 
