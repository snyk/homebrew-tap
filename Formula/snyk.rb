class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1139.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1139.0/snyk-macos"
    sha256 "fb7bdbdad802531fdec3444a74c71e03b474ed1ea6c43eb1643b15364cd03768"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1139.0/snyk-linux"
    sha256 "0b2fbad0bbf8ee9b900de47ad8a2a052f660f8837f5d2e5549b1360d61595c67"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
