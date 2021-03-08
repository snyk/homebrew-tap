class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.474.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.474.0/snyk-macos"
    sha256 "6d03abad5d4f73db1677fb58007f0d23a460b86e146b2360ce11ed09163c7e34"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.474.0/snyk-linux"
    sha256 "968133a527272d28fb5e0e7918c2a7543625023f8760ca92f3a5f21250e75587"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
