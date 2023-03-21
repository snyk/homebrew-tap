class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1122.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1122.0/snyk-macos"
    sha256 "180f576a441bac1a527457e69a0bd511b75135dc663b7a0e1f7609c2045a073a"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1122.0/snyk-linux"
    sha256 "9b5f3b19bec01789c11dc55c0e05ca504698c318adc88333ab947aa402650fa4"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
