class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.382.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.382.0/snyk-macos"
    sha256 "efe82d250f5eabcead2c6f37b7255f617d6531f6b9c825952ddc04fd0da99d88"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.382.0/snyk-linux"
    sha256 "8dd7aa658439a69d00c7826e9937a1ebfe9748d4975d9d74f50706c77dfaacab"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
