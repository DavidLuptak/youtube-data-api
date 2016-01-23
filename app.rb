#!/usr/bin/env ruby
# encoding:utf-8
require 'net/http'
require 'json'
require 'uri'
require 'pp'
require 'open-uri'

GOOGLE_API_URL    = 'https://www.googleapis.com/'
QUERY             = 'youtube/v3/videos?part=statistics'
VIDEO_ID          = '&id=#video_id#'
DEVELOPER_KEY     = '&key=#developer_key#'
UNKNOWN           = 'neznámy'
YOUTUBE_WATCH_URL = 'https://www.youtube.com/watch?v=#video_id#'
results           = []

def url_exist?(url_string)
  uri = URI.parse(url_string)
  response = Net::HTTP.get_response(uri)

  if response.is_a? Net::HTTPRedirection
    redrct_location = response['location']
    # p "#{redrct_location}: #{response.code}"
    url_exist?(redrct_location)
  else
    response.code != '404'
  end
rescue # URI::InvalidURIError etc.
  false
end

def url(video_id)
  return nil unless url_exist?(YOUTUBE_WATCH_URL.sub('#video_id#', video_id))
  YOUTUBE_WATCH_URL.sub('#video_id#', video_id)
end

def count_stat(video_id, developer_key)
  # video does not exist
  return nil unless url_exist?(YOUTUBE_WATCH_URL.sub('#video_id#', video_id))

  full_query = "#{QUERY}
                #{VIDEO_ID.sub('#video_id#', video_id)}
                #{DEVELOPER_KEY.sub('#developer_key#', developer_key)}"
  data = open("#{GOOGLE_API_URL}#{full_query}").read
  data = JSON.parse(data)

  # video is not available
  return nil unless data['pageInfo']['totalResults'] != 0

  data['items'][0]['statistics']['viewCount']
end

# main

developer_key = ARGV.shift

ARGV.each do |video_id|
  results << {
    'developer key' => developer_key,
    'url'           => url(video_id) || UNKNOWN,
    'view count'    => count_stat(video_id, developer_key) || UNKNOWN
  }
end

pp results
