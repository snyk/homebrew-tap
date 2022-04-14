class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.905.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.905.0/snyk-macos"
    sha256 "20e065b42f76c9bf780336e073fa9f428df5c3f606cd4291e375424395aaaa93"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.905.0/snyk-linux"
    sha256 "dd97c32c41bd41ce6bde5c9efe95ad1c3182f2e2ac8d705ec3ab9d79b11e62ac"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
