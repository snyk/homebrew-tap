class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.440.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.440.1/snyk-macos"
    sha256 "003d3ecd90b47c908c77f0a4a97e4ac1cc92dac49dd23af618932641d7217b20"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.440.1/snyk-linux"
    sha256 "8774e87290bd7251ebdfb4c1a76d6be633c72a5d90c5dbbb37b531619d91e04b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
