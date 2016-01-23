# YouTube Data API
This app provides getting statistics (namely view count, at this moment) about a single video on the YouTube.

## Example of query and response
GET request to the following URL:
```
https://www.googleapis.com/youtube/v3/videos?part=statistics&id=O-l-UatRsXg&key=AIzaSyB3STF7Bjt5M9P0TWDElZfBYO8QNWVoH5I
```
will produce this API response
```
{
 "kind": "youtube#videoListResponse",
 "etag": "\"abQHWywil_AkNqdqji7_FqiK-u4/boPgLty56Lwds-_NAIQT-jDBWbE\"",
 "pageInfo": {
  "totalResults": 1,
  "resultsPerPage": 1
 },
 "items": [
  {
   "kind": "youtube#video",
   "etag": "\"abQHWywil_AkNqdqji7_FqiK-u4/g_VRxpbwZXlzbw307rB1Bn1LaVo\"",
   "id": "O-l-UatRsXg",
   "statistics": {
    "viewCount": "1494",
    "likeCount": "16",
    "dislikeCount": "0",
    "favoriteCount": "0",
    "commentCount": "0"
   }
  }
 ]
}.
```

## Usage
Via command line interface:
`$ bundle exec ./app.rb <developer_key> <video_id>`.

#### What is `<developer_key>`?
Refers to https://developers.google.com/youtube/2.0/developers_guide_protocol#Developer_Key.

#### What is `<video_id>`?
Refers to https://developers.google.com/youtube/2.0/developers_guide_protocol#Retrieve_video_entry.

#### Example of usage
`$ bundle exec ./app.rb AIzaSyB3STF7Bjt5M9P0TWDElZfBYO8QNWVoH5I O-l-UatRsXg`

will produce

```
[{"developer key"=>"AIzaSyB3STF7Bjt5M9P0TWDElZfBYO8QNWVoH5I",
"url"=>"https://www.youtube.com/watch?v=O-l-UatRsXg",
"view count"=>"1494"}].
```
