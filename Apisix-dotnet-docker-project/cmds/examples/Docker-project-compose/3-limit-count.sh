curl -i http://127.0.0.1:9080/apisix/admin/routes/1 -H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
    "methods": ["GET"],                                       
    "uri": "/api/weathers",
    "plugins": {
        "limit-count": {
            "count": 2,
            "time_window": 60,
            "rejected_code": 403,
            "rejected_msg": "Requests are too frequent, please try again later.",
            "key_type": "var",
            "key": "remote_addr"
        }
    },
    "upstream": {                           
      "type": "roundrobin",
      "nodes": {
       "weatherapi:80": 1
     }
   }
}'

# The above configuration limits the number of requests to two in 60 seconds. 
# Apache APISIX will handle the first two requests as usual, but a third request 
# in the same period will return a 403 HTTP code:

curl http://127.0.0.1:9080/api/weathers -i 