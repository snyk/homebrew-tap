class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.277.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.277.2/snyk-macos"
    sha256 "88e01997d07c1f5cb264ccc89905784c9ef685d7886bf22ea565f31aa1d8c075"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.277.2/snyk-linux"
    sha256 "268ee71fe762655f7b82a274606783c6969005e0388c8f17e86e68e29dcf2046"
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
