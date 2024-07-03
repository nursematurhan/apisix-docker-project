curl "http://127.0.0.1:9080/apisix/admin/routes/1" \
-H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" \
-X PUT -d '{
    "name": "Route with fallback",
    "methods": ["GET"],
    "uri": "/api/weathers",
    "upstream_id": "1",
    "plugins": {
        "proxy-rewrite": {
            "scheme": "http",
            "uri": "/fallback/weathers"
        },
        "api-breaker": {
            "break_response_code": 502,
            "max_breaker_sec": 30,
            "unhealthy": {
                "http_statuses": [500, 503],
                "failures": 1
            },
            "healthy": {
                "http_statuses": [200],
                "successes": 1
            }
        }
    }
}'
