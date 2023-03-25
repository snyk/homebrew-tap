class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1127.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1127.0/snyk-macos"
    sha256 "0eee7ed707d373d284ce86764178bc81e76ae3e6c23a4b8c95ac444a0b412bdb"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1127.0/snyk-linux"
    sha256 "b3c259c23db3a15c5f296711635641ea7f5408665b243a7b009480d2d582b0e0"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
