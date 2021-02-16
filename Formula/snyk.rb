class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.455.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.455.0/snyk-macos"
    sha256 "e4400fe681aea8628410b21a941b499d7c8bdcb349a4e5793e28b8038cc91971"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.455.0/snyk-linux"
    sha256 "8505f4e7ac1035bf07834e147cbe3c5de772a3fe76064efb3518780822406fd8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
