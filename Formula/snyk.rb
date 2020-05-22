class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.323.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.323.2/snyk-macos"
    sha256 "611c4821c86ae14d5a81415566f0e480981807b6d2629703a1d407f402d68bb6"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.323.2/snyk-linux"
    sha256 "839f51950229cefe0e31674fd743c538b3837ad5b8cb5fa6f7b10d13c997801a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
