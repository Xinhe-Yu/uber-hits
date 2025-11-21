COMPOSE ?= docker compose

.PHONY: prod-build prod-up prod-down prod-logs dev-build dev-up dev-down dev-logs

prod-build:
	$(COMPOSE) -f docker-compose.yml build

prod-up:
	$(COMPOSE) -f docker-compose.yml up --build

prod-down:
	$(COMPOSE) -f docker-compose.yml down

prod-logs:
	$(COMPOSE) -f docker-compose.yml logs -f

dev-build:
	$(COMPOSE) -f docker-compose.dev.yml build

dev-up:
	$(COMPOSE) -f docker-compose.dev.yml up --build

dev-down:
	$(COMPOSE) -f docker-compose.dev.yml down

dev-logs:
	$(COMPOSE) -f docker-compose.dev.yml logs -f
