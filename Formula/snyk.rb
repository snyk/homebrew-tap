class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.727.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.727.0/snyk-macos"
    sha256 "1defeb46f6c847530f20b5e8d8ce253cad7c6667d6c245cb9eea44b4b8122287"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.727.0/snyk-linux"
    sha256 "3673f56cac77a18f871356b32f681e2b0486f825bea09cd8d3af67ccc4156c88"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
