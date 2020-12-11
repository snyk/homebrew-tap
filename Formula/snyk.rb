class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.436.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.436.0/snyk-macos"
    sha256 "c1c548cc201f04ec442429df8bb1638387fb0517292f26c32527d2dbde1c2d03"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.436.0/snyk-linux"
    sha256 "ac60a53725421468248ae85ae9cd9b30e1939e8d37a0c34ca2268203f08d826d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
