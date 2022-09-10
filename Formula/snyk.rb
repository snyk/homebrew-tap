class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1001.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1001.0/snyk-macos"
    sha256 "a261de4f10f03a5fbc71399e60ef4921858134adac8dada8aeab0b465a3ae7ec"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1001.0/snyk-linux"
    sha256 "f131d2fed8440594ebfbff12ca02edd8dbcdd1b36956e17a3bcd8a98f495b0f8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
