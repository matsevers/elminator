module Network.PredefinedMessages exposing (closeJson, openJson, sendJson)


openJson : String
openJson =
    String.trim
        """
         {"module": "WebSocket", "tag": "open", "args": {"key": "elminator", "url": "ws://nas.janke.cloud:60000"}}
        """


sendJson : String -> String
sendJson message =
    String.trim
        """{"module": "WebSocket", "tag": "send", "args": {"key": "elminator", "message":"""
        ++ message
        ++ """}}"""


closeJson : String
closeJson =
    String.trim
        """
         {"module": "WebSocket", "tag": "close", "args": {"key": "elminator", "reason": "Just because."}}
        """
