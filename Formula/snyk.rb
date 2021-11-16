class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.763.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.763.0/snyk-macos"
    sha256 "a078cc8f2aa1c505ff443730048df2602b39cbf4171b1ecb687c89b9847ecf04"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.763.0/snyk-linux"
    sha256 "a2f0a7614d9ffb7000deef199d35d9be5653cf6af763d8f5b41e85a7292138fa"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
