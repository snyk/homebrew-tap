class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.277.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.277.0/snyk-macos"
    sha256 "6b95cba31be9cf498bce2dfc91e69b5632dc1d8fffcf2857b62429837a428737"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.277.0/snyk-linux"
    sha256 "14a2ddc9af741ca3cec82bf1a325e89f3f20f9c257edf23bd59bb9879218213b"
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
