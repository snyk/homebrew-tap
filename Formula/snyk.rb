class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.908.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.908.0/snyk-macos"
    sha256 "c5ecf38debaf6e97632a9c500cb357b1633f4370f4fcaa7ed9d882815a4ebf37"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.908.0/snyk-linux"
    sha256 "ca56d27297e0583204214e7b1ae78290c902912a1fcff31764a906b11105ba36"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
