set env vars
set -o allexport; source .env; set +o allexport;

sleep 10s;

target=$(docker-compose port app 3000)

curl http://${target}/api/login \
  -H 'accept: application/json' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'content-type: application/json' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36' \
  --data-raw '{"username":"admin","password":"'${ADMIN_PASSWORD}'"}' \
  --compressed


  curl http://${target}/api/settings \
  -X 'PUT' \
  -H 'accept: application/json' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'content-type: application/json' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36' \
  --data-raw '{"settings":{"scraper_type":"none","notification_interval":"daily","notification_email":"'${ADMIN_EMAIL}'","smtp_server":"'${SMTP_SERVER}'","smtp_port":"'${SMTP_PORT}'","smtp_username":"'${SMTP_USER}'","smtp_password":"'${SMTP_PASSWORD}'","scaping_api":"","search_console_integrated":false,"available_scapers":[{"label":"Scraping Robot","value":"scrapingrobot"},{"label":"ScrapingAnt","value":"scrapingant"},{"label":"SerpApi.com","value":"serpapi"},{"label":"Serply","value":"serply"},{"label":"Proxy","value":"proxy"}],"notification_email_from":"'${SMTP_FROM}'"}}' \
  --compressed