class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1211.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1211.0/snyk-macos"
    sha256 "ea96eb57d6e7e7bdd7d75bcb42dd1ceaa571fcb8130b81e1ed273bc99c5b7ed4"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1211.0/snyk-linux"
    sha256 "8953e4166f1b4cb6e87d8df29cdc167682728fd2351c010a71ead74d3ad254e8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
