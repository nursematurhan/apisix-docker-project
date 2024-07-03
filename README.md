# apisix-docker-project

1. You can start our application by running docker compose up command from the root folder of the project: docker-compose up -d
   
2. Once the containers are running, navigate to http://localhost:5555/api/weathers in your web browser

Configure APISIX API Gateway

1. You can create a Route and configure the underlying Upstream. When Apache APISIX receives a request matching the Route, it forwards it to the underlying Upstream.
   
2.  Adding a Route and Upstream for the /api/weathers endpoint. The following command creates a sample Route together with an upstream:
   
      curl "http://127.0.0.1:9080/apisix/admin/routes/1" -H "X-API-KEY: edd1c9f034335f136f87ad84b625c8f1" -X PUT -d '    
      {
         "methods": ["GET"],                                       
         "uri": "/api/weathers",                   
         "upstream": {                           
           "type": "roundrobin",
           "nodes": {
             "weatherapi:80": 1
           }
         }
       }'
    
4. You can check whether it works. Apache APISIX should forward the request to our target API /api/weathers.
   curl http://127.0.0.1:9080/api/weathers -i

Enable a Traffic Management Plugin

1. Enable the limit-count plugin on the Route and Upstream. To do so, run the following command:
   
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
   
   2.The above configuration limits the number of requests to two in 60 seconds. Apache APISIX will handle the first two requests as usual, but a third request in the same period will return a 403 HTTP code: 
   
   curl http://127.0.0.1:9080/api/weathers -i


--More information: https://apisix.apache.org/
