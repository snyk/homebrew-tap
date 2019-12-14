class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.260.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.260.0/snyk-macos"
    sha256 "992432484f72832845c0905e2604200e8980e3c2bd81e9bd3a560d5ba7b31110"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.260.0/snyk-linux"
    sha256 "4c8825b926a01909f7c116b2df4ba4c4bdfbb9ec310894775acf8a41a5bdff85"
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
