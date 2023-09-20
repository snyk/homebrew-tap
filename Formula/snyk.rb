class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1225.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1225.0/snyk-macos"
    sha256 "634052d85b795b360f04c434d10be4ded87456c6450948e5fcc3b093db32b778"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1225.0/snyk-linux"
    sha256 "9f7574fcfa15ab454adddcd38248c3d57da2275ff609c9dd93990919cabeae96"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
