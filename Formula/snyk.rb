class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.676.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.676.0/snyk-macos"
    sha256 "a39a5a11791e8e1d96324772df86b4ea16929392d2d2b2d79227f634ee1eeef8"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.676.0/snyk-linux"
    sha256 "d3c9e6f295b74d4d795bbdbec94e14067d07e1c8bda18d042fb15755fb151cc8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
