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

BIN = "snyk"

# Return the URL, SHA and version information for a GitHub release
def get_latest_release(bin)
  snyk_cli_version_url = "https://static.snyk.io/cli/latest/release.json"
  data = URI.parse(snyk_cli_version_url).read
  obj = JSON.parse(data)
  version = obj["version"]
  url = obj["assets"][bin]["url"]
  sha256 = obj["assets"][bin]["sha256"].split.first

  return url, sha256, version
end

@url_macos, @sha256_macos, @version = get_latest_release("#{BIN}-macos")
@url_macos_arm64, @sha256_macos_arm64, _ = get_latest_release("#{BIN}-macos-arm64")
@url_linux, @sha256_linux, _ = get_latest_release("#{BIN}-linux")
@url_linux_arm64, @sha256_linux_arm64, _ = get_latest_release("#{BIN}-linux-arm64")

template = File.read(File.join(__dir__, "template.erb"))

renderer = ERB.new(template)
puts renderer.result()
