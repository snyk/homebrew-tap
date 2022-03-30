class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.889.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.889.0/snyk-macos"
    sha256 "e1ce73f9aaa0ab39aa42b43129bc918bd669c8a322c70a393ace60ccca4cb590"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.889.0/snyk-linux"
    sha256 "051d40535a451a5eee15dc22e27e44e1a03d6f4cab155e2b3bc66288b1f8604d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
