class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.464.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.464.0/snyk-macos"
    sha256 "22e3e0cf89bcd5c1e290c2afd10ad013a479d983fed5415b703bec247b845555"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.464.0/snyk-linux"
    sha256 "b124cca9f6d34a31d81904953902a27b53e0e68659246ae59021db892c7032bb"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
