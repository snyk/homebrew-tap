class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1198.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1198.0/snyk-macos"
    sha256 "d9e9acf84da555fc9350336cf4e469c5d5fca0d5132fc703804e0e335f718a59"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1198.0/snyk-linux"
    sha256 "0aee0ed0d8a5aee6def964fc1a799857ca26ff664dddf6b8a0e9a5bb8acd65b7"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
