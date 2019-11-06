class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.243.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.243.0/snyk-macos"
    sha256 "eae8b704a14aa6af2196c503e3049d075695bc8f385e50d43935f041356b7014"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.243.0/snyk-linux"
    sha256 "945e58302fd3958416f6532af8209d5b4a8844f198eaa07ef11630b00e17a3fb"
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
