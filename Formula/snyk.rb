class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.274.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.274.0/snyk-macos"
    sha256 "fa8e8ed19467f91941a3c5b8111469285fa59931de6159d3f16727a9f4346278"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.274.0/snyk-linux"
    sha256 "812f024777ccb7cec41a3a5d34bf172c6e566020c79f681050cad86a54271e1c"
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
