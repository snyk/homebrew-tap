class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.267.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.267.0/snyk-macos"
    sha256 "9372dc03efdba9f0b6b5a68bfe26a3bbaf94460b8e1ee14fbe921bd9b707c1f5"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.267.0/snyk-linux"
    sha256 "f76bb692aefb39533d9f2d36c2e403afbe715384a90e2040f8386ede324b4ef0"
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
