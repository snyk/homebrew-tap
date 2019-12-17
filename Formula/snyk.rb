class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.261.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.261.0/snyk-macos"
    sha256 "68f44a5580c78fc6f3b83a73d551f2e83e2a5e97bb061de5c65a56576fe0868c"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.261.0/snyk-linux"
    sha256 "0dd68442b1aacc286d10a31f8c27b40633c1e3ec8a25cb476e9164641cce9af7"
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
