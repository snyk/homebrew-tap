class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.438.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.438.0/snyk-macos"
    sha256 "ae4e37ac5bed67d799782e6b30bbcc138897959c38da49346db56de67debedee"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.438.0/snyk-linux"
    sha256 "269e8cd0d6ce59124c7b2a21eb8fe3adef36c9498e872e139cc9f0678ceaf5eb"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
