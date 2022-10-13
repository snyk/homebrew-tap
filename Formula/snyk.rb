class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1028.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1028.0/snyk-macos"
    sha256 "defc7f12e07ceef6a2ba0743039d42d82201f3fa2a10a486b5f7e64f87103cb7"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1028.0/snyk-linux"
    sha256 "71b6843b909887cb9bf39a190a00efcb50352b8788c8e7428cd051ac11c49b0a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
