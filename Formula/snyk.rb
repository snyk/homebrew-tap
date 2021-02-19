class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.457.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.457.0/snyk-macos"
    sha256 "3c6dc3e9d2fce234a1f44aaf272f54e8daea986901e55f7b7f54bfc6425e1216"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.457.0/snyk-linux"
    sha256 "ae69ae659b5e77cc9a705cb755f12b8682b5be77dd87af2bf40960f801e76a7b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
