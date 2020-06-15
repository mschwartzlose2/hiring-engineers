api_key=215f1779e61ab8eb3ec19085d06a3f97
app_key=9dc8bc26a23a466088ff5a59fc999d4d6be5a8ee
curl -X POST -H "Content-type: applicaiton/json" \
-d '{
  "title": "Display my_metric and Mongo opcounters on cent76 Dashboard", 
  "description": "Timeboard with my_metric created with API",
  "graphs" : 
  [
    {
      "title": "my_metric over host",
      "definition": {
        "events": [],
        "requests": [
          {"q": "avg:my_metric{host:cent76}"}
        ]
      },
      "viz": "timeseries"
    },
    {
      "title": "Mongo opcounter",
      "definition": {
        "events": [],
        "requests": [
          {"q": "anomalies(avg:mongodb.opcounters.getmoreps{host:cent76}, \"basic\", 3)"}
        ]
      }, 
      "viz": "timeseries"
    },
    {
      "title": "my_metric sum rollup",
      "definition": {
        "events": [],
        "requests": [
          {"q": "avg:my_metric{host:cent76}.rollup(\"sum\", 3600)"}
        ]
      }
    }
  ]
}' \
"https://api.datadoghq.com/api/v1/dash?api_key=${api_key}&application_key=${app_key}"