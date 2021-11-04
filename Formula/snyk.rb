class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.752.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.752.0/snyk-macos"
    sha256 "5a10d30a82da9d09781edb61039aebf13c1a7826b2420591f21542028ef9d5ec"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.752.0/snyk-linux"
    sha256 "46ad116ebd0112b6ca78542b89036a3a53666fc23347f94decae5ed12ea4fea1"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
