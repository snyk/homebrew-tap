class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.446.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.446.0/snyk-macos"
    sha256 "8fca1f256808546469a2d5be995d0b20cf9435a0fcf0f639571297fab69756e4"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.446.0/snyk-linux"
    sha256 "4860ad12fa25a55312f99ecba0207e77368ea120023f473c6b81aa2e5e895ebb"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
