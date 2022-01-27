class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.838.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.838.0/snyk-macos"
    sha256 "33f65baa53a3d9f0b1406225ed215e802be94bd429c5141ef21cc5ce16daedb6"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.838.0/snyk-linux"
    sha256 "c52363013e21413c65e6b839c5ff5355c3c4ffc12b168e9c365a63b0c09ea4c8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
