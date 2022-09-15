class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1005.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1005.0/snyk-macos"
    sha256 "4b5f2add9d430b86b458bc7f5477e9727f5f399331ff7dd4736dcefe750a007e"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1005.0/snyk-linux"
    sha256 "502662ff8da5353cc0c6bdd9320680bdf48234e8e9a0c9410725d233e86bbda4"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
