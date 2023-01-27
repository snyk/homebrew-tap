class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1091.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1091.0/snyk-macos"
    sha256 "150c56f3ae523f1f41dfe8a672263588002bb1fd2a28f26c986d25e5defd7a05"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1091.0/snyk-linux"
    sha256 "062801c201c50c258ba1d326a0a54f78787851067e6a591288a4c71295839f56"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
