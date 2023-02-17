class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1105.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1105.0/snyk-macos"
    sha256 "7461ab3a7f18654625dfb85d5b7c33febb8bc030b7a895c51362927df1e845eb"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1105.0/snyk-linux"
    sha256 "58537499917d374d86990821e56680ac1c2ff3080f2cb214c59bdd6e80cd3144"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
