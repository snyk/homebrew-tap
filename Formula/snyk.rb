class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.748.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.748.0/snyk-macos"
    sha256 "085969dc74dd61c5f8070692d6904214c546f4081e7deafcb19dd6c1821984c2"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.748.0/snyk-linux"
    sha256 "2bcd89409b833a621cdf8931f43eb2c3637bd7d74f99dc1a14bb081c6bf00765"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
