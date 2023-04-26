class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1146.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1146.0/snyk-macos"
    sha256 "f9170041d4fdbf4ca3843f36315318c7585f9cff879d17f92558a559a4bb7055"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1146.0/snyk-linux"
    sha256 "2cce99f17926a21b7ffb964c4825cde3d8a3dc18fd092dae06597c41a26583ad"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
