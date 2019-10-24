class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.237.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.237.1/snyk-macos"
    sha256 "b79a7c72c03adf9b35b5672a30292ea5a584e21450d3d05fbe38ff667890a6f8"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.237.1/snyk-linux"
    sha256 "a69fa5966d4f97bd81a4c9f92691fa2a6bafe473b0daab9de0573d205fbb6e22"
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
