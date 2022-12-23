class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1076.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1076.0/snyk-macos"
    sha256 "1b1e5b79e63294cb101e62759c465b1eb813abbdbf19e3dbb191fde71853f8e5"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1076.0/snyk-linux"
    sha256 "3348ca53cffea31100952bf4357a81b8cf5153d2952d005c8fac9d6eddba723f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
