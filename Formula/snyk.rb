class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.987.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.987.0/snyk-macos"
    sha256 "42daddf757eb1ad84f80b766ca3499a54a99dd035ca60e996fcd5870e967ee58"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.987.0/snyk-linux"
    sha256 "2b52b1c81057107f809d8407bbb103832c6b2da33bb73660678eb3b2c8e188d3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
