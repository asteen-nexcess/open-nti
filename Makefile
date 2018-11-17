###
DOCKER_FILE = docker-compose.yml
DOCKER_FILE_P = docker-compose-persistent.yml
AGENT_CONTAINER_NAME = aura_input-agent_1
TIME ?= 1m
TAG ?= all

start:
	@echo "Use docker compose file: $(DOCKER_FILE)"
	docker-compose -f $(DOCKER_FILE) up -d

stop:
	@echo "Use docker compose file: $(DOCKER_FILE)"
	docker-compose -f $(DOCKER_FILE) down

cron-show:
	docker exec -it $(AGENT_CONTAINER_NAME) /usr/bin/python /opt/open-nti/startcron.py -a show  -c "/usr/bin/python /opt/open-nti/open-nti.py -s"

cron-add:
ifeq ($(TAG), all)
	docker exec -it $(AGENT_CONTAINER_NAME) /usr/bin/python /opt/open-nti/startcron.py -a add -t "$(TIME)" -c "/usr/bin/python /opt/open-nti/open-nti.py -s"
else
	docker exec -it $(AGENT_CONTAINER_NAME) /usr/bin/python /opt/open-nti/startcron.py -a add -t "$(TIME)" -c "/usr/bin/python /opt/open-nti/open-nti.py -s --tag $(TAG)"
endif

cron-delete:
ifeq ($(TAG), all)
	docker exec -it $(AGENT_CONTAINER_NAME) /usr/bin/python /opt/open-nti/startcron.py -a delete -c "/usr/bin/python /opt/open-nti/open-nti.py -s"
else
	docker exec -it $(AGENT_CONTAINER_NAME) /usr/bin/python /opt/open-nti/startcron.py -a delete -c "/usr/bin/python /opt/open-nti/open-nti.py -s --tag $(TAG)"
endif

cron-debug:
ifeq ($(TAG), all)
	docker exec -i -t $(AGENT_CONTAINER_NAME) /usr/bin/python /opt/open-nti/open-nti.py -s -c
else
	docker exec -i -t $(AGENT_CONTAINER_NAME) /usr/bin/python /opt/open-nti/open-nti.py -s -c --tag $(TAG)
endif
