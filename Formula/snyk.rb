class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.377.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.377.1/snyk-macos"
    sha256 "cc62ae118b18cace61cc5876a708021bdf0cfcfcefd0a9717dbfc8c3b99689db"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.377.1/snyk-linux"
    sha256 "e6dfc50277fe20a010f01a000e22e3eca26627b462d9be58bbaad9e99a929723"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
