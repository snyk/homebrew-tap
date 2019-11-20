class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.249.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.249.1/snyk-macos"
    sha256 "9007e7b6f982e998d828e6edc785f8d71f658a03d0a7e57d6f4eae9d88100a01"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.249.1/snyk-linux"
    sha256 "e516f54a39f146fbafe7ebfee17b4df31c4b4501f313ee909e7580ac6487cb02"
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
