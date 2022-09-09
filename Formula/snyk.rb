class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1000.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1000.0/snyk-macos"
    sha256 "8aa5158a35b3761be67a7ea096265016ad6de5c61a1cd7b2bd907d4aea047a09"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1000.0/snyk-linux"
    sha256 "a6cb9804ff368a79294cc64546668a3e515b7324e1093300089658994c541213"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
