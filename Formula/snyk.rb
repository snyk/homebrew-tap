class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.912.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.912.0/snyk-macos"
    sha256 "c5761b9704bfe8d793001cd183cd84d39c12ca5cad674758aa3b747ec73d8df8"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.912.0/snyk-linux"
    sha256 "956027e8f417df8203da7e614045a7255de0da418ae3ce4664b8eb6fba7b392b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
