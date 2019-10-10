class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.234.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.234.0/snyk-macos"
    sha256 "bf6f1a97c9187ebc1979a46ff2136394a38cdd00745e979d1d785542f7f761b2"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.234.0/snyk-linux"
    sha256 "b40d8e5b2a3eede77a3bf9a9d0e0e6cae3ff91773f149cb016a7617c812f05a4"
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
