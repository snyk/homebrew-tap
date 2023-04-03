class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1136.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1136.0/snyk-macos"
    sha256 "ce934bb1c31758842fdce9b9f48d3a2377efa125c2650c87637082d619dd1400"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1136.0/snyk-linux"
    sha256 "5c30fa0c2a5d5029a7356b342f5a1c485bc50a82107c5ba2f30eb5ac8f6633ed"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
