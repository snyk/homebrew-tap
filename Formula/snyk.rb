class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.720.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.720.0/snyk-macos"
    sha256 "f92ba16ed99322b28747bf2240a43577123a93ec0e129e1576ff9e4de53e58f6"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.720.0/snyk-linux"
    sha256 "8927d1e57c3e94be585a8b5ae11c508d85ccc50b4ea4226461b941878d1c447b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
