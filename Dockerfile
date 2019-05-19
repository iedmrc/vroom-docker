FROM hammermc/vroom-docker

WORKDIR /

RUN apt-get update && \
    apt-get remove --purge expat gosu netcat postgresql-client -y && \
    apt-get install -y git && \
    rm -rf /vroom-express && \
    git clone --depth 1 https://github.com/VROOM-Project/vroom-express.git && \
    cd /vroom-express && \
    npm install && \
    apt purge -y git && \
    apt autoremove --purge -y && \
    apt clean && \
    apt-get autoremove -y && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

COPY config.js /vroom-express/src/config.js

WORKDIR /vroom-express

CMD ["npm", "start"]