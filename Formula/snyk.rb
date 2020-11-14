class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.426.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.426.0/snyk-macos"
    sha256 "d34845f821acc9dc256c37f68852895d64a61aaf37ee2c26dfe2e55e8c1bd8ae"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.426.0/snyk-linux"
    sha256 "a29a7cab6679c8559322d1bfabb69dd41318951b9aa9273ee1a695e189f7d090"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
