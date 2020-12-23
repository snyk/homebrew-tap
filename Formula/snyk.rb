class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.437.3"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.437.3/snyk-macos"
    sha256 "06eef9a02b2edd79a95b27e2bdd9f54d0ead701151c4e929a704a52a6f8f31eb"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.437.3/snyk-linux"
    sha256 "44c87920a6b6291c7938122b0377c4f69c667028d012ff3e62c6bbf28957f8fb"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
