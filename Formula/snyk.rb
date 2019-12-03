class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.254.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.254.0/snyk-macos"
    sha256 "58fa2dd2929d25a00b30f01cd70a7e7825bc3d79b08a511b66596e8f33282c75"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.254.0/snyk-linux"
    sha256 "ece8a7b4239070c2d62ae0604e7fc3c0de25f13b4b71054b2f89986e81e0a4ed"
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
