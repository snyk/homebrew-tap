class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.258.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.258.2/snyk-macos"
    sha256 "93cba4d40f70d918cc171d519b7116c59169b0ad360b4f74257b7fa1f64fef43"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.258.2/snyk-linux"
    sha256 "e3e72b8d8871a2afa97a177d35e6417fc8004df745babb7f40494ea2ce4df89f"
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
