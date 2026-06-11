.PHONY: install-docker check

install-docker:
	@if [ "$$(id -u)" -ne 0 ]; then \
			echo "Error: Please run 'sudo make install-docker'"; \
			exit 1; \
	fi
	@chmod +x ./install_docker.sh ./dockerSetup.sh
	@./install_docker.sh

check:
	@bash -n ./install_docker.sh ./dockerSetup.sh