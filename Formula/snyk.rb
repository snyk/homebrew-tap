class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1202.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1202.0/snyk-macos"
    sha256 "3bac2aee679e4cde829858f6627798347fee332f21a2b5707e5c96b8bdd1fd4e"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1202.0/snyk-linux"
    sha256 "8ac76c8a44c5d916b27335ebbb031011eb9a2dee8acd6cd7dc1157d41b7d73f3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
