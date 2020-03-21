class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.301.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.301.0/snyk-macos"
    sha256 "70fe4b26db87c1b2d9b0df4efaa927846375e22c725ff58588fc0f9cc8d30f3b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.301.0/snyk-linux"
    sha256 "1e6d6993156ea1793424daf0217e50904c34e194390d81797155cd89e23faa6a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
