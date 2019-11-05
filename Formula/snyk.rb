class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.242.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.242.0/snyk-macos"
    sha256 "62637a14ed09dd76085bf0f05fb0f7211a237c083e1256c23a0f882581bbff8a"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.242.0/snyk-linux"
    sha256 "8b3ea8e722a0665e8ac090c42e63c19a96d86acdd1476a62acda61474278dd48"
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
