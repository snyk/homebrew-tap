class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.972.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.972.0/snyk-macos"
    sha256 "5242065c138b8a50d241c1c97454e83fc5d776a065a5b0ce2331652b0d0d060c"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.972.0/snyk-linux"
    sha256 "bf95b924ca4770e1956368dcb32a37219ad54a7bb4a0767b5b1372c2ed7e9557"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
