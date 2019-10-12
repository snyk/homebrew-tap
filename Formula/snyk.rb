class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.234.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.234.2/snyk-macos"
    sha256 "a8b7de2c34ba71ac5fd6ab23dc3c9fd30cc7408d262f898400239e6bda9779b0"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.234.2/snyk-linux"
    sha256 "79fe80b1b498f0bd5db78dae5249a0654516403c388beb83eda87679f7d38158"
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
