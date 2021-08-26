class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.689.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.689.0/snyk-macos"
    sha256 "5b38ee2e103549776e47cb943378fa1bba57e73b363fcbee3775acf99511a0e5"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.689.0/snyk-linux"
    sha256 "9ac0fe9d316a6af048d88b04c535fd60dfad0994fd055f72a1682b777b1695e3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
