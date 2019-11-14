class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.247.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.247.1/snyk-macos"
    sha256 "25cb199e7ef6f24ca31c06b66536eebe2531b16f45f4675d2f2b6b1a30415792"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.247.1/snyk-linux"
    sha256 "51d0440ddd9c85d1a7213f0b3e6b7479f0fe337b2f5b9595ac3f1634607a9cab"
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
