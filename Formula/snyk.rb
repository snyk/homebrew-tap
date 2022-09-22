class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1009.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1009.0/snyk-macos"
    sha256 "20f9a274ddd9cc5e63bab5a594142a1ba42f4ae2e94c647e2e2b6948e115a15c"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1009.0/snyk-linux"
    sha256 "d1d725bd60a1b08a33209b517062d8c992905754f7562f655662ec284944d6d0"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
