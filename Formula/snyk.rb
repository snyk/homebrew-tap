class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.886.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.886.0/snyk-macos"
    sha256 "8232e360fad7f6cedbd9441466af74aeb6e9e573dd8a9efaa1b8ee395b87b461"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.886.0/snyk-linux"
    sha256 "b2f05b44114706f08b4ab2fbb1810c352371402df7d3ae4c1636ca4779829445"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
