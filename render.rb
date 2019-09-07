#! /usr/bin/env ruby

require "erb"
require "json"
require "open-uri"

PROJECT = "snyk/snyk"
BIN = "snyk-macos"

api_url = "https://api.github.com/repos/#{PROJECT}/releases/latest"

data = URI.parse(api_url).read
obj = JSON.parse(data)

version = obj["name"]
sha_url = "https://github.com/#{PROJECT}/releases/download/#{version}/#{BIN}.sha256"

sha = URI.parse(sha_url).read

@sha256 = sha.split(" ").first
@version = version
@url = "https://github.com/#{PROJECT}/releases/download/#{version}/#{BIN}"

template = File.read("template.erb")

renderer = ERB.new(template)
puts output = renderer.result()
