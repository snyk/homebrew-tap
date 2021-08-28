class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.694.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.694.0/snyk-macos"
    sha256 "4083bd6c924a7d06def4142714ea80b3652d438372d2c7aee1c4581534684759"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.694.0/snyk-linux"
    sha256 "92f12efde97ea08e5308fb6d708aaa2f54425af1112388e104d267de8645312a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
