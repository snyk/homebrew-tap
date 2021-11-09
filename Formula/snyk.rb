class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.757.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.757.0/snyk-macos"
    sha256 "d91c672d9d2656b21887417956581c450610424128dd84c0853dd2a230fb6578"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.757.0/snyk-linux"
    sha256 "245e3ba2765a0c2245f60b825be48fe9abd42c41a7e3302f1312d21886bb33cf"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
