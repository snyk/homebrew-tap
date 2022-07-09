class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.966.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.966.0/snyk-macos"
    sha256 "4ba2ea7333ac3f823d22f9173f46bd8121f1e14f211d77a445873d8489303942"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.966.0/snyk-linux"
    sha256 "a1812974d22f89428507fb244a478e690d9a8f69d717c4e17524b4d6b123d950"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
