class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1169.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1169.0/snyk-macos"
    sha256 "c1169ed6e070e7705cdb133be729e42ae1812f8ce4b94e82195ed6140e9fb2e2"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1169.0/snyk-linux"
    sha256 "6d4da542f01072086ba15baafc65e239fd84fd9fd03e052abdee7305f9f52d6f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
