class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.742.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.742.0/snyk-macos"
    sha256 "2ea209f6fdc11de2a53a46848a552345a01f698888c0191b233f72c8d3f9a99e"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.742.0/snyk-linux"
    sha256 "a1d697a13ca2fe92ce811cb9a11639c69e241873b2d9547f565c4b849b8fbd2d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
