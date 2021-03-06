class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.473.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.473.0/snyk-macos"
    sha256 "eab798d5df67c018bb1d0ae19adcd30c03fcabba3bc3cbc33a8e7d6daea36e6b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.473.0/snyk-linux"
    sha256 "f3b2eb6ac7a73e1597c2b651b10ba468ebb0429a542332bfb39f03d47b344282"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
