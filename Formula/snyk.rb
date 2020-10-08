class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.410.3"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.410.3/snyk-macos"
    sha256 "a61ca85c75d096c42fb3b3cb37972ce75d07fbf87452654ad7e88a620592b48b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.410.3/snyk-linux"
    sha256 "9dba1be05376b716cc2cfff8111d30a7d5dd5c0184f51d84cc72e2b7babe96ba"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
