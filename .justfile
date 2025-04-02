set export

RED := '\033[0;31m'
GREEN := '\033[0;32m'
YELLOW := '\033[1;33m'
BLUE := '\033[0;34m'
NC := '\033[0m'

@_default:
  just --list



# Start stack
@start:
  just _info "Starting application stack..."
  docker compose up -d

# Stop stack
@stop:
  just _warn "Stopping application stack..."
  docker compose stop

@wipe:
  docker rm -f telegraf grafana prometheus

_info MESSAGE:
  #!/usr/bin/env bash
  echo -e "${GREEN}[INFO]${NC} {{MESSAGE}}"

_warn MESSAGE:
  #!/usr/bin/env bash
  echo -e "${YELLOW}[WARNING]${NC} {{MESSAGE}}"

_debug MESSAGE:
  #!/usr/bin/env bash
  echo -e "${BLUE}[WARNING]${NC} {{MESSAGE}}"

_error MESSAGE:
  #!/usr/bin/env bash
  echo -e "${RED}[ERROR]${NC} {{MESSAGE}}"
  exit 1