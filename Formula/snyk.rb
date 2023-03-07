class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1114.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1114.0/snyk-macos"
    sha256 "1ad461613554d1898efaf6d246a541625ced0464bfb84581ee64236078efade4"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1114.0/snyk-linux"
    sha256 "1f93b81367abe0e687b6baa5756d9dd366fd4fe7b69a6053f2e8ec5b2a6e6497"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
