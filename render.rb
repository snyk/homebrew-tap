#! /usr/bin/env ruby

#
# This script grabs the latest release details from the GitHub API for a project
# and then generates a Homebrew Formula.
#
# It currently assumes you have separate binaries for Linux and macOS and generates
# a forumula which works with both homebrew and linuxbrew.
#
# This is intended for cases where projects release quickly and you want a Homebrew Tap
# to track those releases closely, and where you don't have automation (like
# Goreleaser) which can generate Homebrew Formula automatically.
#

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
