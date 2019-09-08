#! /usr/bin/env ruby

require "erb"
require "json"
require "open-uri"

PROJECT = "snyk/snyk"
BIN = "snyk"

# Return the URL, SHA and version information for a GitHub release
def get_latest_release(project, bin)
  api_url = "https://api.github.com/repos/#{project}/releases/latest"
  data = URI.parse(api_url).read
  obj = JSON.parse(data)
  version = obj["name"]
  sha_url = "https://github.com/#{project}/releases/download/#{version}/#{bin}.sha256"
  sha = URI.parse(sha_url).read
  url = "https://github.com/#{project}/releases/download/#{version}/#{bin}"
  sha256 = sha.split(" ").first

  return url, sha256, version
end



@url, @sha256, @version = get_latest_release(PROJECT, "#{BIN}-macos")
@url_linux, @sha256_linux, _ = get_latest_release(PROJECT, "#{BIN}-linux")

template = File.read("template.erb")

renderer = ERB.new(template)
puts renderer.result()
