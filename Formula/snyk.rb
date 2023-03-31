class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1131.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1131.0/snyk-macos"
    sha256 "b6bda92cc2425019ffe59709139ca8357c3d259e39d83d829c335ec3235159a5"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1131.0/snyk-linux"
    sha256 "2dfda2b9cab47efe4f6e135c9a60f14ad1c4ac4cccc0b0f17b440791edf4ac87"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
