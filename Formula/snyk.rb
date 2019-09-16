class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.227.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.227.0/snyk-macos"
    sha256 "569300b2c4f7ccaefef0a396a8ac4af2962c990856d3e1e196cca5343a7e4379"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.227.0/snyk-linux"
    sha256 "74cbc68382759fac71845f86ae8321e85d352ea5584e70f2598ab1ff8e7a7c9c"
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
