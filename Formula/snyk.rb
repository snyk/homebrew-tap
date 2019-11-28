class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.251.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.251.2/snyk-macos"
    sha256 "e152a5b20d17a93603a284ff77107f86d1cf60a33d5531f5b804fb993bb145a6"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.251.2/snyk-linux"
    sha256 "05b841824911befb5bef8c9d00cbfe1a2c6f0a3565f4b9abead03a30ae97accc"
  end

  def install
    original = OS.linux? ? "snyk-linux" : "snyk-macos"
    mv original, "snyk"
    bin.install "snyk"
  end

  test do
    system "#{bin}/snyk --version"
  end
end
