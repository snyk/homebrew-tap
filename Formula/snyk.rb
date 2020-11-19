class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.428.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.428.0/snyk-macos"
    sha256 "541a9529154332e1c975616b479d346f41708c9fbdb9f9424adf295f58c141d3"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.428.0/snyk-linux"
    sha256 "e1a0f3d0bd5271d8ee923f9c4196d71c6638fb032f0a01d0060e4c2cdeaf60b0"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
