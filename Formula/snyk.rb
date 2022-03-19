class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.878.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.878.0/snyk-macos"
    sha256 "919fc589393a397cf1ae21052d882778adfa150e272b92ec14e4d9341a0732b6"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.878.0/snyk-linux"
    sha256 "3e971285860d3fbcd9fe11dec5b715dad925edc933338f3592155b8a1618585c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
