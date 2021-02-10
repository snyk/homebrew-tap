class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.448.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.448.0/snyk-macos"
    sha256 "938716e1ba873a866d661cc26ba3f73305ed6fc39522250eac282a13f9881945"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.448.0/snyk-linux"
    sha256 "aaf1cf886c7ca10bba7876c32434e2496e49c618fc1e1afa39a276d9a4292148"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
