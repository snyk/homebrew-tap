class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.359.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.359.0/snyk-macos"
    sha256 "4466e4543020cebd94f5210f73f8d689985101478a130c27979afd5300dce0ef"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.359.0/snyk-linux"
    sha256 "a55f3cd8d7547e0670cb46a48ee21aea3b07eec4732f219f92cde6f52db085a6"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
