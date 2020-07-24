class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.366.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.366.0/snyk-macos"
    sha256 "70bd7d7f85e01ad1e60911f971968ac6abcd8a93d1cce23761259fe80baf6ae5"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.366.0/snyk-linux"
    sha256 "ee5efbf44eaa7073992f74a98f990ca958f3b203a0d15471276e97f86b6efa82"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
