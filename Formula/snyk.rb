class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.683.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.683.0/snyk-macos"
    sha256 "5b91cd249dee5f07c1bf5266a6eb248499074a16304e6283d2c052f013a7a935"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.683.0/snyk-linux"
    sha256 "bae1b23cf512e44a31202ae27b7606228c9864fe7a4f3ccaf18cb025045bb9a8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
