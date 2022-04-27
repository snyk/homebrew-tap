class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.913.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.913.0/snyk-macos"
    sha256 "ddadf6e079ffa43cb03fc6b9e08decb20b4957c9e3430ec6c1a78f13b147b9d2"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.913.0/snyk-linux"
    sha256 "4e1338c4164d6ebdd097bc8441eda10cbae6e1521df414cd3a4b8cdac8ce4b21"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
