class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.447.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.447.0/snyk-macos"
    sha256 "0ccca0bead18b47d47b9898166e65373522167a24d8a9e7920392179742daee0"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.447.0/snyk-linux"
    sha256 "8e1d58e29dda776cf6c67cd6f2bfc195b2990539363e99d7614805f1ad1b63b5"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
