class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.420.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.420.1/snyk-macos"
    sha256 "0af3e23fda2740f279b3ad8f410b7af8574677d9a608f16dd5950e2c7d16c400"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.420.1/snyk-linux"
    sha256 "61d7006a1741a276ec528f2c2467ec86c30c1db757522e9c5010f60142185fcf"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
