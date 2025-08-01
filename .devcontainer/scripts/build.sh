#!/bin/zsh

. /development/.devcontainer/scripts/log.sh

log "LVGL Submodule restore started" "info" 0
git submodule update --init --recursive /development/user_modules/lv_binding_micropython
log "LVGL Submodule restore completed" "success" 0

log "PICO Submodule restore started" "info" 0
make -C /development/ports/rp2 BOARD=RPI_PICO_W submodules
log "PICO Submodule restore completed" "success" 0

log "PICO cleanup started" "info" 0
make -C /development/ports/rp2 BOARD=RPI_PICO_W clean
log "PICO cleanup completed" "success" 0

log "Building MPY-Cross started" "info" 0
make -C /development/mpy-cross
log "Building MPY-Cross completed" "success" 0

log "Building PICO Firmware started" "info" 0
make -C /development/ports/rp2 BOARD=RPI_PICO_W USER_C_MODULES=/development/user_modules/lv_binding_micropython/bindings.cmake
log "Building PICO Firmware completed" "success" 0