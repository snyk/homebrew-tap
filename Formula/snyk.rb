class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.269.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.269.0/snyk-macos"
    sha256 "d82384ac1ffee68f891c146275a6a8bb87dcf41e73c0ea5ec77a55c013870a43"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.269.0/snyk-linux"
    sha256 "1c702af415f53dab62c10f41975c40cae1844387cc649de0715c2a8bea936f49"
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
