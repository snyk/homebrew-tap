class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.995.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.995.0/snyk-macos"
    sha256 "c69160eb934a381df0d1ff0e3c9f8787d6cc7f153154580ab5c022cff397834b"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.995.0/snyk-linux"
    sha256 "1294a64d75d6b9e8b3974c3c7e07be40e80485e731c4d32153852cc9d44e9c58"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
