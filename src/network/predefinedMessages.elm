module Network.PredefinedMessages exposing
    ( closeJson
    , openJson
    , sendJson
    , sendJson2
    )


openJson : String
openJson =
    String.trim
        """
         {
         "module": "WebSocket",
         "tag": "open",
         "args":{
            "key": "elminator",
            "url": ""
            }
          }
        """


sendJson : String -> String
sendJson message =
    String.trim
        """{
        "module": "WebSocket",
        "tag": "send",
        "args": {
        "key": "elminator",
         "message":"""
        ++ message
        ++ """}
        }"""


sendJson2 : String -> String -> String
sendJson2 field message =
    String.trim
        "{\"module\": \"WebSocket\", \"tag\": \"send\", \"args\": {\"key\": \"elminator\", \"message\":{ \""
        ++ field
        ++ "\":"
        ++ message
        ++ "}}}"


closeJson : String
closeJson =
    String.trim
        """
         {
           "module": "WebSocket",
           "tag": "close",
           "args": {
             "key": "elminator",
             "reason": "Just because."
           }
         }
        """
