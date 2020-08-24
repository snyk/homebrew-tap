class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.381.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.381.2/snyk-macos"
    sha256 "c1b29f7b0835facb2273c69ee9e2af1200c00838549062850a1087c8247f660a"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.381.2/snyk-linux"
    sha256 "0edf7fb0b6c3378cfc976506347211a6effd7ecc6461edc27017ce4a75f4deef"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
