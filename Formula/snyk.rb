class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"

  url "https://github.com/snyk/snyk/releases/download/v1.226.0/snyk-macos"
  version "v1.226.0"
  sha256 "34bc05f23a09a1d66fd674abf886e790057231c6a6bf66727c3eb10af9645b57"

  def install
    mv "snyk-macos", "snyk"
    bin.install "snyk"
  end

  test do
    system "#{bin}/snyk --version"
  end
end
