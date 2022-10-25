class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1041.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1041.0/snyk-macos"
    sha256 "df03e816fa23fdbcc1a3956ca6a2f84214513578e0bc9663efe3331f86ac6f41"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1041.0/snyk-linux"
    sha256 "0a4040df7d65e17c9ff288a61c6dad0a10580c3ec3a8f582c18bce4d1855cf4c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
