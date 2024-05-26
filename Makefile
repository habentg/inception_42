COMPOSE 		= cd ./srcs/ && docker compose
DATA_DIR        = /home/${USER}/data/data_vol
DB_DIR          = /home/${USER}/data/db_vol

# ----------------------- building services --------------------------
up: keygen vols
	$(COMPOSE) -f docker-compose.yml up --build -d

keygen:
	@cd ./srcs/requirements/nginx/tools/ && ./keygen.sh && cd -

vols:
	@mkdir -p ${DB_DIR} ${DATA_DIR}
# @mkdir -p ./srcs/db_vol ./srcs/data_vol


# ----------------------- removing services --------------------------
down: del_keys
	$(COMPOSE) -f docker-compose.yml down

del_keys:
	@rm -rf ./srcs/requirements/nginx/tools/certs/*.pem
	@rm -rf ./srcs/requirements/nginx/tools/certs/*.crt

# ----------------------- restarting services --------------------------
start:
	$(COMPOSE) -f docker-compose.yml start

stop:
	$(COMPOSE) -f docker-compose.yml stop

restart: stop start # restarting the services (volumes, network, and images stay the same)

re: down up # rebuilding the services without deleting the persistent storages


# ----------------------- Deleting services and their resources --------------------------
fclean: down
	yes | docker system prune --all
	@docker volume rm $$(docker volume ls -q)

rm-volume: 
	@docker volume rm $$(docker volume ls -q)


# ----------------------- rebuilding from scratch --------------------------
rebuild: fclean up 

.PHONY: all re down fclean up


# improvements if needed:
#	1. mounting nginx.conf instead of copying, so we dont have to rebuild the image everything we change something.
#	2. 