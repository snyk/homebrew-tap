class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.981.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.981.0/snyk-macos"
    sha256 "014495afc65415971f5b90ec64b6b55cb91bfd60efdc45067064d4d3f06f9896"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.981.0/snyk-linux"
    sha256 "53560810374ca56d2145e2e4fe94e2203e4a9c66517b249a1dc5f7ca6a1f44ff"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
