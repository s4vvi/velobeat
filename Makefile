FILEBEAT_MODULE_DIR=/usr/share/filebeat/module
FILEBEAT_CONFIG_DIR=/etc/filebeat
MODULE_NAME=velociraptor

.PHONY: install check_root

check_root:
	@if [ "$$(id -u)" -ne 0 ]; then \
		echo "This action requires root privileges. Please run with sudo."; \
		exit 1; \
	fi

install: check_root
	mkdir -p $(FILEBEAT_MODULE_DIR)/$(MODULE_NAME)
	cp -r velociraptor/* $(FILEBEAT_MODULE_DIR)/$(MODULE_NAME)/
	cp velociraptor.yml $(FILEBEAT_CONFIG_DIR)/modules.d/velociraptor.yml
