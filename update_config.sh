#!/bin/bash

INPUT_FILE="server.conf"
OUTPUT_FILE="modified_server.conf"

echo " Server Configuration Update Script"
echo "------------------------------------"

read -p "Enter NEW Server IP: " NEW_IP
read -p "Enter NEW Hostname: " NEW_HOST
read -p "Enter NEW Port: " NEW_PORT

read -p "Enter MAX_CONNECTIONS value: " MAX_CONN
read -p "Enter TIMEOUT value: " TIMEOUT_VAL

echo ""
echo " Previewing changes"
echo "------------------------------------"

sed -n "s/^SERVER_IP=.*/SERVER_IP=$NEW_IP/p" "$INPUT_FILE"
sed -n "s/^HOSTNAME=.*/HOSTNAME=$NEW_HOST/p" "$INPUT_FILE"
sed -n "s/^PORT=.*/PORT=$NEW_PORT/p" "$INPUT_FILE"

echo ""
read -p "Apply these changes? (y/n): " CONFIRM
[ "$CONFIRM" != "y" ] && echo " Cancelled" && exit 0

echo "Generating modified_server.conf ..."

sed \
  -e '/^# Configuration updated/d' \
  -e "s/^SERVER_IP=.*/SERVER_IP=$NEW_IP/" \
  -e "s/^HOSTNAME=.*/HOSTNAME=$NEW_HOST/" \
  -e "s/^PORT=.*/PORT=$NEW_PORT/" \
  -e "s/^MAX_CONNECTIONS=.*/MAX_CONNECTIONS=$MAX_CONN/" \
  -e "s/^TIMEOUT=.*/TIMEOUT=$TIMEOUT_VAL/" \
  "$INPUT_FILE" > "$OUTPUT_FILE"

# Append only if missing
grep -q '^MAX_CONNECTIONS=' "$OUTPUT_FILE" || echo "MAX_CONNECTIONS=$MAX_CONN" >> "$OUTPUT_FILE"
grep -q '^TIMEOUT=' "$OUTPUT_FILE" || echo "TIMEOUT=$TIMEOUT_VAL" >> "$OUTPUT_FILE"

# Insert fresh comment
sed -i '' "1i\\
# Configuration updated on $(date)
" "$OUTPUT_FILE"

echo ""
echo " Final modified_server.conf:"
echo "-------------------------------"
sed -n 'p' "$OUTPUT_FILE"

echo " Done!"
