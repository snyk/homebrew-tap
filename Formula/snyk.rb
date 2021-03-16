class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.489.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.489.0/snyk-macos"
    sha256 "ba44dcb6439cde8c9bfca7238e7f6c2ce2e8708b3359cf923b82d5b2e84671c0"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.489.0/snyk-linux"
    sha256 "a8764c3a4008139faefa66b73332b9983d4a35046f380a6ea4141dc294dd2a4b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
