class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1130.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1130.0/snyk-macos"
    sha256 "580c27b365d5fa984a767c0bde1914369f35183bdc6d8ada0f11dda461a5ba55"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1130.0/snyk-linux"
    sha256 "0c29bd7c34bca8be6735326da803bc25ee24faf32405771c847f5749f247fd96"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
