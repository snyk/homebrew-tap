class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.792.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.792.0/snyk-macos"
    sha256 "c4fe01af898b01e64aabb03736d0b045ae334d370fc3fb2c0cca03f2b3c15a15"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.792.0/snyk-linux"
    sha256 "61de22c1de4b1b281301e9163d8a891195d25902aacc27e120862e9de3213199"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
