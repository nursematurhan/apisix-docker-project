curl "http://127.0.0.1:9080/apisix/admin/upstreams/1" \
-H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" \
-X PUT -d '{
    "type": "roundrobin",
    "nodes": {
        "weatherapi:80": 1
    },
    "timeout": {
        "connect": 5,  # Connection timeout (seconds)
        "send": 5,     # Send timeout (seconds)
        "read": 5      # Read timeout (seconds)
    }
}'
