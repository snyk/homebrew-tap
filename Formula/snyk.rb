class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1188.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1188.0/snyk-macos"
    sha256 "4f9c489125c55b8dc2786f8cc89332c9b0b7f130545d07136ff03cfdb58f1f41"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1188.0/snyk-linux"
    sha256 "0c3e48435fdfdc08e4454e5b9fb94c18ee9f83bc37e3c144855827e61b980ff9"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
