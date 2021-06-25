class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.645.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.645.0/snyk-macos"
    sha256 "c58163e243ba022cb05a7fd6767b07243984c08b14f5b2705b96caefc0abec62"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.645.0/snyk-linux"
    sha256 "5e80f7f8ecc39626080a6e359b1d3e0e6cec8c7ed124a3d01d17cec8815fa395"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
