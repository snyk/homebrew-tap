class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.984.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.984.0/snyk-macos"
    sha256 "8e2d87180ed8eab89d9571124e1e02fde8293ac720448a1485eb7ab4aece5c58"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.984.0/snyk-linux"
    sha256 "f7c7c10306b2b4354d0a7bc1b304015abb293d41183a458ada51e82e8c11e4eb"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
