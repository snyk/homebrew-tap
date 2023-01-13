class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1087.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1087.0/snyk-macos"
    sha256 "bd578ed449f9fc9a5bbd132130d00d12a5c0d634cc95de6dbc75848faa07b068"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1087.0/snyk-linux"
    sha256 "be6e032df93841dbef19009826750d7694e19dc16d22fdf197aefa598d9653c9"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
