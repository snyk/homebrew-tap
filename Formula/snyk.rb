class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.924.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.924.0/snyk-macos"
    sha256 "bed06f5f309cabec1f11b8223b5fb5eef92432675b3924e0a54229c5603c62d2"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.924.0/snyk-linux"
    sha256 "4480309172d558c29efc1bed8757845803751cbc9a83d25c3ee192731fae4a99"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
