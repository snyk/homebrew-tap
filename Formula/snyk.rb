class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.239.5"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.239.5/snyk-macos"
    sha256 "f8cdd8911166c6828d3ddef1294fb9ef6b0b8fb1e558672c578bd4dea15e416b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.239.5/snyk-linux"
    sha256 "0aa5e36eb39d7b3e244adbc32c98b8713db6204a70638e18b83aa2ef4c0b977b"
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
