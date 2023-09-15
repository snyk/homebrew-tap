class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1220.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1220.0/snyk-macos"
    sha256 "07d0fe80f251d0a48db5ded826090e637817e4fface5e2779f23792d8c43d17a"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1220.0/snyk-linux"
    sha256 "beb609e3593d1ae030808325b53a2a8323fcc843ee95116dd09f289e8dcd5560"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
