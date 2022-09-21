class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1008.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1008.0/snyk-macos"
    sha256 "2a1d544a14f12f4839ad544ef68446528d6f493bbced3b650a4434e607e71170"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1008.0/snyk-linux"
    sha256 "a8f829b97790ae85eb9bb3152182d9a1de9bef82700b4ca30b5a1f62b82fd73a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
