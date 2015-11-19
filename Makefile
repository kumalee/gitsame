TRIM="${PWD}/trim.sh"
GITSAME="${PWD}/gitsame.sh"
TRIM_BIN="/usr/local/bin/trim"
GITSAME_BIN="/usr/local/bin/gitsame"

install:
	@echo 'Create softlink for trim, gitsame...'
	ln -s ${TRIM} ${TRIM_BIN}
	ln -s ${GITSAME} ${GITSAME_BIN}
	@echo 'Done'

uninstall:
	@echo 'Delete softlink for trim, gitsame...'
	rm ${TRIM_BIN}
	rm ${GITSAME_BIN}
	@echo 'Done'
