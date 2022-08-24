class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.991.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.991.0/snyk-macos"
    sha256 "23febfba1f0a3ab0f7d16ad7c0b6a438df11c6298134a1f56082d15b5dc1ad0c"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.991.0/snyk-linux"
    sha256 "33d1373f8a6ce52dccdc2ee1b62f79b3cc727df432b8f8569e3243c470a12a26"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
