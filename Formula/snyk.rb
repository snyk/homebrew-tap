class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1096.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1096.0/snyk-macos"
    sha256 "695345989fd4e7a7d031081b90b8f35e4db537f98e2bc3a8bdbd37e7761202e6"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1096.0/snyk-linux"
    sha256 "70d74dfeed0869c9accf56043e0941bc9d2a485ccfe17e23d8e7802b7d248c84"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
