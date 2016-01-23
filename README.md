# YouTube Data API
This app provides getting statistics (namely view count, at this moment) about a single video on the YouTube.

## Usage
Via command line interface:
`$ bundle exec ./app.rb <developer_key> <video_id>`.

#### What is `<developer_key>`?
Refers to https://developers.google.com/youtube/2.0/developers_guide_protocol#Developer_Key

#### What is `<video_id>`?
Refers to https://developers.google.com/youtube/2.0/developers_guide_protocol#Retrieve_video_entry

#### Example of usage
`$ bundle exec ./app.rb AIzaSyB3STF7Bjt5M9P0TWDElZfBYO8QNWVoH5I O-l-UatRsXg`

will produce

```
[{"developer key"=>"AIzaSyB3STF7Bjt5M9P0TWDElZfBYO8QNWVoH5I",
"url"=>"https://www.youtube.com/watch?v=O-l-UatRsXg",
"view count"=>"1494"}].
```
