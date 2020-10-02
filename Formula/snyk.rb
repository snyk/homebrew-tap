class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.406.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.406.0/snyk-macos"
    sha256 "16ebf419c8a69f16637344713e14e244bbe158cd9ee536976f63a28448d62a4b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.406.0/snyk-linux"
    sha256 "7a4eae4233884fb671a96216fbda9c6381fcf27599c437784f79687e3e105973"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
