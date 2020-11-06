class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.424.4"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.424.4/snyk-macos"
    sha256 "1a96defcb5c4c7d2fec7fcb0ea95c30f8621c7599443e99a89da9d2ffbdc1d15"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.424.4/snyk-linux"
    sha256 "a5f2d472f265a4398393eb675d39a04b4a4c440b288d59867d706ee1cf3f9809"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
