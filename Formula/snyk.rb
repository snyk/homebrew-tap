class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.236.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.236.1/snyk-macos"
    sha256 "7e19631f6d6534d0eb80574813fa7ff3b005be3c7bd86b9adfd7ec13faa1a5a2"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.236.1/snyk-linux"
    sha256 "9f508d44b1d93a52bc03ad47fdb773fb1455e2b72b4ef205f705583b64fbec36"
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
