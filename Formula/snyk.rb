class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.806.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.806.0/snyk-macos"
    sha256 "889d35b6d5d898a24b4078b3e7e01cf0f312253dbc74425fb47682715541acad"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.806.0/snyk-linux"
    sha256 "3ff2c8cdb522945faf36b2db42b5b4feb4b3212634660d35f546e3692786b697"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
