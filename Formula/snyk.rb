class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.566.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.566.0/snyk-macos"
    sha256 "8eec73fe7459f57f59869ffb683b77c8746918679d513464cdd0ad9433e1a3e3"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.566.0/snyk-linux"
    sha256 "c6720e60bc9d17317c85c9ef6131c5422491d5694756eb6dc7844f4540db7b46"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
