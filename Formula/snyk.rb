class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1147.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1147.0/snyk-macos"
    sha256 "1ed5bd09569d3ee418c726da815630472d9966c74f9cf45fd30b024322459ac6"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1147.0/snyk-linux"
    sha256 "a809281e43488f74eaebe935e4fe3cd281be5f515ff65644b61de3fc20a73560"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
