class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.675.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.675.0/snyk-macos"
    sha256 "577a12685d499598eeef9c2d62d89c65012923611bbc9ef4db36525c5ae2545e"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.675.0/snyk-linux"
    sha256 "72b469033e93cab30301e0688cdd7cb8a62f1871019a5393473eba097e345604"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
