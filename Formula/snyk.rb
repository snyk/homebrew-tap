class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.450.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.450.0/snyk-macos"
    sha256 "a5c2e137ac7b7169dfba0d70e0b9783c5aa9d52e936bbc506e0c25a31aa9a02e"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.450.0/snyk-linux"
    sha256 "89c19a6450821026210f98967003f5ed3da66f34b6a947a1226fc6009209151a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
