class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1049.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1049.0/snyk-macos"
    sha256 "48dfbd902956ad8bd403b1893ebd49f574d0e351311a28fb18f1450be22d45d3"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1049.0/snyk-linux"
    sha256 "ed29d301ee3b91e0d9b194e85742a96f959375e3d7fecbf580d5f7f0ab79033d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
