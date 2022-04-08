class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.898.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.898.0/snyk-macos"
    sha256 "b5185b3e35e227e3be9a2e459962b38ee1253413a0779701ec36d3da2c0049b8"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.898.0/snyk-linux"
    sha256 "04afa051457d6ba98c634a17703aa9d87f73e052d5415980cd16f1f6356930c5"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
