class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.723.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.723.0/snyk-macos"
    sha256 "d4ebd33e9bb5ee7d0dd9b38e02bc56fba26552302c20fc21b6f7aad0186a155c"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.723.0/snyk-linux"
    sha256 "5f732c066a85139cafca9e62ab20dc7152db2e02a5324526747178a2ec65f17d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
