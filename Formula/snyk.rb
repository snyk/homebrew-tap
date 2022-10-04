class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1020.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1020.0/snyk-macos"
    sha256 "9035d52960c1e666e2a4d4cdd62451d9c56cf294beb1e37e919b08177de3fccc"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1020.0/snyk-linux"
    sha256 "82891c0f0517832d6019713f08faa4725ffb9ec69b6c743e164ea4ca3819d7a1"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
