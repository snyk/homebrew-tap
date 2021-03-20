class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.502.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.502.0/snyk-macos"
    sha256 "8a8ec619cdae5e00ca5ff05e998f96845c47dfaf823d07d62ff99c96698e0597"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.502.0/snyk-linux"
    sha256 "1bb82f19f0289441acba8616b6026e7f970b100f0ecb6d207b0ad64f0de882f0"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
