#!/bin/sh
set -e
cd "$(dirname "$0")"
make -s
if [ -x "$HOME/.local/bin/dwm" ] && pidof dwm >/dev/null; then
	cp "$HOME/.local/bin/dwm" "$HOME/.local/bin/dwm.good"
fi
make -s install
pid=$(pidof -s dwm || true)
[ -n "$pid" ] && kill -HUP "$pid" && echo "dwm ($pid) reiniciado"
