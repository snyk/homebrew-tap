class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.399.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.399.0/snyk-macos"
    sha256 "24c92a422fb943acf8d19e58f0ed970692898b48d72b240eec8b3f38a255613b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.399.0/snyk-linux"
    sha256 "630cfa76ca04b81bcebe491d3ca4c734636c3381a24b5a7150faaf041dfc497a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
