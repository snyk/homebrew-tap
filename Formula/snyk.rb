class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.834.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.834.0/snyk-macos"
    sha256 "a472a7689dce7e062bcd91d509a0943666cffc4c8ce6db1b82ac97e195ca2709"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.834.0/snyk-linux"
    sha256 "5e358c5798526b6ba943d92aa51dde1c4eff311db2af163a99f9a185bc5ffdc9"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
