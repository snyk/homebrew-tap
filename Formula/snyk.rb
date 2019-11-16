class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.248.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.248.0/snyk-macos"
    sha256 "515100781020fbbdb0c384002bd70d08bbdf07dd106ffa887b0fb4134faead39"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.248.0/snyk-linux"
    sha256 "564a45ee91f61d6a9646245578e42b8c5f63856a220490522ace3132a733e0ba"
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
