class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.392.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.392.1/snyk-macos"
    sha256 "6decb76cd24785eb9183113c6694eb182b3463e9ee8631e70d7797bc0afb03c2"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.392.1/snyk-linux"
    sha256 "cf3cf3c6e8712c93514f129f6cf69adeb24297dbc7528c8d081f22188f64c431"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
