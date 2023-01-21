class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1088.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1088.0/snyk-macos"
    sha256 "082f239234f7a28a45b71ff73e53301164c497deb82d5d64abbde73aa37cb3e5"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1088.0/snyk-linux"
    sha256 "1aca9c514f852a0b43e277a07319a6f81a407a5b3a45142f617cf6b52edaf711"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
