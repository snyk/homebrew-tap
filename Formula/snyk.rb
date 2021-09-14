class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.709.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.709.0/snyk-macos"
    sha256 "1cf07a792ab04edf58ac5f4ceaecd47055034ea466219f3fd46ea504a4a9f1da"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.709.0/snyk-linux"
    sha256 "cc7040495799c1ec2f8526d61643e868426c0b6e5a488006b7ff3e3625569a4d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
