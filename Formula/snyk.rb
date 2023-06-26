class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1185.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1185.0/snyk-macos"
    sha256 "6553eb8d41312e8f201e501c642864eb3a0b32bf764eaa2ad825aaa0dfee4973"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1185.0/snyk-linux"
    sha256 "fe301975943e9c7c9b82cc8958f108796b425057bd81ea17ab3b8018b1c9a09d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
