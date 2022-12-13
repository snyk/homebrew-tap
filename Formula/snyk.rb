class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1071.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1071.0/snyk-macos"
    sha256 "bbbc19ebbf42a11558a4f9b8e282a693dd77d7c66dd030b9ea2478924a94b67e"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1071.0/snyk-linux"
    sha256 "848e7c83f6e89e69e968bd95adb3925894a46157e8e0bb1cef2fde3b8ab10030"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
