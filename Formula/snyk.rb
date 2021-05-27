class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.613.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.613.0/snyk-macos"
    sha256 "80fc05f5ea785cdbc09d7909bdc3dee22ffd0959d34fa8147cac8114751ab1b9"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.613.0/snyk-linux"
    sha256 "9de25a112d7e73c2d334a07b7624feccb4be529c7a8ed10b0de85114fed0d204"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
