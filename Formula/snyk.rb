class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.809.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.809.0/snyk-macos"
    sha256 "f8c065d96194bb1611ec1bd6ca0339a3b92d0fa5465cd7a89ace808a61714a80"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.809.0/snyk-linux"
    sha256 "f23b4cd715c1699abbc570e2e119ef16c41f13f4f96a2af8037f767ae59640a3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
