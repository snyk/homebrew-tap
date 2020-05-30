class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.332.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.332.1/snyk-macos"
    sha256 "b6f4ce27cecb165762c9e5ed65b1fbc1bf42b509edfd11cc0b67d122dfb1209e"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.332.1/snyk-linux"
    sha256 "977599697079dfb7fb1ced9e83f4b4e8f54c76d958e0fce73282d3a1f481c67c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
