class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1037.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1037.0/snyk-macos"
    sha256 "755aafe01f37dda281f76b43bacb74fe7f5090110e45e9c82873a6d3f6a6e029"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1037.0/snyk-linux"
    sha256 "daf93cc3e7d8c718bd7db35608ec430939525a58db987f9811980cac910277fb"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
