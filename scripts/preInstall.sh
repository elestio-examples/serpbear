set env vars
set -o allexport; source .env; set +o allexport;

mkdir -p ./serpbear_appdata
chown -R 1001:1001 ./serpbear_appdata
