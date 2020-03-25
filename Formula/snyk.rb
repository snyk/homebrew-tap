class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.304.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.304.0/snyk-macos"
    sha256 "69b91c94a5392de19fa35c3cc818352c0e7ecc2176a6c03570734d3bae543d0d"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.304.0/snyk-linux"
    sha256 "a4b71f088d9aee8b3a0642fcadc55447129c32038f9d0a75325351d7ed0b4f61"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
