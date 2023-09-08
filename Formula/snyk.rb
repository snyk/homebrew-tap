class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1214.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1214.0/snyk-macos"
    sha256 "a2a07354ceca1a66484765db9e228a8cffd04277cd5aeb3d4a22308d682a7dea"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1214.0/snyk-linux"
    sha256 "fe8aaabf261be4b4c87cec25eae4828c5a706ba87d69fde78e25556e9e69f3c1"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
