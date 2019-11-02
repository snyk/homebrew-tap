class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.241.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.241.0/snyk-macos"
    sha256 "ffd6d82018a04924ad8156e1e6e30c6a2bb7b71b85fa7d9e061f04220184d533"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.241.0/snyk-linux"
    sha256 "1c12f660139a0d0256a919ac3e534641e8eb4e95cde30abb2fffa0494d0597d0"
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
