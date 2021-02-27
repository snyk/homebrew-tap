class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.461.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.461.0/snyk-macos"
    sha256 "0d28d29d5a71e5e52858ae76fc7bf90804160f3dcd880ba82bc6a2ea6374078e"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.461.0/snyk-linux"
    sha256 "5dcd38bbadbd8679d24c575d8eaa166deb14249b5292c3e5004fa6c24f94c9d9"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
