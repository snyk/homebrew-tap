class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1215.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1215.0/snyk-macos"
    sha256 "3ae1484ae9eb2e64a7e1c775847faa845018445db5da69de7bbcd8e4e36cf599"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1215.0/snyk-linux"
    sha256 "f4654dc59bb014582bacac06eee324a9432e4a3a4fad51d54a9afa1fcc9ca35a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
