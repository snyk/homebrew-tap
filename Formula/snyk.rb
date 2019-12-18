class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.262.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.262.0/snyk-macos"
    sha256 "db24da546c17a26d69a5a30a6d135461137b64d1d17f78a089d1b14354cb01b7"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.262.0/snyk-linux"
    sha256 "4bdd512d9132d9c5c8afbfee0d7c27078cef2ef9eefb447a39fd69506bc6a962"
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
