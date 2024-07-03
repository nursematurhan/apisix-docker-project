curl "http://127.0.0.1:9080/apisix/admin/upstreams/1" \
-H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" \
-X PUT -d '{
    "type": "roundrobin",
    "nodes": {
        "weatherapi:80": 1
    },
    "checks": {
        "active": {
            "http_path": "/health",
            "host": "weatherapi",
            "port": 80,
            "healthy": {
                "interval": 2,
                "successes": 1
            },
            "unhealthy": {
                "interval": 2,
                "http_failures": 2
            }
        },
        "passive": {
            "healthy": {
                "http_statuses": [200],
                "successes": 3
            },
            "unhealthy": {
                "http_statuses": [500],
                "http_failures": 3
            }
        }
    }
}'
