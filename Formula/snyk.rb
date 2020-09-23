class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.399.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.399.1/snyk-macos"
    sha256 "e13df8260e4b84c1d9bbe695d3b40c1d092013b74c8a44849e7fb03b7c0136a7"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.399.1/snyk-linux"
    sha256 "1cc7ed8cd15f7a6d9c876e4ec0f91dfa4f7135438314cc47abcfd10a98417096"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
