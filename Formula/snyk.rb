class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.253.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.253.0/snyk-macos"
    sha256 "d223128fed79113bdd3942677b3fb17e499fb75ebdd457e68a64d9e071e9241d"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.253.0/snyk-linux"
    sha256 "49ac7d63feff83b614c6633aebd143e12a73d1685adb3bf5022b1bf77c9dce6c"
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
