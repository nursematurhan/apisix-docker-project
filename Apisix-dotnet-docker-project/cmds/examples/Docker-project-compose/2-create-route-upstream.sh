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

#request to our target API /api/weathers

curl http://127.0.0.1:9080/api/weathers -i 