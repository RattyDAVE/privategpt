FROM ubuntu

EXPOSE 3000 5000

RUN apt update && \
	apt install -y curl && \
	curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
	apt install -y git nodejs python3 curl build-essential mc python3-dev wget supervisor && \
	curl https://bootstrap.pypa.io/get-pip.py | python3  && \
	cd /root  && \
	git clone https://github.com/SamurAIGPT/privateGPT.git  && \
	sed -i 's/localhost/"+window.location.hostname+"/g' privateGPT/client/components/ConfigSideNav.js  && \
	sed -i 's/localhost/"+window.location.hostname+"/g' privateGPT/client/components/MainContainer.js  && \	
	cd privateGPT/client  && \
	npm install  && \
	cd /root && \
	cd privateGPT/server  && \
	pip3 install -r requirements.txt  && \
	apt-get -y autoclean && apt-get -y autoremove && \
	apt-get -y purge $(dpkg --get-selections | grep deinstall | sed s/deinstall//g) && \
	rm -rf /var/lib/apt/lists/*  && \
	cd models  && \
	wget https://gpt4all.io/models/ggml-gpt4all-j-v1.3-groovy.bin && \
	echo "[program:privategtp-server]" > /etc/supervisor/conf.d/pgpt-server.conf && \
	echo "command=python3 /root/privateGPT/server/privateGPT.py" >> /etc/supervisor/conf.d/pgpt-server.conf && \
	echo "process_name = python3" >> /etc/supervisor/conf.d/pgpt-server.conf && \
	echo "[program:pgpt-clinet]" > /etc/supervisor/conf.d/pgpt-clinet.conf && \
	echo "command=/root/privateGPT/client/npm run dev" >> /etc/supervisor/conf.d/pgpt-client.conf && \
	echo "process_name = npm" >> /etc/supervisor/conf.d/pgpt-client.conf

CMD "/usr/bin/supervisord -n"
