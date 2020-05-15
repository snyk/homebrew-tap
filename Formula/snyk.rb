class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.321.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.321.0/snyk-macos"
    sha256 "512e1d53e7a7a8df8c566bfe8aeadaa2d825e9ceea7346ca1718dac721dde45b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.321.0/snyk-linux"
    sha256 "4ce653394c2dbb4173a90459a2a5f2c08797b5c9fe2fd53de9cc9204ea0cc05d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
