class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.906.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.906.0/snyk-macos"
    sha256 "89f8e03e185d1e1994ae90035d3842019b19978607a15f1fe648f725601fbb7a"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.906.0/snyk-linux"
    sha256 "a850e8a1b64c90628c88287c8abd139b40ad6314c77ea24d56f3ef174059dc3c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
