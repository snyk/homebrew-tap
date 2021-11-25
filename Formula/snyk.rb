class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.773.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.773.0/snyk-macos"
    sha256 "87f10b62c5d088c7328872d6a2df44c5d07f856d2a5d4e907125971ebba1a347"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.773.0/snyk-linux"
    sha256 "976f30dd72b61df72508354df0aa3ca2c7249bc496e930111d33c1dfb3c8c8ae"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
