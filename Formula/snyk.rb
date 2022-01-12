class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.824.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.824.0/snyk-macos"
    sha256 "08aec572537a48ab942a620a000e6f8374fb6921634616b76daaef3cab87c05c"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.824.0/snyk-linux"
    sha256 "4f4d9b4c69d62efef6f0e2917e7b99e4ffdbba76a1be0e024688c776200c9faf"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
