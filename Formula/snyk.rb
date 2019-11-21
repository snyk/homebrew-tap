class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.250.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.250.0/snyk-macos"
    sha256 "0a88dc05e321d795ec98f2c6c9e8757b52ffe0b8af42f8f96696cd59c278f7a6"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.250.0/snyk-linux"
    sha256 "0a40af78bec44a3f8bf9e79c0b85751171645b786e1dbd0119edf4e440cf5fbb"
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
