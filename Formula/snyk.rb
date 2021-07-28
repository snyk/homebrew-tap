class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.668.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.668.0/snyk-macos"
    sha256 "0f19bbc31258a0d9fecb130f06497bede47c89be9018b57e9199563f338c5cd2"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.668.0/snyk-linux"
    sha256 "4c881041b93891550ff691d7c24a027a8d2afb427ee963339d026a9353f43065"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
