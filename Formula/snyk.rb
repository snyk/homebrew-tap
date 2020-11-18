class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.427.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.427.2/snyk-macos"
    sha256 "404780118bcd175fcf9be76541fad2e78416fee992e30e5a35a24cf445bde0b5"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.427.2/snyk-linux"
    sha256 "cbb4e08e817b24f6bb35cc9b292ab4c5c1752e0ce90f19af010590bc2298895d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
