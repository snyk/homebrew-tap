class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.277.3"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.277.3/snyk-macos"
    sha256 "5e972ac7269476d3c1edc3a6d91de0c6b2ce105cc8378ccc83c5f2905eac6cf1"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.277.3/snyk-linux"
    sha256 "fa39a042d19cc8cfa03033a5b041f93e109a554f1d5617f2f3a9f59f75b3011c"
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
