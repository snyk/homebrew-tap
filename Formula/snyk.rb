class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1228.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1228.0/snyk-macos"
    sha256 "63c6403fe1ab43db133164c9380a71f15f626456b8ead6943473d32a3ce0d9aa"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1228.0/snyk-linux"
    sha256 "e9b0641ab1ec0cf6e63e6b98c01e2d8a63de26b5dcee6378e3d32484cc7f436d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
