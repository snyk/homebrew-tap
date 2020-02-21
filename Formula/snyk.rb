class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.294.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.294.1/snyk-macos"
    sha256 "3647e480b8cc36f3a8e90efe560e729597066bfe516a86a62e0049391c3678d6"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.294.1/snyk-linux"
    sha256 "e9a788a100ecca40ab25a895835ae6ff32fa2f0ad326d23001ea005b395a926b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
