class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.976.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.976.0/snyk-macos"
    sha256 "6cce07731779d4e9a9e84bc0ea7e7af7f3d8c94c760bddb3f28ebc8f402e93ad"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.976.0/snyk-linux"
    sha256 "c7b5502448cc09d27ea2ff3bb91fc84db5662b06ab778cff28ebc4b6736ef581"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
