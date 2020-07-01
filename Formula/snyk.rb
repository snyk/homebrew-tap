class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.355.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.355.0/snyk-macos"
    sha256 "627ee86d3ab189d15567a0cca634b2e7f3ac70ef45dac3fc2c23947a7e11a18a"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.355.0/snyk-linux"
    sha256 "19fdb91cd65f2102fd94d5de84f43bdb385b5f91b201475a7868672cda45c7f2"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
