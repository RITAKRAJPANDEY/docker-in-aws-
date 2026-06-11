.PHONY: install-docker

install-docker:
	@if [ "$$(id -u)" -ne 0 ]; then \
			echo "Error: Please run 'sudo make install-docker'"; \
			exit 1; \
	fi
	@chmod +x ./install_docker.sh
	@./install_docker.sh