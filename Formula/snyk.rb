class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1004.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1004.0/snyk-macos"
    sha256 "703fa97c8098cc42073643901228ee70766379f1a1e14237b0b38f6e6bfd109b"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1004.0/snyk-linux"
    sha256 "fdf4a283928fd522c23c63312617eee3571b997d7832e5d73c6e5d1331a40bad"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
