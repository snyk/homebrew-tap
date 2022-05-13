class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.928.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.928.0/snyk-macos"
    sha256 "91fcf3e8195a1553f1040c272d24d7541f670b5c05620b7739f1578807e28881"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.928.0/snyk-linux"
    sha256 "8565d1796f4fe1c915ad16db1b0a994930bd5840347f8a0cab93d9487398c26e"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
