curl "http://127.0.0.1:9080/apisix/admin/routes/1" \
-H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' \
-X PUT -d '{
    "name": "Route with retry",
    "methods": ["GET"],
    "uri": "/api/weathers",
    "upstream_id": "1",
    "plugins": {
        "proxy-rewrite": {
            "retry": {
                "attempts": 3,
                "retry_http_codes": [500, 502, 503],
                "retry_delay": 1
            }
        }
    }
}'
