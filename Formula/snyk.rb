class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.900.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.900.0/snyk-macos"
    sha256 "4be6e6a233191ad1c205ad8b7dbba8c7206a5a61aef3e3a538c55224316bda6d"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.900.0/snyk-linux"
    sha256 "2be9974e607813924fedfe17732c85092aef2e49342372e21ec112c6473a14c4"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
