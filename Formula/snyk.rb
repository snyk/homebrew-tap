class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.980.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.980.0/snyk-macos"
    sha256 "bed74c325c1bb627bdfa883011b0971a86597e428bef3037501e30d95439eec0"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.980.0/snyk-linux"
    sha256 "72b93763016105a17003f10fe96cb1a64aaed967d8f90a9114455badea072132"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
