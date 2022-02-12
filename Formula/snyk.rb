class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.852.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.852.0/snyk-macos"
    sha256 "8a859360f4a893f5a67a10c6d5d7cbc0abbbc88f408f4a979487963ce32a1c9e"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.852.0/snyk-linux"
    sha256 "08b859b33925eb3af01ab41c25ae2dd3aecf20ee031eb4557e27ddf16ccc29cb"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
